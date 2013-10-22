package cn.com.kxcomm.systemcenter.vm.api;

import org.apache.log4j.Logger;

import cn.com.kxcomm.systemcenter.Command;
import cn.com.kxcomm.systemcenter.ScriptCore;
import cn.com.kxcomm.systemcenter.entity.Maps;

public class VmCore extends ScriptCore {

	private static final Logger LOGGER = Logger.getLogger(VmCore.class);
	
	public static getAllVM getAllVM() {
		return new getAllVM();
	}
	
	/**
	 * 
	* 功能描述:获取所有虚拟机
	* 版权所有：康讯通讯
	* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
	* @author chenliang 新增日期：2013-10-22
	* @author chenliang 修改日期：2013-10-22
	* @since system_center_sdk
	 */
	public static class getAllVM implements Command<Maps>{

		@Override
		public Maps execute(String clientType) throws Exception {
			//获取所有虚机的脚本
			String createVm = "Get-SCVirtualMachine -all;";
			//输入的字段
			String output = "Name, Owner, Description, HostName, OperatingSystem, CPUCount, Memory,AddedTime,Modifiedtime,TotalSize,Status,Location";
			return executeScript(createVm,output);
		}
		
	}

	public static void main(String[] args) {
		String aa = "Owner           :";
		String[] len = aa.split(":", 2);
		for (String string : len) {
			System.out.println("aa:"+string);
		}
	}
	
}
