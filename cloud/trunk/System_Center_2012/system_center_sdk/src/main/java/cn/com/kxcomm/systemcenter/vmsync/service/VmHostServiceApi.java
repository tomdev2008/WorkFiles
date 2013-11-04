package cn.com.kxcomm.systemcenter.vmsync.service;

import java.util.List;

import cn.com.kxcomm.systemcenter.vmsync.model.VmHostModel;

/**
 * 
* 功能描述: vm宿主服务器
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-31
* @author chenliang 修改日期：2013-10-31
* @since system_center_sdk
 */
public interface VmHostServiceApi {

	/**
	 * 
	* 方法用途和描述: vm宿主服务器
	* @throws Exception
	* @author chenliang 新增日期：2013-10-31
	* @since system_center_sdk
	 */
	public List<VmHostModel> getVmHost() throws Exception;
	
}
