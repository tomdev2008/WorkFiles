package cn.com.kxcomm.systemcenter.vm.api;

import java.util.HashMap;

import org.apache.log4j.Logger;

import cn.com.kxcomm.common.constant.BusinessConstants;
import cn.com.kxcomm.systemcenter.Command;
import cn.com.kxcomm.systemcenter.HashCore;
import cn.com.kxcomm.systemcenter.MapsCore;
import cn.com.kxcomm.systemcenter.entity.Hash;
import cn.com.kxcomm.systemcenter.entity.Maps;
import cn.com.kxcomm.systemcenter.entity.ServerModel;
import cn.com.kxcomm.systemcenter.vm.model.VmModel;
import cn.com.kxcomm.util.AppConfig;

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
	
	//poweshell结果输出值字段
	private static String output = "Name, Owner, Description, HostName, OperatingSystem, CPUCount, Memory,AddedTime,Modifiedtime,TotalSize,Status,Location,MostRecentTask,MostRecentTaskIfLocal";
	
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
	* 方法用途和描述: 设置硬盘的大小
	* @param vmname
	* @param hardDisk
	* @return
	* @author chenliang 新增日期：2013-10-30
	* @since system_center_sdk
	 */
	public static SetVmHardDisk setVmHardDisk(String vmname,Integer hardDisk){
		return new SetVmHardDisk(vmname, hardDisk);
	}
	
	/**
	 * 
	* 方法用途和描述: 重启
	* @param vmname
	* @return
	* @author chenliang 新增日期：2013-10-23
	* @since system_center_sdk
	 */
	public static ResetVM resetVM(String vmname){
		return new ResetVM(vmname);
	}
	
	/**
	 * 
	* 方法用途和描述: 删除vm
	* @param vmname
	* @return
	* @author chenliang 新增日期：2013-10-23
	* @since system_center_sdk
	 */
	public static DeleteVm deleteVm(String vmname){
		return new DeleteVm(vmname);
	}
	
	/**
	 * 
	* 方法用途和描述: 添加vm
	* @param vmModel
	* @return
	* @author chenliang 新增日期：2013-10-23
	* @since system_center_sdk
	 */
	public static AddVM addVm(VmModel vmModel,ServerModel serverModel){
		return new AddVM(vmModel,serverModel);
	}
	
	/**
	 * 
	* 方法用途和描述: 恢复
	* @param vmname
	* @return
	* @author chenliang 新增日期：2013-10-24
	* @since system_center_sdk
	 */
	public static ResumeVM resumeVm(String vmname){
		return new ResumeVM(vmname);
	}
	
	/**
	 * 
	* 方法用途和描述: 暂停
	* @param vmname
	* @return
	* @author chenliang 新增日期：2013-10-24
	* @since system_center_sdk
	 */
	public  static SuspendVM suspendVm(String vmname){
		return new SuspendVM(vmname);
	}
	
	//恢复
	public static class ResumeVM extends HashCore implements Command<Hash> {
		
//		private static final Logger LOGGER = Logger.getLogger(ResumeVM.class);
		private String vmname;
		
		public ResumeVM(String vmname){
			this.vmname = vmname;
		}

		@Override
		public Hash execute(String clientType) throws Exception {
			try {
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//开机命令
					String bootCommand = "Resume-SCVirtualMachine -VM '"+vmname+"'";
					Hash hash = executeScript(bootCommand, output);
					return hash;
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("other.");
				}
				return new Hash(new HashMap<String, String>());
			} catch (Exception e) {
				LOGGER.error("Exception ShutDown",e);
				throw e;
			}
		}
	}
	
	//暂停
	public static class SuspendVM extends HashCore implements Command<Hash> {
		
//		private static final Logger LOGGER = Logger.getLogger(SuspendVM.class);
		private String vmname;
		
		public SuspendVM(String vmname){
			this.vmname = vmname;
		}

		@Override
		public Hash execute(String clientType) throws Exception {
			try {
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//开机命令
					String bootCommand = "Suspend-SCVirtualMachine -VM '"+vmname+"'";
					Hash hash = executeScript(bootCommand, output);
					return hash;
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("other.");
				}
				return new Hash(new HashMap<String, String>());
			} catch (Exception e) {
				LOGGER.error("Exception ShutDown",e);
				throw e;
			}
		}
	}
	
	//获取所有的虚拟机
	public static class GetAllVM implements Command<Maps>{

//		private static final Logger LOGGER = Logger.getLogger(GetAllVM.class);
		
		@Override
		public Maps execute(String clientType) throws Exception {
			try {
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//获取所有虚机的脚本命令
					String createVm = "Get-SCVirtualMachine -all;";
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
	
	//关机
	public static class ShutDown extends HashCore implements Command<Hash> {

//		private static final Logger LOGGER = Logger.getLogger(ShutDown.class);
		private String vmname;
		
		public ShutDown(String vmname){
			this.vmname = vmname;
		}
		
		@Override
		public Hash execute(String clientType) throws Exception {
			try {
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//关机命令
					String shutdownCommand = "Stop-SCVirtualMachine -VM '"+vmname+"'";
					Hash hash = executeScript(shutdownCommand,output);
					return hash;
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("other.");
				}
				return new Hash(new HashMap<String, String>());
			} catch (Exception e) {
				LOGGER.error("Exception ShutDown",e);
				throw e;
			}
		}
	}
	
	//开机
	public static class Boot extends HashCore implements Command<Hash> {
		
//		private static final Logger LOGGER = Logger.getLogger(Boot.class);
		private String vmname;
		
		public Boot(String vmname){
			this.vmname = vmname;
		}

		@Override
		public Hash execute(String clientType) throws Exception {
			try {
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//开机命令
					String bootCommand = "Start-SCVirtualMachine -VM '"+vmname+"'";
					Hash hash = executeScript(bootCommand, output);
					return hash;
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("other.");
				}
				return new Hash(new HashMap<String, String>());
			} catch (Exception e) {
				LOGGER.error("Exception ShutDown",e);
				throw e;
			}
		}
	}

	//设置虚拟机cpu
	public static class SetVmCpu extends HashCore implements Command<Hash> {
			
//		private static final Logger LOGGER = Logger.getLogger(SetVmCpu.class);
		private String vmname;
		private Integer cpu;
		
		public SetVmCpu(String vmname,Integer cpu){
			this.vmname = vmname;
			this.cpu = cpu;
		}

		@Override
		public Hash execute(String clientType) throws Exception {
			try {
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//开机命令
					StringBuffer setCpuCommand = new StringBuffer();
					setCpuCommand.append(" $VM = Get-SCVirtualMachine -Name \""+vmname+"\"; ");
					setCpuCommand.append(System.getProperty("line.separator"));
					
					setCpuCommand.append(" if($VM.Status -ne \"PowerOff\"){Stop-SCVirtualMachine -VM $VM}; ");
					setCpuCommand.append(System.getProperty("line.separator"));
					
					setCpuCommand.append(" Set-SCVirtualMachine -VM $VM -CPUCount \""+cpu+"\" ");
					setCpuCommand.append(System.getProperty("line.separator"));
					Hash hash = executeScript(setCpuCommand.toString(), output);
					return hash;
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("other.");
				}
				return new Hash(new HashMap<String, String>());
			} catch (Exception e) {
				LOGGER.error("Exception ShutDown",e);
				throw e;
			}
		}
	}
	
	//设置虚拟机内存
	public static class SetVmMemory extends HashCore implements Command<Hash> {
		
//		private static final Logger LOGGER = Logger.getLogger(SetVmMemory.class);
		private String vmname;
		private Integer memory;
		
		public SetVmMemory(String vmname,Integer memory){
			this.vmname = vmname;
			this.memory = memory;
		}

		@Override
		public Hash execute(String clientType) throws Exception {
			try {
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//开机命令
					StringBuffer setMemoryCommand = new StringBuffer();
					setMemoryCommand.append(" $VM = Get-SCVirtualMachine -Name \""+vmname+"\"; ");
					setMemoryCommand.append(System.getProperty("line.separator"));
					setMemoryCommand.append(" if($VM.Status -ne \"PowerOff\"){Stop-SCVirtualMachine -VM $VM}; ");
					setMemoryCommand.append(System.getProperty("line.separator"));
					setMemoryCommand.append(" Set-SCVirtualMachine -VM $VM -MemoryMB \""+memory+"\" ");
					setMemoryCommand.append(System.getProperty("line.separator"));
					Hash hash = executeScript(setMemoryCommand.toString(), output);
					return hash;
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("other.");
				}
				return new Hash(new HashMap<String, String>());
			} catch (Exception e) {
				LOGGER.error("Exception ShutDown",e);
				throw e;
			}
		}
	}
	
	//设置硬盘大小
	public static class SetVmHardDisk extends HashCore implements Command<Hash>{

//				private static final Logger LOGGER = Logger.getLogger(SetVmHardDisk.class);
		
		private String vmname; //虚拟机名字
		private Integer hardDisk; //磁盘大小，包括系统盘和数据盘大小,单位GB
		
		public SetVmHardDisk(String vmname,Integer hardDisk){
			this.vmname = vmname;
			this.hardDisk = hardDisk;
		}
		
		@Override
		public Hash execute(String clientType) throws Exception {
			try {
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("Systemcenter execute.");
					//poweshell结果输出值字段
					String output = "Name, Owner, Description, HostName, OperatingSystem, CPUCount, Memory,AddedTime,Modifiedtime,TotalSize,Status,Location,MostRecentTask,MostRecentTaskIfLocal";
					
					StringBuffer hardDiskCommand = new StringBuffer();
					hardDiskCommand.append(" $VM = Get-SCVirtualMachine -Name \""+vmname+"\" ");
					hardDiskCommand.append(System.getProperty("line.separator"));
					
					hardDiskCommand.append(" $VirtDiskDrive = Get-SCVirtualDiskDrive -VM $VM ");
					hardDiskCommand.append(System.getProperty("line.separator"));
					
					hardDiskCommand.append(" if($VM.Status -ne \"PowerOff\"){Stop-SCVirtualMachine -VM $VM}; ");
					hardDiskCommand.append(System.getProperty("line.separator"));
					
					hardDiskCommand.append(" Expand-SCVirtualDiskDrive -VirtualDiskDrive $VirtDiskDrive -VirtualHardDiskSizeGB "+hardDisk+" ");
					hardDiskCommand.append(System.getProperty("line.separator"));
					
					Hash hash = executeScript(hardDiskCommand.toString(), output);
					return hash;
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("OpenStack execute.");
				}else{
					LOGGER.info("Other execute.");
				}
				return new Hash(new HashMap<String, String>());
			} catch (Exception e) {
				LOGGER.error("Exception SetVmHardDisk error.",e);
				throw e;
			}
		}
		
	}
	
	//添加
	public static class AddVM extends HashCore implements Command<Hash>{

//		private static final Logger LOGGER = Logger.getLogger(AddVM.class);
		private VmModel vmmodel; //虚拟机信息
		private ServerModel serverModel; //服务器管理信息
		
		public AddVM(VmModel vmmodel,ServerModel serverModel){
			this.vmmodel = vmmodel;
			this.serverModel = serverModel;
		}
		
		@Override
		public Hash execute(String clientType) throws Exception {
			try {
				AppConfig appconfig = AppConfig.getInstance();
				String vmmServer = appconfig.getString("vmmServer");//vmm服务器
				if(null == vmmServer || "".equals(vmmServer)){
					LOGGER.info("error vmmServer is null.");
					throw new Exception("Exception vmmServer is null.");
				}
				if(null == vmmodel || "".equals(vmmodel)){
					LOGGER.info("error vmmodel is null.");
					throw new Exception("Exception vmmodel is null.");
				}
				if(null == serverModel || "".equals(serverModel)){
					LOGGER.info("error serverModel is null.");
					throw new Exception("Exception serverModel is null.");
				}
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					StringBuffer addvmCommand = new StringBuffer(); 
					//获取VHD硬盘信息
					addvmCommand.append("$VHD = Get-SCVirtualHardDisk -VMMServer \""+vmmServer+"\" | where { $_.Name -eq \""+serverModel.getServerVHD()+"\" -and $_.LibraryServer -eq \""+serverModel.getLibServer()+"\"};");
					addvmCommand.append(System.getProperty("line.separator"));
					//获取宿主服务器信息
					addvmCommand.append("$VMHost = Get-SCVMHost | where {$_.Name -match \""+serverModel.getHostServer()+"\"};");
					addvmCommand.append(System.getProperty("line.separator"));
					//获取硬件配置文件
					addvmCommand.append("$HWProfile = Get-SCHardwareProfile | where {$_.Name -match \""+serverModel.getHardConfig()+"\"};");
					addvmCommand.append(System.getProperty("line.separator"));
					//判断参数是否为空
					addvmCommand.append("if($VHD -and $VMHost -and $HWProfile){");
					addvmCommand.append(System.getProperty("line.separator"));
					//创建虚拟机
					addvmCommand.append("New-SCVirtualMachine -Name \""+vmmodel.getName()+"\" -Description \""+vmmodel.getDescription()+"\" -MemoryMB "+vmmodel.getMemory()+" -CPUCount "+vmmodel.getCpuCount()+" -VirtualHardDisk $VHD -VMHost $VMHost -Path \""+serverModel.getVmLeavePath()+"\" -HardwareProfile $HWProfile -StartAction NeverAutoTurnOnVM -StopAction SaveVM");
					addvmCommand.append(System.getProperty("line.separator"));
					
					addvmCommand.append("}else{ ");
					addvmCommand.append(System.getProperty("line.separator"));
					
					addvmCommand.append("\"参数错误,虚拟机创建失败!\"");
					addvmCommand.append(System.getProperty("line.separator"));
					
					addvmCommand.append("}");				
					
					Hash hash = executeScript(addvmCommand.toString(), output);
					return hash;
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("OpenStack execute.");
				}else{
					LOGGER.info("Other type exectue.");
				}
				return new Hash(new HashMap<String, String>());
			} catch (Exception e) {
				LOGGER.error("Exception addVm error.",e);
				throw e;
			}
		}
		
	}
	
	//重置
	public static class ResetVM extends HashCore implements Command<Hash>{

//		private static final Logger LOGGER = Logger.getLogger(ResetVM.class);
		private String vmname;
		
		public ResetVM(String vmname){
			this.vmname = vmname;
		}
		
		@Override
		public Hash execute(String clientType) throws Exception {
			try {
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//重置命令
					StringBuffer restartCommand = new StringBuffer();
					restartCommand.append(" Reset-SCVirtualMachine -VM \""+vmname+"\" ");
					Hash hash = executeScript(restartCommand.toString(), output);
					return hash;
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("Others execute.");
				}
				return new Hash(new HashMap<String, String>());
			} catch (Exception e) {
				LOGGER.error("Exception RestartVM error.",e);
				throw e;
			}
		}
		
	}

	//删除虚拟机
	public static class DeleteVm extends HashCore implements Command<Hash>{

//		private static final Logger LOGGER = Logger.getLogger(DeleteVm.class);
		private String vmname;
		
		public DeleteVm(String vmname){
			this.vmname = vmname;
		}
		
		@Override
		public Hash execute(String clientType) throws Exception {
			try {
				AppConfig appconfig = AppConfig.getInstance();
				String vmmServer = appconfig.getString("vmmServer");
				if(null == vmmServer || "".equals(vmmServer)){
					LOGGER.info("DeleteVm vmmServer is null.");
					throw new Exception("Exceptino DeleteVm vmmServer is null.");
				}
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter2012 execute.");
					//开机命令
					StringBuffer restartCommand = new StringBuffer();
					restartCommand.append(" $VMs = @(Get-SCVirtualMachine -VMMServer \""+vmmServer+"\" | where { $_.Name -Match \""+vmname+"\" } ); ");
					restartCommand.append(System.getProperty("line.separator"));
					restartCommand.append("  $VMs | Remove-SCVirtualMachine; ");
					restartCommand.append(System.getProperty("line.separator"));
					Hash hash =  executeScript(restartCommand.toString(), null);
					return hash;
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("Openstack execute.");
				}else{
					LOGGER.info("Others execute.");
				}
				return new Hash(new HashMap<String, String>());
			} catch (Exception e) {
				LOGGER.error("Exception RestartVM error.",e);
				throw e;
			}
		}
		
	}
	
	public static void main(String[] args) {
//		String aa = "Owner           :";
//		String[] len = aa.split(":", 2);
//		for (String string : len) {
//			System.out.println("aa:"+string);
//		}
		StringBuffer sb =  new StringBuffer();
		sb.append("你是个傻逼吗？");
		sb.append(System.getProperty("line.separator"));
		sb.append("我不是。");
		System.out.println(sb.toString());
	}
	
}