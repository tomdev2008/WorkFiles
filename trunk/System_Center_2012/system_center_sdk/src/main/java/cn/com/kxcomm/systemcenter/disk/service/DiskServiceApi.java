package cn.com.kxcomm.systemcenter.disk.service;

import cn.com.kxcomm.systemcenter.disk.model.DiskModel;

/**
 * 
* 功能描述:硬盘api
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-23
* @author chenliang 修改日期：2013-10-23
* @since system_center_sdk
 */
public interface DiskServiceApi {

	/**
	 * 
	* 方法用途和描述: 根据虚拟机名称获取硬盘信息
	* @param vmname 虚拟机名称
	* @return 硬盘对象
	* @author chenliang 新增日期：2013-10-23
	 * @throws Exception 
	* @since system_center_sdk
	 */
	public DiskModel getAllDisk(String vmname) throws Exception;
}
