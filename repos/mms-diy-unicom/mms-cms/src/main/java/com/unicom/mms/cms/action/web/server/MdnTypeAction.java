package com.unicom.mms.cms.action.web.server;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.cms.service.MdnTypeService;
import com.unicom.mms.entity.TbMdnType;

/**
 * 
* 功能描述:推送号码分类
* @author chenliang 新增日期：2013-6-27
* @since mms-cms
 */
public class MdnTypeAction extends BaseAction<TbMdnType, String>{

	private static final Logger LOGGER = Logger.getLogger(MdnTypeAction.class);
    
	@Autowired(required=true)
	private MdnTypeService MdnTypeService;

	@Override
	public CommonService getCommonService() {
		return MdnTypeService;
	}

	@Override
	public TbMdnType getModel() {
		if(null == model){
			model = new TbMdnType();
		}
		return null;
	}

	@Override
	public void setModel(TbMdnType model) {
		this.model = model;
	}

	@Override
	public String[] getIds() {
		return ids;
	}

	@Override
	public void setIds(String[] ids) {
		this.ids = ids;
	}
	

}
