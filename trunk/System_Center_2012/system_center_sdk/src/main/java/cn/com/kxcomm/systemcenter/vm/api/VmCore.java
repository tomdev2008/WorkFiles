package cn.com.kxcomm.systemcenter.vm.api;

import org.apache.log4j.Logger;

import sun.misc.Cleaner;
import sun.reflect.generics.tree.BottomSignature;

import cn.com.kxcomm.common.constant.BusinessConstants;
import cn.com.kxcomm.systemcenter.Command;
import cn.com.kxcomm.systemcenter.MapsCore;
import cn.com.kxcomm.systemcenter.entity.Maps;
import cn.com.kxcomm.systemcenter.vm.model.VmModel;

/**
 * 
* 功能描述:虚拟机api
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-22
* @author chenliang 修改日期：2013-10-22
* @since system_center_sdk
 */
public class VmCore extends MapsCore {

	private static final Logger LOGGER = Logger.getLogger(VmCore.class);
	
	/**
	 * 
	* 方法用途和描述: 获取所有的虚拟机
	* @return
	* @author chenliang 新增日期：2013-10-22
	* @since system_center_sdk
	 */
	public static GetAllVM getAllVM() {
		return new GetAllVM();
	}
	
	/**
	 * 
	* 方法用途和描述: 关机
	* @param  vmname 虚拟机名称
	* @return
	* @author chenliang 新增日期：2013-10-22
	* @since system_center_sdk
	 */
	public static ShutDown shutDown(String vmname){
		return new ShutDown(vmname);
	}
	
	/**
	 * 
	* 方法用途和描述: 开机
	* @param vmname 虚拟机名称 
	* @return
	* @author chenliang 新增日期：2013-10-23
	* @since system_center_sdk
	 */
	public static Boot boot(String vmname){
		return new Boot(vmname);
	}
	
	/**
	 * 
	* 方法用途和描述: 设置vm的cpu大小
	* @param vmname 虚拟机名称
	* @param cpu cpu大小
	* @return
	* @author chenliang 新增日期：2013-10-23
	* @since system_center_sdk
	 */
	public static SetVmCpu setVmCpu(String vmname,Integer cpu){
		return new SetVmCpu(vmname,cpu);
	}
	
	/**
	 * 
	* 方法用途和描述: 设置vm的内存大小
	* @param vmname 虚拟机名称
	* @param memory 内存大小
	* @return
	* @author chenliang 新增日期：2013-10-23
	* @since system_center_sdk
	 */
	public static SetVmMemory setVmMemory(String vmname,Integer memory){
		return new SetVmMemory(vmname, memory);
	}

	/**
	 * 
	* 方法用途和描述: 重启
	* @param vmname
	* @return
	* @author chenliang 新增日期：2013-10-23
	* @since system_center_sdk
	 */
	public static RestartVM restartVM(String vmname){
		return new RestartVM(vmname);
	}
	
	/**
	 * 
	* 方法用途和描述: 删除vm
	* @param vmname
	* @return
	* @author chenliang 新增日期：2013-10-23
	* @since system_center_sdk
	 */
	public static DeleteVm deleteVm(String vmname,String servername){
		return new DeleteVm(vmname,servername);
	}
	
	/**
	 * 
	* 方法用途和描述: 添加vm
	* @param vmModel
	* @return
	* @author chenliang 新增日期：2013-10-23
	* @since system_center_sdk
	 */
	public static AddVM addVm(VmModel vmModel){
		return new AddVM(vmModel);
	}
	
	public static class GetAllVM implements Command<Maps>{

