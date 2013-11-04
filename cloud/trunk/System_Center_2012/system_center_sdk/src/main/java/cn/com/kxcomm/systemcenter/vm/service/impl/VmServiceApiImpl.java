package cn.com.kxcomm.systemcenter.vm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import cn.com.kxcomm.common.constant.BusinessConstants;
import cn.com.kxcomm.systemcenter.Client;
import cn.com.kxcomm.systemcenter.disk.api.DiskCore;
import cn.com.kxcomm.systemcenter.disk.model.HardDiskModel;
import cn.com.kxcomm.systemcenter.entity.Hash;
import cn.com.kxcomm.systemcenter.entity.Maps;
import cn.com.kxcomm.systemcenter.entity.ServerModel;
import cn.com.kxcomm.systemcenter.vm.api.VmCore;
import cn.com.kxcomm.systemcenter.vm.api.VmCore.SetVmCpu;
import cn.com.kxcomm.systemcenter.vm.model.VmModel;
import cn.com.kxcomm.systemcenter.vm.service.VmServiceApi;
import cn.com.kxcomm.util.SdkUtil;

/**
 * 
* 功能描述:虚拟机api
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-22
* @author chenliang 修改日期：2013-10-22
* @since system_center_sdk
 */
public class VmServiceApiImpl extends SdkUtil<VmModel> implements VmServiceApi {

	private static final Logger LOGGER = Logger.getLogger(VmServiceApiImpl.class);
	//底层技术实现方式
	private String clientType = BusinessConstants.TYPE_SYSTEMCENTER;
	
	public VmServiceApiImpl(String clientType) {
		this.clientType = clientType;
	}
	
	public VmServiceApiImpl() {
	}
	
	//开机
	@Override
	public VmModel bootVM(String vmname) throws Exception {
		try {
			if(null==vmname || "".equals(vmname)){
				LOGGER.info("error vmname is null.");
				throw new Exception("Exception vmname is null");
			}
			Client client = new Client(clientType);
			Hash hash = client.execute(VmCore.boot(vmname));
			HashMap<String, String> hashMap = hash.getHashMap();
			VmModel entity = new VmModel();
			invoke(entity, hashMap);
			return entity;
		} catch (Exception e) {
			LOGGER.error("BootVM Exception",e);
			return new VmModel();
		}
	}

	//关机
	@Override
	public VmModel shutDownVM(String vmname) throws Exception {
		try {
			if(null==vmname || "".equals(vmname)){
				LOGGER.info("error vmname is null.");
				throw new Exception("Exception vmname is null");
			}
			Client client = new Client(clientType);
			Hash hash = client.execute(VmCore.shutDown(vmname));
			HashMap<String, String> hashMap = hash.getHashMap();
			VmModel entity = new VmModel();
			invoke(entity, hashMap);
			return entity;
		} catch (Exception e) {
			LOGGER.error("ShutDown Exception.",e);
			throw e;
		}
	}

	//获取所有的虚拟机
	@Override
	public List<VmModel> getAllVM() throws Exception {
		List<VmModel> modelList = new ArrayList<VmModel>();
		try {
			Client client = new Client(clientType);
			Maps maps = client.execute(VmCore.getAllVM());
			List<HashMap<String, String>> maplist = maps.getHashMapList();
			for (int i = 0; i < maplist.size(); i++) {
				VmModel vmModel = new VmModel();
				invoke(vmModel, maplist.get(i));
				modelList.add(vmModel);
			}
		} catch (Exception e) {
			LOGGER.error("getAllVM Exception.",e);
			throw e;
		}
		return modelList;
	}
	
