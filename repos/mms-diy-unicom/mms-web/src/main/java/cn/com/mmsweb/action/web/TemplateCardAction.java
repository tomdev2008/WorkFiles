package cn.com.mmsweb.action.web;


import java.rmi.RemoteException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.common.Page;
import cn.com.mmsweb.action.util.SessionUtils;
import cn.com.mmsweb.service.CardTypeService;
import cn.com.mmsweb.service.CommonService;
import cn.com.mmsweb.service.HotBillBoardService;
import cn.com.mmsweb.service.NewBillBoardService;
import cn.com.mmsweb.service.TemplateCardService;
import cn.com.mmsweb.vo.CardVo;
import cn.com.mmsweb.vo.TemplateCardtVo;

import com.unicom.mms.entity.TbHotBillboard;
import com.unicom.mms.entity.TbNewBillboard;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.entity.TbUsers;

public class TemplateCardAction extends BaseAction<TbTemplateCard, String>{
	
	private static Logger log = Logger.getLogger(TemplateCardAction.class);

	@Autowired(required=true)
	private TemplateCardService templateCardService;
	@Autowired(required=true)
	private CardTypeService cardTypeService;
	@Autowired(required=true)
	private HotBillBoardService hotBillBoardService;
	@Autowired(required=true)
	private NewBillBoardService newBillBoardService;
	
	private List<TemplateCardtVo> templateCardList;
	private List<TbHotBillboard> hotBillBoardList;
	private List<TbNewBillboard> newBillBoardList;
	private CardVo cardVo;
	
	private int pageNo = 1; //当前页
	private int pageSize = 4; //页大小
	private String templateCardType;
	
	
	/**
	 * 
	* 方法用途和描述:查询全部模板明信片
	* @return
	* @author chenliang 新增日期：2013-4-19
	* @since mms-web
	 */
	public String listTemplate(){
		Page<TbTemplateCard> cardPage = new Page<TbTemplateCard>();
		cardPage.setPageSize(pageSize);
		cardPage.setPageNo(pageNo);
		templateCardList = templateCardService.findAllTemplateCard(cardPage);
		hotBillBoardList = hotBillBoardService.findAll();
		newBillBoardList = newBillBoardService.findAll();
		log.debug("list:"+list+",hotBillBoardList:"+hotBillBoardList+",newBillBoardList:"+newBillBoardList);
		return SUCCESS;
	}
	
	/**
	 * 
	* 方法用途和描述:根据id查找板明信片
	* @return
	* @author chenliang 新增日期：2013-4-19
	* @since mms-web
	 */
	public String findById(){
		cardVo = templateCardService.findById(getModel().getId());
		log.debug("cardVo:"+cardVo);
		return successInfo("ok");
	}
	
	/**
	 * 
	* 方法用途和描述: 发送模板明信片
	* @return
	* @author chenliang 新增日期：2013-5-7
	* @since mms-web
	 */
	public String sendCardMessage(){
		 HttpSession session = getHttpSession();
		 TbUsers users = (TbUsers) session.getAttribute(SessionUtils.USER);
		try {
			templateCardService.sendCardMessage(cardVo,users.getMdn());
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return successInfo("ok");
	}
	
	/**
	 * 
	* 方法用途和描述: 根据某种类型查询模板明信片
	* @return
	* @author chenliang 新增日期：2013-5-11
	* @since mms-web
	 */
	public String pageTemplate(){
		Page<TbTemplateCard> cardPage = new Page<TbTemplateCard>();
		cardPage.setPageSize(20);
		cardPage.setPageNo(pageNo);
		templateCardList = templateCardService.queryTemplateCard(cardPage,templateCardType);
		hotBillBoardList = hotBillBoardService.findAll();
		newBillBoardList = newBillBoardService.findAll();
		log.debug("list:"+list+",hotBillBoardList:"+hotBillBoardList+",newBillBoardList:"+newBillBoardList);
		return SUCCESS;
	}
	
	
	public String getTemplateCardType() {
		return templateCardType;
	}

	public void setTemplateCardType(String templateCardType) {
		this.templateCardType = templateCardType;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<TbHotBillboard> getHotBillBoardList() {
		return hotBillBoardList;
	}

	public void setHotBillBoardList(List<TbHotBillboard> hotBillBoardList) {
		this.hotBillBoardList = hotBillBoardList;
	}

	public List<TbNewBillboard> getNewBillBoardList() {
		return newBillBoardList;
	}

	public void setNewBillBoardList(List<TbNewBillboard> newBillBoardList) {
		this.newBillBoardList = newBillBoardList;
	}

	public CardVo getCardVo() {
		return cardVo;
	}

	public void setCardVo(CardVo cardVo) {
		this.cardVo = cardVo;
	}

	public List<TemplateCardtVo> getTemplateCardList() {
		return templateCardList;
	}

	public void setTemplateCardList(List<TemplateCardtVo> templateCardList) {
		this.templateCardList = templateCardList;
	}

	@Override
	public CommonService getCommonService() {
		return templateCardService;
	}

	@Override
	public TbTemplateCard getModel() {
		if(null==model){
			model = new TbTemplateCard();
		}
		return model;
	}

	@Override
	public void setModel(TbTemplateCard model) {
		this.model = model;
	}

	@Override
	public String[] getIds() {
		return this.ids;
	}

	@Override
	public void setIds(String[] ids) {
		this.ids = ids;
	}
	
}
