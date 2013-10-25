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
import cn.com.mmsweb.action.util.SessionUtils;
import cn.com.mmsweb.dao.CardTypeDAO;
import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.TemplateCardDAO;
import cn.com.mmsweb.service.TemplateCardService;
import cn.com.mmsweb.vo.CardVo;
import cn.com.mmsweb.vo.TemplateCardtVo;

import com.google.gson.Gson;
import com.unicom.mms.constants.SharePublicContants;
import com.unicom.mms.entity.TbCardType;
import com.unicom.mms.entity.TbSendedMmsRecs;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.entity.TbUsers;
import com.unicom.mms.gateway.PostcardMMS;
import com.unicom.mms.mcp.webservice.Mcp;
import com.unicom.mms.mcp.webservice.McpServiceLocator;
import com.unicom.mms.mcp.webservice.Response;
import com.unicom.mms.mcp.webservice.main;

@Service("templateCardService")
public class TemplateCardServiceImpl extends CommonServiceImpl<TbTemplateCard> implements TemplateCardService{

	private static Logger log = Logger.getLogger(TemplateCardServiceImpl.class);

	@Autowired(required=true)
	private TemplateCardDAO templateCardDAO;
	@Autowired(required=true)
	private CardTypeDAO cardTypeDAO;
	
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
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			Date sendTime;
			if(cardVo.getCheckBoxChetime()=="checked"){ //时间复选框
				sendTime = sdf.parse(cardVo.getDatetime());
			}else{
				sendTime = new Date();
			}
			String[] addressIds = cardVo.getAddressId().split(";");
			List<PostcardMMS> lists = new ArrayList<PostcardMMS>();
			for (int i = 0; i < addressIds.length; i++) {
				String addressId = addressIds[i];
				cardVo.getDatetime(); //发送时间
				PostcardMMS cardmms = new PostcardMMS();
				cardmms.setSender(sender);
				cardmms.setReceiver(addressId);
				cardmms.setContent(cardVo.getWishWord());
				cardmms.setChannel(""+SharePublicContants.CHANNEL_WEB);
				cardmms.setMsgType(SharePublicContants.GATEWAY_MSGTYPE_POSTCARDMMS);
				cardmms.setMsgSequence(""+4);
				cardmms.setSubject(sender+"为您发送的彩信");
				cardmms.setImagePath(cardVo.getPicUrl());
				cardmms.setImageType(""+SharePublicContants.IMAGES_JPEG);
				if(cardVo.getCheckBoxMusic()=="checked"){ //背景音乐复选框
					cardmms.setMusicPath(cardVo.getBgMusic());
				}
				cardmms.setMusicType(""+SharePublicContants.MUSIC_MIDI);
				cardmms.setProductCode("woaicaixin1222");
				lists.add(cardmms);
			}
			String jsonStr = gson.toJson(lists);
			//调用接口发送模板明信片
//			String responseStr = mcp.sendMms(jsonStr);
//			Response response = gson.fromJson(responseStr, new TypeToken<Response>(){}.getType());
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
