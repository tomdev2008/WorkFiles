package com.unicom.mms.cms.service;

import java.util.Map;

import com.unicom.mms.common.Page;
import com.unicom.mms.entity.TbFramePos;
import com.unicom.mms.entity.TbPhotoFrame;

public interface PhotoFrameService extends CommonService<TbPhotoFrame>{
	public Page<TbPhotoFrame> findByPage(TbPhotoFrame entity,
			Page<TbPhotoFrame> pageInfo);
	
	/**
	 * 
	* 方法用途和描述: 新增相框
	* @param model 
	* @param map
	* @author lujia 新增日期：2013-4-11
	* @since mms-cms
	 */
	public void savePhotoFrame(TbPhotoFrame model, Map<String, Object> map);

	/**
	 * 
	* 方法用途和描述: 修改相框
	* @param model
	* @author chenliang 新增日期：2013-6-19
	* @since mms-cms
	 */
	public void updatePhotoFrame(TbPhotoFrame model,TbFramePos framePos,TbFramePos postmarkFramePos,TbFramePos stampFramePos);

	/**
	 * 
	* 方法用途和描述: 批量删除
	* @param ids
	* @author chenliang 新增日期：2013-7-15
	* @since mms-cms
	 */
	public void deleteByPkid(String[] ids);
}