		@Override
		public Maps execute(String clientType) throws Exception {
			try {
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//获取所有虚机的脚本命令
					String createVm = "Get-SCVirtualMachine -all;";
					//输入的字段
					String output = "Name, Owner, Description, HostName, OperatingSystem, CPUCount, Memory,AddedTime,Modifiedtime,TotalSize,Status,Location";
					return executeScript(createVm,output);
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("other.");
				}
				return new Maps();
			} catch (Exception e) {
				LOGGER.error("Exception getAllVM.",e);
				throw e;
			}
		}
		
	}
	
	public static class ShutDown implements Command<Boolean> {

		private String vmname;
		
		public ShutDown(String vmname){
			this.vmname = vmname;
		}
		
		@Override
		public Boolean execute(String clientType) throws Exception {
			try {
				if(null==vmname || "".equals(vmname)){
					LOGGER.info("error vmname is null.");
					throw new Exception("Exception vmname is null");
				}
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//关机命令
					String shutdownCommand = "Stop-SCVirtualMachine -VM '"+vmname+"'";
					Maps maps = executeScript(shutdownCommand,null);
					if(null==maps.getHashMapList() || maps.getHashMapList().size()==0){
						return true;
					}
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("other.");
				}
				return false;
			} catch (Exception e) {
				LOGGER.error("Exception ShutDown",e);
				throw e;
			}
		}
	}
	
	public static class Boot implements Command<Boolean> {
		
		private String vmname;
		
		public Boot(String vmname){
			this.vmname = vmname;
		}

		@Override
		public Boolean execute(String clientType) throws Exception {
			try {
				if(null==vmname || "".equals(vmname)){
					LOGGER.info("error vmname is null.");
					throw new Exception("Exception vmname is null");
				}
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//开机命令
					String bootCommand = "Start-SCVirtualMachine -VM '"+vmname+"'";
					Maps maps = executeScript(bootCommand, null);
					if(null==maps.getHashMapList() || maps.getHashMapList().size()==0){
						return true;
					}
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("other.");
				}
				return false;
			} catch (Exception e) {
				LOGGER.error("Exception ShutDown",e);
				throw e;
			}
		}
	}

	public static class SetVmCpu implements Command<Boolean> {
			
		private String vmname;
		private Integer cpu;
		
		public SetVmCpu(String vmname,Integer cpu){
			this.vmname = vmname;
			this.cpu = cpu;
		}

		@Override
		public Boolean execute(String clientType) throws Exception {
			try {
				if(null == vmname || "".equals(vmname)){
					LOGGER.info("error vmname is null.");
					throw new Exception("Exception vmname is null");
				}
				if(null == cpu || 0==cpu){
					LOGGER.info("error cpu is null or cpu=0.");
					throw new Exception("Exception set the cpu error.");
				}
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//开机命令
					StringBuffer setCpuCommand = new StringBuffer();
					setCpuCommand.append(" $VM = Get-SCVirtualMachine -Name \""+vmname+"\"; ");
					setCpuCommand.append(" if($VM.Status -ne \"PowerOff\"){Stop-SCVirtualMachine -VM $VM}; ");
					setCpuCommand.append(" Set-SCVirtualMachine -VM $VM -CPUCount \""+cpu+"\" ");
					Maps maps = executeScript(setCpuCommand.toString(), null);
					if(null==maps.getHashMapList() || maps.getHashMapList().size()==0){
						return true;
					}
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("other.");
				}
				return false;
			} catch (Exception e) {
				LOGGER.error("Exception ShutDown",e);
				throw e;
			}
		}
	}
	
	public static class SetVmMemory implements Command<Boolean> {
		
		private String vmname;
		private Integer memory;
		
		public SetVmMemory(String vmname,Integer memory){
			this.vmname = vmname;
			this.memory = memory;
		}

		@Override
		public Boolean execute(String clientType) throws Exception {
			try {
				if(null == vmname || "".equals(vmname)){
					LOGGER.info("error vmname is null.");
					throw new Exception("Exception vmname is null");
				}
				if(null == memory || 0==memory){
					LOGGER.info("error cpu is null or cpu=0.");
					throw new Exception("Exception set the cpu error.");
				}
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//开机命令
					StringBuffer setMemoryCommand = new StringBuffer();
					setMemoryCommand.append(" $VM = Get-SCVirtualMachine -Name \""+vmname+"\"; ");
					setMemoryCommand.append(" if($VM.Status -ne \"PowerOff\"){Stop-SCVirtualMachine -VM $VM}; ");
					setMemoryCommand.append(" Set-SCVirtualMachine -VM $VM -MemoryMB \""+memory+"\" ");
					Maps maps = executeScript(setMemoryCommand.toString(), null);
					if(null==maps.getHashMapList() || maps.getHashMapList().size()==0){
						return true;
					}
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("other.");
				}
				return false;
			} catch (Exception e) {
				LOGGER.error("Exception ShutDown",e);
				throw e;
			}
		}
	}
	
	public static class AddVM implements Command<VmModel>{

		private VmModel vmmodel;
		
		public AddVM(VmModel vmmodel){
			this.vmmodel = vmmodel;
		}
		
		@Override
		public VmModel execute(String clientType) throws Exception {
			try {
				String addvmCommand = "";
				
			} catch (Exception e) {
				LOGGER.error("Exception addVm error.",e);
				throw e;
			}
			return null;
		}
		
	}
	
	public static class RestartVM implements Command<Boolean>{

		private String vmname;
		
		public RestartVM(String vmname){
			this.vmname = vmname;
		}
		
		@Override
		public Boolean execute(String clientType) throws Exception {
			try {
				if("".equals(vmname) || null==vmname){
					LOGGER.info("vmname is null.");
					throw new Exception("Exception vmname is null.");
				}
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//开机命令
					StringBuffer restartCommand = new StringBuffer();
					restartCommand.append(" Get-SCVMHost -ComputerName \""+vmname+"\" | Restart-SCVMHost; ");
					Maps maps = executeScript(restartCommand.toString(), null);
					if(null==maps.getHashMapList() || maps.getHashMapList().size()==0){
						return true;
					}
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("Others execute.");
				}
			} catch (Exception e) {
				LOGGER.error("Exception RestartVM error.",e);
			}
			return null;
		}
		
	}

	public static class DeleteVm implements Command<Boolean>{

		private String vmname;
		private String servername;
		
		public DeleteVm(String vmname,String servername){
			this.vmname = vmname;
			this.servername = servername;
		}
		
		@Override
		public Boolean execute(String clientType) throws Exception {
			try {
				if("".equals(vmname) || null==vmname){
					LOGGER.info("vmname is null.");
					throw new Exception("Exception vmname is null.");
				}
				if("".equals(servername) || null == servername){
					LOGGER.info("servername is null.");
					throw new Exception("Exception servername is null.");
				}
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//开机命令
					StringBuffer restartCommand = new StringBuffer();
					restartCommand.append(" $VMs = @(Get-SCVirtualMachine -VMMServer \""+servername+"\" | where { $_.Name -Match \""+vmname+"\" } ); ");
					restartCommand.append("  $VMs | Remove-SCVirtualMachine; ");
					Maps maps = executeScript(restartCommand.toString(), null);
					if(null==maps.getHashMapList() || maps.getHashMapList().size()==0){
						return true;
					}
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("Others execute.");
				}
			} catch (Exception e) {
				LOGGER.error("Exception RestartVM error.",e);
			}
			return null;
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
