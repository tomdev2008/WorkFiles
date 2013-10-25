package com.unicom.mms.cms.service;

import java.util.HashMap;

import com.unicom.mms.entity.TbDecoration;

/**
 * 
* 功能描述:饰品业务接口
* @author chenliang 新增日期：2013-6-19
* @since mms-cms
 */
public interface DecorationService extends CommonService<TbDecoration>{

	/**
	 * 
	* 方法用途和描述: 上传饰品
	* @param model
	* @param map
	* @author chenliang 新增日期：2013-6-19
	* @since mms-cms
	 */
	public void saveDecoration(TbDecoration model, HashMap<String, Object> map);

	/**
	 * 
	* 方法用途和描述: 修改饰品
	* @param model
	* @author chenliang 新增日期：2013-6-19
	* @since mms-cms
	 */
	public void updateDecoration(TbDecoration model);

}
