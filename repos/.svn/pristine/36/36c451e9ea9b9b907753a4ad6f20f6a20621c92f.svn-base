package com.unicom.mms.cms.action.web.server;


import org.apache.log4j.Logger;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;

import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.cms.service.FrameTypeService;
import com.unicom.mms.entity.TbDecorationType;
import com.unicom.mms.entity.TbFrameType;

public class FrameTypeAction extends BaseAction<TbFrameType, String>{

	private static final Logger LOGGER = Logger.getLogger(FrameTypeAction.class);
	
	@Autowired(required=true)
	public FrameTypeService frameTypeService;

	@Override
	public CommonService getCommonService() {
		return frameTypeService;
	}
	
	/**
	 * 添加饰物类型
	 */
	public String saveFrameType(){
		log.debug("saveType getModel:"+getModel().toString());
        frameTypeService.save(getModel());
		return successInfo(null);
	}
	/**
	 * 修改饰物类型
	 */
	public String updateFrameType()  {
		log.debug("updateType getModel:"+getModel().toString());
		frameTypeService.update(getModel());
		return successInfo(null);
	}
	/**
	 * 删除饰物类型
	 */
	public String deleteByIds(){
		LOGGER.debug("delete id:" + Json.toJson(ids));
		String idstr="";
		int i=0;
		Integer[] idslong=new Integer[ids.length];
		for(String id:ids){
			if(i>0)
				idstr+=",";
		    idslong[i]=Integer.parseInt(ids[i]);
			i++;
			idstr+=id;
		}
		frameTypeService.deleteAllByPks(idslong);
		return successInfo("操作成功");
	}
	
	@Override
	public TbFrameType getModel() {
		if(null==this.model){
			this.model = new TbFrameType();
		}
		return model;
	}

	@Override
	public void setModel(TbFrameType model) {
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
