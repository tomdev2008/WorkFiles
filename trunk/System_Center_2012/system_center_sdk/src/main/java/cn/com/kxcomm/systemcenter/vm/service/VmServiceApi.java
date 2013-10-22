package cn.com.kxcomm.systemcenter.vm.service;

import java.util.List;

import cn.com.kxcomm.systemcenter.vm.model.VmModel;

/**
 * 
* 功能描述:虚拟机操作接口api
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-21
* @author chenliang 修改日期：2013-10-21
* @since system_center_sdk
 */
public interface VmServiceApi {

	/**
	 * 
	* 方法用途和描述: 启动虚拟机
	* @param vmId
	* @return
	* @author chenliang 新增日期：2013-10-21
	* @since system_center_sdk
	 */
	public boolean startVm(String vmId);
	
	/**
	 * 
	* 方法用途和描述: 停止
	* @param vmId
	* @return
	* @author chenliang 新增日期：2013-10-21
	* @since system_center_sdk
	 */
	public boolean stopVm(String vmId);
	
	/**
	 * 
	* 方法用途和描述: 获取所有的虚拟机
	* @return
	* @author chenliang 新增日期：2013-10-22
	* @since system_center_sdk
	 */
	public List<VmModel> getAllVM() throws Exception;
	
}
