package cn.com.mmsweb.service.impl;

import java.rmi.RemoteException;
import java.text.ParseException;
import com.google.gson.reflect.TypeToken;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.base.constants.BusinessConstants;
import cn.com.common.BlankUtil;
import cn.com.common.Page;
import cn.com.common.Response;
import cn.com.mmsweb.action.util.SessionUtils;
import cn.com.mmsweb.dao.CardTypeDAO;
import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.TemplateCardDAO;
import cn.com.mmsweb.service.TemplateCardService;
import cn.com.mmsweb.vo.CardVo;
import cn.com.mmsweb.vo.TemplateCardtVo;

import com.google.gson.Gson;
import com.unicom.mms.constants.SharePublicContants;
import com.unicom.mms.constants.ToolUtil;
import com.unicom.mms.entity.TSignOrder;
import com.unicom.mms.entity.TbCardType;
import com.unicom.mms.entity.TbSendMmsQueue;
import com.unicom.mms.entity.TbSendSmsQueue;
import com.unicom.mms.entity.TbSendedMmsRecs;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.entity.TbUsers;
import com.unicom.mms.gateway.PostcardMMS;
import com.unicom.mms.mcp.webservice.Mcp;
import com.unicom.mms.mcp.webservice.McpServiceLocator;

@Service("templateCardService")
public class TemplateCardServiceImpl extends CommonServiceImpl<TbTemplateCard> implements TemplateCardService{

	private static Logger log = Logger.getLogger(TemplateCardServiceImpl.class);

	@Autowired(required=true)
	private TemplateCardDAO templateCardDAO;
	@Autowired(required=true)
	private CardTypeDAO cardTypeDAO;
	
	@Autowired(required = true)
	private UserServiceImpl userService;
	@Autowired(required = true)
	private SendMmsQueueServiceImpl sendMmsQueueService;
	
	@Override
	public CommonDAO<TbTemplateCard> getBindDao() {
		return templateCardDAO;
	}

	@Override
	public List<TemplateCardtVo> findAllTemplateCard(Page<TbTemplateCard> pageInfo) {
		String hql = "from TbTemplateCard where cardType.id = ? ";
		//查找所有模板类型
		List<TbCardType> list = cardTypeDAO.findAll();
		List<TemplateCardtVo> volist = new ArrayList<TemplateCardtVo>();
		for (int i = 0; i < list.size(); i++) {
			TbCardType cardType = list.get(i);
			Page<TbTemplateCard> templateCardPageInfo = templateCardDAO.findByPage(pageInfo, hql, cardType.getId());
			System.out.println("templateCardPageInfo.getResult():"+templateCardPageInfo.getResult());
			TemplateCardtVo vo = new TemplateCardtVo();
			vo.setId(""+cardType.getId());
			vo.setName(cardType.getName());
			vo.setTemplateCard(templateCardPageInfo);
			volist.add(vo);
		}
		return volist;
	}

	@Override
	public CardVo findById(Integer id) {
		TbTemplateCard card = templateCardDAO.findById(id);
		CardVo vo = new CardVo();
		vo.setId(""+card.getId());
		vo.setCardTitle(card.getCardTitle());
		vo.setCardTypeId(""+card.getCardType().getId());
		vo.setCardTypeName(card.getCardType().getName());
		vo.setCollectNum(""+card.getCollectNum());
		vo.setPicUrl(card.getPicUrl());
		vo.setStatus(""+card.getStatus());
		vo.setWishWord(card.getWishWord());
		vo.setxPosText(""+card.getxPosText());
		vo.setyPosText(""+card.getyPosText());
		vo.setWidthText(""+card.getWidthText());
		vo.setHeightText(""+card.getHeightText());
		return vo;
	}

