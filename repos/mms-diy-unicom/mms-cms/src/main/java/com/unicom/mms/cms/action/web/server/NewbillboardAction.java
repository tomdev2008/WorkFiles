package com.unicom.mms.cms.action.web.server;

import org.apache.log4j.Logger;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;

import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.cms.service.NewbillboardService;
import com.unicom.mms.common.JSONString;
import com.unicom.mms.entity.TbNewBillboard;

/**
 * 最新推荐页面交互层
 * @author chenliang
 *
 */
public class NewbillboardAction extends BaseAction<TbNewBillboard, String> {

	private static final Logger LOGGER = Logger.getLogger(NewbillboardAction.class);
	
	@Autowired(required=true)
	private NewbillboardService newbillboardService;
	
	public NewbillboardService getNewbillboardService() {
		return newbillboardService;
	}

	public void setNewbillboardService(NewbillboardService newbillboardService) {
		this.newbillboardService = newbillboardService;
	}
	
	/**
	 * 分页查询
	 * @return
	 */
	public String findPage(){
		LOGGER.info("list model=" + Json.toJson(getModel()));
		this.pageList = newbillboardService.findByPage(getModel(), getPageInfo());
		JSONString<TbNewBillboard> jsonString = new JSONString<TbNewBillboard>();
		this.pageList.setResult(jsonString.listCrawl(pageList.getResult(), TbNewBillboard.class));
		LOGGER.info("list size=" + this.pageList.getResult());
		this.setSuccess(true);
		this.setMsg("成功");
		return "list";
	}
	
	/**
	 * 设置最新推荐
	 * @return
	 */
	public String add(){
		//System.out.println("ids:"+this.ids.length);
		newbillboardService.addNewBillBoard(ids);
		return successInfo("成功设置最新推荐！");
	}
	

	@Override
	public CommonService getCommonService() {
		return newbillboardService;
	}

	@Override
	public TbNewBillboard getModel() {
		if(null == this.model){
			this.model = new TbNewBillboard();
		}
		return this.model;
	}

	@Override
	public void setModel(TbNewBillboard model) {
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