	//添加虚拟机
	@Override
	public VmModel addVM(VmModel vmModel) throws Exception {
		try {
			Client client = new Client(clientType);
			ServerModel serverModel = new ServerModel();
			serverModel.setLibServer("syscen50.syscen95.com");
			serverModel.setServerVHD("windows 2012.vhdx");
			serverModel.setHostServer("syscen50.syscen95.com");
			serverModel.setVmLeavePath("E:\\Hyper-V\\");
			serverModel.setHardConfig("template1");
			//根据配置判断虚拟机在那台节点上进行创建
			//创建虚拟机
			Hash hash = client.execute(VmCore.addVm(vmModel, serverModel));
			HashMap<String, String> hashMap = hash.getHashMap();
			VmModel entity = new VmModel();
			invoke(entity, hashMap);
			//设置虚拟机的硬盘大小
			String str = vmModel.getTotalSize();
			Integer hardDisk = 0;
			if(null != str && !"".equals(str)){
				hardDisk = Integer.parseInt(str);
			}
			entity = setVmHardDisk(entity.getName(), hardDisk);
			LOGGER.info("AddVm Result is ["+entity+"].");
			return entity;
		} catch (Exception e) {
			LOGGER.error("Exception addVM error.",e);
			throw e;
		}
	}
	
	//设置cpu
	@Override
	public VmModel setVmCPU(String vmname, Integer cpu) throws Exception {
		try {
			if(null == vmname || "".equals(vmname)){
				LOGGER.info("error vmname is null.");
				throw new Exception("Exception vmname is null");
			}
			if(null == cpu || 0==cpu){
				LOGGER.info("error cpu is null or cpu=0.");
				throw new Exception("Exception set the cpu error.");
			}
			Client client = new Client(clientType);
			Hash hash = client.execute(VmCore.setVmCpu(vmname,cpu));
			HashMap<String, String> hashMap = hash.getHashMap();
			VmModel entity = new VmModel();
			invoke(entity, hashMap);
			LOGGER.info("resetVm result is "+entity+".");
			return entity;
		} catch (Exception e) {
			LOGGER.error("Exception setVmCpu error.",e);
			throw e;
		}
	}
	

	//设置虚拟机的内存
	@Override
	public VmModel setVmMemory(String vmname, Integer memory) throws Exception {
		try {
			if(null == vmname || "".equals(vmname)){
				LOGGER.info("error vmname is null.");
				throw new Exception("Exception vmname is null");
			}
			if(null == memory || 0==memory){
				LOGGER.info("error cpu is null or cpu=0.");
				throw new Exception("Exception set the cpu error.");
			}
			Client client = new Client(clientType);
			Hash hash = client.execute(VmCore.setVmMemory(vmname, memory));
			HashMap<String, String> hashMap = hash.getHashMap();
			VmModel entity = new VmModel();
			invoke(entity, hashMap);
			LOGGER.info("resetVm result is "+entity+".");
			return entity;
		} catch (Exception e) {
			LOGGER.error("Exception setVmMemory error.",e);
			throw e;
		}
	}
	
	//修改虚拟机的硬盘
	@Override
	public VmModel setVmHardDisk(String vmname,Integer hardDisk) throws Exception{
		try {
			if(null == vmname || "".equals(vmname)){
				LOGGER.info("error vmname is null.");
				throw new Exception("Exception vmname is null.");
			}
			if(null == hardDisk || 0 == hardDisk){
				LOGGER.info("error hardDisk is 0.");
				throw new Exception("Exception hardDisk is 0.");
			}
			Client client = new Client(clientType);
			Hash hash = client.execute(VmCore.setVmHardDisk(vmname, hardDisk));
			HashMap<String, String> hashMap = hash.getHashMap();
			VmModel entity = new VmModel();
			invoke(entity, hashMap);
			LOGGER.info("setVmHardDisk result is ["+entity+"]");
			return entity;
		} catch (Exception e) {
			LOGGER.error("Exception setVmHardDisk error.",e);
			throw e;
		}
	}
	