	@Override
	public void sendCardMessage(CardVo cardVo,String sender) throws ServiceException, ParseException, RemoteException {
		//调用接口的保存方法
		Mcp mcp = new McpServiceLocator().getMcpPort();
		Gson gson = new Gson();
		if(!BlankUtil.isBlank(cardVo.getAddressId())){
			//根据发起人号码，查询产品号码
			TSignOrder signOrder = userService.findProductByMdn(sender);
			String[] addressIds = cardVo.getAddressId().split(";");
			String msgSn = ToolUtil.generateMsgSn(SharePublicContants.MMS); //消息id
			//是否选中发送时间
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			Date sendTime;
			//如果选择了发送时间，即把发送内容保存到彩信待发表中,通过任务扫描进行发送
			if(cardVo.getCheckBoxChetime()=="checked"){ //时间复选框
				sendTime = sdf.parse(cardVo.getDatetime());
				List<TbSendMmsQueue> queueList = new ArrayList<TbSendMmsQueue>();
				for (int i = 0; i < addressIds.length; i++) {
					TbSendMmsQueue sendMmsQueue = new TbSendMmsQueue();
					sendMmsQueue.setChannel(SharePublicContants.CHANNEL_WEB); //渠道
					sendMmsQueue.setCreateTime(new Date()); //创建时间
					sendMmsQueue.setMsgBody(cardVo.getWishWord()); //消息内容
					if("checked".equals(cardVo.getCheckBoxMusic())){ //背景音乐复选框
						sendMmsQueue.setMusicUrl(cardVo.getBgMusic()); //背景音乐
					}
					sendMmsQueue.setPicUrl(cardVo.getPicUrl()); //图片地址
					sendMmsQueue.setReciver(addressIds[i]); //接收人号码
					sendMmsQueue.setToBeSendTime(sendTime); //待发送时间
					sendMmsQueue.setTitle("来自"+sender+"的祝福"); //标题
					sendMmsQueue.setSendLevel(SharePublicContants.SENDLEVEL_PRIORITY);
					sendMmsQueue.setSponsor(sender); //发起人
					sendMmsQueue.setTransationId(msgSn);//消息id
					if(BusinessConstants.msg_type_templatecard == cardVo.getMsgType()){
						sendMmsQueue.setMsgType(SharePublicContants.GATEWAY_MSGTYPE_TEMPLATE_POSTCARDMMS);
					}else if(BusinessConstants.msg_type_diycard == cardVo.getMsgType()){
						sendMmsQueue.setMsgType(SharePublicContants.GATEWAY_MSGTYPE_DIY_POSTCARDMMS);
					}
					queueList.add(sendMmsQueue);
				}
				sendMmsQueueService.batchSave(queueList);
			}else{ //如果没有选择发送时间，则是实时发送，直接调用发送彩信的接口，进行发送
				//先把彩信发送内容保存到彩信待发送表中
				List<TbSendMmsQueue> queueList = new ArrayList<TbSendMmsQueue>();
				for (int i = 0; i < addressIds.length; i++) {
					TbSendMmsQueue sendMmsQueue = new TbSendMmsQueue();
					sendMmsQueue.setChannel(SharePublicContants.CHANNEL_WEB); //渠道
					sendMmsQueue.setCreateTime(new Date()); //创建时间
					sendMmsQueue.setMsgBody(cardVo.getWishWord()); //消息内容
					if("checked".equals(cardVo.getCheckBoxMusic())){ //背景音乐复选框
						sendMmsQueue.setMusicUrl(cardVo.getBgMusic()); //背景音乐
					}
					sendMmsQueue.setPicUrl(cardVo.getPicUrl()); //图片地址
					sendMmsQueue.setReciver(addressIds[i]); //接收人号码
					sendMmsQueue.setTitle("来自"+sender+"的祝福"); //标题
					sendMmsQueue.setSendLevel(SharePublicContants.SENDLEVEL_PRIORITY);
					sendMmsQueue.setSponsor(sender); //发起人
					sendMmsQueue.setTransationId(msgSn);//消息id
					if(BusinessConstants.msg_type_templatecard == cardVo.getMsgType()){
						sendMmsQueue.setMsgType(SharePublicContants.GATEWAY_MSGTYPE_TEMPLATE_POSTCARDMMS);
					}else if(BusinessConstants.msg_type_diycard == cardVo.getMsgType()){
						sendMmsQueue.setMsgType(SharePublicContants.GATEWAY_MSGTYPE_DIY_POSTCARDMMS);
					}
					queueList.add(sendMmsQueue);
				}
				sendMmsQueueService.batchSave(queueList);
				//拼接彩信发送对象				
				String receiver = ""; //接收人号码,以“,”分开
				for (int i = 0; i < addressIds.length; i++) {
					receiver += addressIds[i];
					if(i != addressIds.length-1){
						receiver+=",";
					}
				}
				PostcardMMS cardmms = new PostcardMMS();
				cardmms.setSender(sender); //发起人
				cardmms.setReceiver(receiver); //接收人
				cardmms.setContent(cardVo.getWishWord()); //内容
				cardmms.setChannel(""+SharePublicContants.CHANNEL_WEB); //渠道
				if(BusinessConstants.msg_type_templatecard == cardVo.getMsgType()){
					cardmms.setMsgType(SharePublicContants.GATEWAY_MSGTYPE_TEMPLATE_POSTCARDMMS); //消息类型
				}else if(BusinessConstants.msg_type_diycard == cardVo.getMsgType()){
					cardmms.setMsgType(SharePublicContants.GATEWAY_MSGTYPE_DIY_POSTCARDMMS); //消息类型
				}
				cardmms.setMsgSn(msgSn);  //消息id
				cardmms.setSubject("来自"+sender+"的祝福");
				cardmms.setImagePath(cardVo.getPicUrl()); //图片地址
				if("checked".equals(cardVo.getCheckBoxMusic())){ //背景音乐复选框
					cardmms.setMusicPath(cardVo.getBgMusic()); //音乐地址
				}
				cardmms.setProductCode(signOrder.getProductId()); //产品id
				//调用接口
				String json = gson.toJson(cardmms);
				String response = mcp.sendPostcardMms(json);
				Response resp = gson.fromJson(response, new TypeToken<Response>(){}.getType());
				LOGGER.info("Msg:"+resp.getMsg());
			}
		}
	}
	
	@Override
	public List<TemplateCardtVo> queryTemplateCard(Page<TbTemplateCard> cardPage, String templateCardType) {
		List<TemplateCardtVo> volist = new ArrayList<TemplateCardtVo>();
		String hql = "from TbTemplateCard where cardType.id = ? ";
		int typePkid = 0;
		if(!BlankUtil.isBlank(templateCardType)){
			typePkid = Integer.parseInt(templateCardType);
		}
		//查找所有模板类型
		TbCardType cardType = cardTypeDAO.findById(typePkid);
		if(!BlankUtil.isBlank(cardType)){
			//根据类型id分页查询模板明信片
			Page<TbTemplateCard> templateCardPageInfo = templateCardDAO.findByPage(cardPage, hql, cardType.getId());
			TemplateCardtVo vo = new TemplateCardtVo();
			vo.setId(""+cardType.getId());
			vo.setName(cardType.getName());
			vo.setTemplateCard(templateCardPageInfo);
			volist.add(vo);
		}
		return volist;
	}
	
}