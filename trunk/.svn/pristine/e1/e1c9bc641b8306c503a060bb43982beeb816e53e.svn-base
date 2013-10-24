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
	* @param vmname 虚拟机名称 
	* @return
	* @author chenliang 新增日期：2013-10-21
	* @since system_center_sdk
	 */
	public boolean bootVM(String vmname)  throws Exception ;
	
	/**
	 * 
	* 方法用途和描述: 停止
	* @param vmname 虚拟机名称
	* @return
	* @author chenliang 新增日期：2013-10-21
	* @since system_center_sdk
	 */
	public boolean shutDownVM(String vmname)  throws Exception ;
	
	/**
	 * 
	* 方法用途和描述: 获取所有的虚拟机
	* @return
	* @author chenliang 新增日期：2013-10-22
	* @since system_center_sdk
	 */
	public List<VmModel> getAllVM() throws Exception;
	
	/**
	 * 
	* 方法用途和描述: 创建虚拟机
	* @author chenliang 新增日期：2013-10-22
	* @since system_center_sdk
	 */
	public void addVM(VmModel vmModel) throws Exception;
	
	/**
	 * 
	* 方法用途和描述: 设置vm的cpu大小
	* @param vmName vm名称
	* @param cupCount cpu个数
	* @author chenliang 新增日期：2013-10-23
	 * @throws Exception 
	* @since system_center_sdk
	 */
	public void setVmCPU(String vmname,Integer cpu) throws Exception;
	
	/**
	 * 
	* 方法用途和描述: 设置vm的内存
	* @param vmname vm名称
	* @param memory 内存大小
	* @author chenliang 新增日期：2013-10-23
	 * @throws Exception 
	* @since system_center_sdk
	 */
	public void setVmMemory(String vmname,Integer memory) throws Exception;
	
	/**
	 * 
	* 方法用途和描述: vm重启
	* @param vmname vm名称
	* @author chenliang 新增日期：2013-10-23
	 * @throws Exception 
	* @since system_center_sdk
	 */
	public void restartVm(String vmname) throws Exception;
	
	/**
	 * 
	* 方法用途和描述: 删除vm
	* @param vmname
	* @throws Exception
	* @author chenliang 新增日期：2013-10-23
	* @since system_center_sdk
	 */
	public void deleteVm(String vmname) throws Exception;
	
}
