package com.unicom.mms.cms.action.web.server;

import org.apache.log4j.Logger;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;

import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.entity.TbCmsUser;
import com.unicom.mms.cms.entity.TbRole;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.cms.service.DecorationTypeService;
import com.unicom.mms.common.JSONString;
import com.unicom.mms.common.MD5;
import com.unicom.mms.entity.TbDecorationType;
import com.unicom.mms.entity.TbNewBillboard;

public class DecorationTypeAction extends BaseAction<TbDecorationType, String>{
	private static final Logger LOGGER = Logger.getLogger(DecorationTypeAction.class);

	@Autowired(required=true)
	private DecorationTypeService decorationTypeService;
	
	private TbDecorationType decorationType;
	
	public TbDecorationType getDecorationType() {
		return decorationType;
	}

	public void setDecorationType(TbDecorationType decorationType) {
		this.decorationType = decorationType;
	}

	public DecorationTypeService getDecorationTypeService() {
		return decorationTypeService;
	}

	public void setDecorationTypeService(DecorationTypeService decorationTypeService) {
		this.decorationTypeService = decorationTypeService;
	}

	@Override
	public CommonService getCommonService() {
		return decorationTypeService;
	}

	@Override
	public TbDecorationType getModel() {
		if(null == this.model){
			this.model = new TbDecorationType();
		}
		return this.model;
	}

	/**
	 * 分页查询
	 * @return
	 */
	public String findPage(){
		LOGGER.info("list model=" + Json.toJson(getModel()));
		this.pageList = decorationTypeService.findByPage(getModel(), getPageInfo());
		JSONString<TbDecorationType> jsonString = new JSONString<TbDecorationType >();
		this.pageList.setResult(jsonString.listCrawl(pageList.getResult(), TbDecorationType .class));
		LOGGER.info("list size=" + this.pageList.getResult());
		this.setSuccess(true);
		this.setMsg("成功");
		return "list";
	}
	/**
	 * 添加饰物类型
	 */
	public String saveType(){
		log.debug("saveType decorationType:"+getDecorationType().toString());
        decorationTypeService.save(decorationType);
		return successInfo(null);
	}
	/**
	 * 修改饰物类型
	 */
	public String updateType()  {
		log.debug("updateType decorationType:"+getDecorationType().toString());
        decorationTypeService.update(decorationType);
		return successInfo(null);
	}
	/**
	 * 删除饰物类型
	 */
	public String delete(){
		LOGGER.debug("delete id:" + Json.toJson(ids));
		String idstr="";
		int i=0;
		Integer[] idslong=new Integer[ids.length];
		for(String id:ids){
			TbDecorationType decorationType = decorationTypeService.getByPk(Integer.parseInt(id));
			if(i>0)
				idstr+=",";
		    idslong[i]=Integer.parseInt(ids[i]);
			i++;
			idstr+=id;
		}
		decorationTypeService.deleteAllByPks(idslong);
		return successInfo("操作成功");
	}
	@Override
	public void setModel(TbDecorationType model) {
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
