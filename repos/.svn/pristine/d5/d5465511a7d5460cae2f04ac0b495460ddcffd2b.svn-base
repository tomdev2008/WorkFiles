package com.unicom.mms.cms.action.web.server;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.googlecode.jsonplugin.annotations.JSON;
import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.service.CardTypeService;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.entity.TbCardType;

public class CardTypeAction extends BaseAction<TbCardType, String>{

	private static final Logger LOGGER = Logger.getLogger(CardTypeAction.class);
    
	@Autowired(required=true)
	private CardTypeService cardTypeService;
	
	public List<TbCardType> typeList;
	
	
	@JSON(serialize=true)
	public List<TbCardType> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<TbCardType> typeList) {
		this.typeList = typeList;
	}

	public String listAll(){
		typeList = cardTypeService.findAll();
		successInfo(null);
		return "list";
	}
	
	/**
	 * 
	* 方法用途和描述: 新增模板明信片类型
	* @return
	* @author chenliang 新增日期：2013-6-24
	* @since mms-cms
	 */
	public String saveCardType(){
		cardTypeService.save(getModel());
		return successInfo(null);
	}
	
	/**
	 * 
	* 方法用途和描述: 修改模板明信片
	* @return
	* @author chenliang 新增日期：2013-6-24
	* @since mms-cms
	 */
	public String updateCardType(){
		cardTypeService.update(getModel());
		return successInfo(null);
	}
	
	/**
	 * 
	* 方法用途和描述: 批量删除
	* @return
	* @author chenliang 新增日期：2013-6-24
	* @since mms-cms
	 */
	public String deleteByIds(){
		String[] idss=(String[])getIds();
		Integer[] idslong = new Integer[idss.length];
		for(int i=0;i<idslong.length;i++){
			idslong[i]=Integer.parseInt(idss[i]);
		}
		getCommonService().deleteAllByPks(idslong);
		return successInfo("删除成功！");
	}

	@Override
	public String[] getIds() {
		return this.ids;
	}

	@Override
	public void setIds(String[] ids) {
		this.ids = ids;
	}
	
	@Override
	public CommonService getCommonService() {
		return cardTypeService;
	}

	@Override
	public TbCardType getModel() {
		if(model==null){
			model = new TbCardType();
		}
		return model;
	}

	@Override
	public void setModel(TbCardType model) {
		this.model = model;
	}

}
