package cn.com.kxcomm.systemcenter.disk.service;

import java.util.List;

import cn.com.kxcomm.systemcenter.disk.model.HardDiskModel;
import cn.com.kxcomm.systemcenter.vm.model.VmModel;

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
	* @param vmname 虚拟机名字
	* @return
	* @throws Exception
	* @author chenliang 新增日期：2013-10-31
	* @since system_center_sdk
	 */
	public List<HardDiskModel> getAlltHardDisk() throws Exception;
	
	/**
	 * 
	* 方法用途和描述: 根据虚拟机名称获取硬盘信息
	* @param vmname 虚拟机名字
	* @return
	* @throws Exception
	* @author chenliang 新增日期：2013-10-31
	* @since system_center_sdk
	 */
	public HardDiskModel getHardDiskByVM(String vmname) throws Exception;
	
	/**
	 * 
	* 方法用途和描述: 获取lib库中的所有vhdx
	* @param libServer 库服务器计算机名
	* @return
	* @throws Exception
	* @author chenliang 新增日期：2013-10-31
	* @since system_center_sdk
	 */
	public List<HardDiskModel> getVhdxInLib(String libServer) throws Exception;
	
}