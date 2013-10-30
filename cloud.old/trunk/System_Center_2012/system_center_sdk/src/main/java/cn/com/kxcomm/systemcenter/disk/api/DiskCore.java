package cn.com.kxcomm.systemcenter.disk.api;

import org.apache.log4j.Logger;

import cn.com.kxcomm.common.constant.BusinessConstants;
import cn.com.kxcomm.systemcenter.Command;
import cn.com.kxcomm.systemcenter.HashCore;
import cn.com.kxcomm.systemcenter.MapsCore;
import cn.com.kxcomm.systemcenter.entity.Hash;
import cn.com.kxcomm.systemcenter.entity.Maps;

/**
 * 
* 功能描述:硬盘api
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-22
* @author chenliang 修改日期：2013-10-22
* @since system_center_sdk
 */
public class DiskCore extends HashCore {

	private static final Logger LOGGER = Logger.getLogger(DiskCore.class);
	
	/**
	 * 
	* 方法用途和描述: 根据虚拟机名称获取虚拟机的硬盘信息
	* @return
	* @author chenliang 新增日期：2013-10-22
	* @since system_center_sdk
	 */
	public static GetAllDisk getAllDisk(String vmname) {
		return new GetAllDisk(vmname);
	}
	
	public static class GetAllDisk implements Command<Hash>{

		private String vmname;
		
		public GetAllDisk(String vmname){
			this.vmname = vmname;
		}
		
		@Override
		public Hash execute(String clientType) throws Exception {
			if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
				//获取所有虚机的脚本命令
				String createVm = "Get-SCVirtualHardDisk  –vm '"+vmname+"'";
				//输入的字段
				String output = "";
				return executeScript(createVm,output);
			}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
			}
			return new Hash();
		}
		
	}
	
}
