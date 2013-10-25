package com.unicom.mms.cms.action.web.server;

import org.apache.log4j.Logger;
import org.nutz.json.Json;
import org.springframework.aop.target.HotSwappableTargetSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.cms.service.HotBillboardService;
import com.unicom.mms.cms.service.ipml.HotBillboardServiceImpl;
import com.unicom.mms.common.JSONString;
import com.unicom.mms.entity.TbHotBillboard;
import com.unicom.mms.entity.TbNewBillboard;

public class HotBillboardAction extends BaseAction<TbHotBillboard, String>{
	private static final Logger LOGGER = Logger.getLogger(HotBillboardAction.class);

	@Autowired(required=true)
	private HotBillboardService hotBillboardService;
	
	public HotBillboardService getHotBillboardService() {
		return hotBillboardService;
	}

	public void setHotBillboardService(HotBillboardService hotBillboardService) {
		this.hotBillboardService = hotBillboardService;
	}

	/**
	 * 分页查询
	 * @return
	 */
	public String findPage(){
		LOGGER.info("list model=" + Json.toJson(getModel()));
		this.pageList = hotBillboardService.findByPage(getModel(), getPageInfo());
		JSONString<TbHotBillboard> jsonString = new JSONString<TbHotBillboard>();
		this.pageList.setResult(jsonString.listCrawl(pageList.getResult(), TbHotBillboard.class));
		LOGGER.info("list size=" + this.pageList.getResult());
		this.setSuccess(true);
		this.setMsg("成功");
		return "list";
	}
	
	/**
	 * 
	* 方法用途和描述: 设置最热推荐
	* @return
	* @author chenliang 新增日期：2013-6-18
	* @since mms-cms
	 */
	public String add(){
		hotBillboardService.addHotBillboard(this.ids);
		return successInfo("成功设置最热推荐！");
	}
	
	@Override
	public CommonService getCommonService() {
		return hotBillboardService;
	}

	@Override
	public TbHotBillboard getModel() {
		if(null == this.model){
			this.model = new TbHotBillboard();
		}
		return this.model;
	}

	@Override
	public void setModel(TbHotBillboard model) {
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
