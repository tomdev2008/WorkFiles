package com.unicom.mms.cms.service;

import java.util.HashMap;

import com.unicom.mms.cms.vo.PolicEntity;
import com.unicom.mms.entity.TbPolic;

/**
 * 
* 功能描述:任务策略业务逻辑
* @author chenliang 新增日期：2013-6-27
* @since mms-cms
 */
public interface JobPolicService extends CommonService<TbPolic> {

	/**
	 * 
	* 方法用途和描述: 保存任务策略
	* @param model
	* @param map
	* @param policEntity
	* @author chenliang 新增日期：2013-6-27
	* @since mms-cms
	 */
	public void saveJobPolic(TbPolic model, HashMap<String, Object> map);

	/**
	 * 
	* 方法用途和描述: 启动或停止
	* @param id
	* @author chenliang 新增日期：2013-6-28
	 * @param stop 
	* @since mms-cms
	 */
	public void startOrStop(String id, int stop);

	/**
	 * 
	* 方法用途和描述: 修改任务策略
	* @param model
	* @param policEntity
	* @author chenliang 新增日期：2013-6-28
	* @since mms-cms
	 */
	public void updateJobPolic(TbPolic model, PolicEntity policEntity);

}