	//重置
	@Override
	public VmModel resetVm(String vmname) throws Exception {
		try {
			if("".equals(vmname) || null==vmname){
				LOGGER.info("vmname is null.");
				throw new Exception("Exception vmname is null.");
			}
			Client client = new Client(clientType);
			Hash hash = client.execute(VmCore.resetVM(vmname));
			HashMap<String, String> hashMap = hash.getHashMap();
			VmModel entity = new VmModel();
			invoke(entity, hashMap);
			LOGGER.info("resetVm result is "+entity+".");
			return entity;
		} catch (Exception e) {
			LOGGER.error("Exception restartVM error.",e);
			throw e;
		}
	}
	
	//删除vm
	@Override
	public VmModel deleteVm(String vmname) throws Exception {
		try {
			if("".equals(vmname) || null==vmname){
				LOGGER.info("vmname is null.");
				throw new Exception("Exception vmname is null.");
			}
			Client client = new Client(clientType);
			Hash hash = client.execute(VmCore.deleteVm(vmname));
			VmModel entity = new VmModel();
			invoke(entity, hash.getHashMap());
			LOGGER.info("deleteVm result is ["+entity+"]");
			return entity;
		} catch (Exception e) {
			LOGGER.error("Exception vmname error.",e);
			throw e;
		}
	}
	
	//恢复
	@Override
	public VmModel resumeVm(String vmname) throws Exception {
		try {
			if(null==vmname || "".equals(vmname)){
				LOGGER.info("error vmname is null.");
				throw new Exception("Exception vmname is null");
			}
			Client client = new Client(clientType);
			Hash hash = client.execute(VmCore.resumeVm(vmname));
			HashMap<String, String> hashMap = hash.getHashMap();
			VmModel entity = new VmModel();
			invoke(entity, hashMap);
			LOGGER.info("resumeVm result is "+entity+".");
			return entity;
		} catch (Exception e) {
			LOGGER.error("Exception resumeVm error.",e);
			throw e;
		}
	}

	//暂停
	@Override
	public VmModel suspendVm(String vmname) throws Exception {
		try {
			if(null==vmname || "".equals(vmname)){
				LOGGER.info("error vmname is null.");
				throw new Exception("Exception vmname is null");
			}
			Client client = new Client(clientType);
			Hash hash = client.execute(VmCore.suspendVm(vmname));
			HashMap<String, String> hashMap = hash.getHashMap();
			VmModel entity = new VmModel();
			invoke(entity, hashMap);
			LOGGER.info("suspendVm result is "+entity+".");
			return entity;
		} catch (Exception e) {
			LOGGER.error("Exception suspendVm error.",e);
			throw e;
		}
	}
	
	/**
	 * 方法用途和描述:测试
	 * @param args
	 * @author chenliang 新增日期：2013-5-27
	 * @throws Exception 
	 * @since system_center_sdk
	 */
	public static void main(String[] args) throws Exception {
		VmServiceApiImpl vmApi = new VmServiceApiImpl();
		VmModel vmModel = null;
		//开机
//		vmModel = vmApi.bootVM("vmTest1");
		//关机
//		vmModel = vmApi.shutDownVM("vmTest1");
		//获取所有虚拟机
//		List<VmModel> vmmode = vmApi.getAllVM();
//		for (VmModel vmModel : vmmode) {
//			System.out.println(vmmode.toString());
//		}
		//重置
//		vmModel = vmApi.resetVm("vmTest1");
//		//暂停
//		vmModel = vmApi.suspendVm("vmTest1");
//		//恢复
//		vmModel = vmApi.resumeVm("vmTest1");
		//添加vm
//		VmModel entity =  new VmModel();
//		entity.setName("vmm3");
//		entity.setCpuCount("2");
//		entity.setDescription("java创建vmm3");
//		entity.setMemory("2048");
//		vmModel = vmApi.addVM(entity);
		//设置硬盘大小
//		vmModel = vmApi.setVmHardDisk("vmm4", 100);
		//设置cpu大小
//		vmModel = vmApi.setVmCPU("vmm1", 2);
		//设置内存大小
//		vmModel = vmApi.setVmMemory("vmm1", 1024);
		//删除
//		vmModel = vmApi.deleteVm("vmm1");
//		LOGGER.info("vmModel:"+vmModel);
	}

	
}