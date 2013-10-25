package cn.com.mmsweb.action.web;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.common.Response;
import cn.com.mmsweb.action.util.SessionUtils;
import cn.com.mmsweb.service.CollectService;
import cn.com.mmsweb.service.CommonService;
import cn.com.mmsweb.service.HotBillBoardService;
import cn.com.mmsweb.service.NewBillBoardService;
import cn.com.mmsweb.service.TemplateCardService;
import cn.com.mmsweb.vo.CollectVo;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.unicom.mms.entity.TbCollect;
import com.unicom.mms.entity.TbHotBillboard;
import com.unicom.mms.entity.TbNewBillboard;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.entity.TbUsers;
import com.unicom.mms.mcp.webservice.Mcp;
import com.unicom.mms.mcp.webservice.McpServiceLocator;

public class CollectAction extends BaseAction<TbCollect, String>{
	private static Logger log = Logger.getLogger(CollectAction.class);
	
	@Autowired(required = true)
	private CollectService collectService;
	@Autowired(required=true)
	private HotBillBoardService hotBillBoardService;
	@Autowired(required=true)
	private NewBillBoardService newBillBoardService;
	@Autowired(required = true)
	private TemplateCardService templateCardService;
	private int pageNow=1;
	private int pageSize=10;
	
	private List<CollectVo> listCollect;
	private List<TbHotBillboard> hotBillBoardList;
	private List<TbNewBillboard> newBillBoardList;
	
	private int maxPage1;
    
    private String id;

     private String cardId;
     
   private String wishWord;
   
   
    
	public String getWishWord() {
	return wishWord;
}

public void setWishWord(String wishWord) {
	this.wishWord = wishWord;
}

	public TemplateCardService getTemplateCardService() {
		return templateCardService;
	}

	public void setTemplateCardService(TemplateCardService templateCardService) {
		this.templateCardService = templateCardService;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMaxPage1() {
		return maxPage1;
	}

	public void setMaxPage1(int maxPage1) {
		this.maxPage1 = maxPage1;
	}

	public List<CollectVo> getListCollect() {
		return listCollect;
	}

	public void setListCollect(List<CollectVo> listCollect) {
		this.listCollect = listCollect;
	}

	public CollectService getCollectService() {
		return collectService;
	}

	public void setCollectService(CollectService collectService) {
		this.collectService = collectService;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
    /*
     * 分页查询我的收藏
     */
	 public String query()
	 {
		 HttpSession session = getHttpSession();
		 TbUsers users = (TbUsers) session.getAttribute(SessionUtils.USER);
		 listCollect=collectService.queryByPage(pageSize, pageNow,users.getId());
		 maxPage1=collectService.maxPage(pageSize, pageNow,users.getId());
		 hotBillBoardList = hotBillBoardService.findAll();
		newBillBoardList = newBillBoardService.findAll();
		 return SUCCESS;
	 }
	 /*
	  * 删除
	  */
	public String deleteById()
	{
		try {
			List<TbCollect> list=new ArrayList<TbCollect>();
			TbCollect collect=new TbCollect();
			Mcp mcp = new McpServiceLocator().getMcpPort();
			Gson gson = new Gson();
			String[] ids = id.split(",");
			for (String strId : ids) {
				if(null!=strId)
				{
					collect=collectService.getByPk(Integer.parseInt(strId));
					TbCollect collect1=new TbCollect();
					collect1.setId(collect.getId());
					collect1.setCollectTime(collect.getCollectTime());
					TbTemplateCard tbTemplateCard=new TbTemplateCard();
					tbTemplateCard.setId(collect.getTemplateCard().getId());
					collect1.setTemplateCard(tbTemplateCard);
					TbUsers users=new TbUsers();
					users.setId(collect.getUsers().getId());
					collect1.setUsers(users);
					list.add(collect1);
				}
			}
			String jsonStr = gson.toJson(list);	
		try {
			  String res= mcp.collectionManage(jsonStr, 2);
			  Response response =  gson.fromJson(res,   
		                new TypeToken<Response>() {   
		            }.getType());  
			  if(response.getResultCode()==0)
			  {
				  return successInfo("ok");
			  }else {
				return successInfo("error");
			}
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	 /*
	  * 添加收藏
	  */
	public String addShouCang()
	{
		String str="";
		 HttpSession session = getHttpSession();
		 TbUsers users = (TbUsers) session.getAttribute(SessionUtils.USER);
		 if(null==users)
		 {
			 str="error";
		 }else{
		List<TbCollect> list=new ArrayList<TbCollect>();
		try {
			Mcp mcp = new McpServiceLocator().getMcpPort();
			Gson gson = new Gson();
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@"+cardId);
			TbTemplateCard card=templateCardService.getByPk(Integer.parseInt(cardId));
			TbTemplateCard templateCard=new TbTemplateCard();
			templateCard.setId(card.getId());
//			templateCard.setCardTitle(card.getCardTitle());
//			templateCard.setCardType(card.getCardType());
//			templateCard.setCollectNum(card.getCollectNum());
//			templateCard.setPicUrl(card.getPicUrl());
//			templateCard.setSmallPic(card.getSmallPic());
//			templateCard.setStatus(card.getStatus());
//			templateCard.setHeightText(card.getHeightText());
//			templateCard.setWidthText(card.getWidthText());
//			templateCard.setWishWord(card.getWishWord());
//			templateCard.setxPosText(card.getxPosText());
//			templateCard.setyPosText(card.getyPosText());
			TbCollect collect=new TbCollect();
			collect.setCollectTime(new Date());
			TbUsers users2=new TbUsers();
			users2.setId(users.getId());
			collect.setUsers(users2);
			collect.setTemplateCard(templateCard);
			list.add(collect);
			String jsonStr = gson.toJson(list);	
			 String res= mcp.collectionManage(jsonStr, 1);
			  Response response =  gson.fromJson(res,   
		                new TypeToken<Response>() {   
		            }.getType());  
			  if(response.getResultCode()==0)
			  {
				 str="ok";
			  }else {
				str="no";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 }
		return successInfo(str);
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

	@Override
	public CommonService getCommonService() {
		return collectService;
	}

	@Override
	public TbCollect getModel() {
		if(null==this.model){
			this.model = new TbCollect();
		}
		return this.model;
	}

	@Override
	public void setModel(TbCollect model) {
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
