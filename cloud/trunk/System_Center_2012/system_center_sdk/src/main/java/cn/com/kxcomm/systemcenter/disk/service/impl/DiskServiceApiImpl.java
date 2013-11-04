package cn.com.kxcomm.systemcenter.disk.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import cn.com.kxcomm.common.constant.BusinessConstants;
import cn.com.kxcomm.systemcenter.Client;
import cn.com.kxcomm.systemcenter.disk.api.DiskCore;
import cn.com.kxcomm.systemcenter.disk.model.HardDiskModel;
import cn.com.kxcomm.systemcenter.disk.service.DiskServiceApi;
import cn.com.kxcomm.systemcenter.entity.Maps;
import cn.com.kxcomm.util.SdkUtil;

/**
 * 
* 功能描述:硬盘api实现
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-23
* @author chenliang 修改日期：2013-10-23
* @since system_center_sdk
 */
public class DiskServiceApiImpl extends SdkUtil<HardDiskModel> implements DiskServiceApi {

	private static final Logger LOGGER = Logger.getLogger(DiskServiceApiImpl.class);
	
	//底层实现方式
	private String clientType = BusinessConstants.TYPE_SYSTEMCENTER;
	
	public DiskServiceApiImpl(String clientType){
		this.clientType = clientType;
	}
	
	public DiskServiceApiImpl(){
	}
	
	//获取所有硬盘信息
	@Override
	public List<HardDiskModel> getAlltHardDisk() throws Exception{
		try {
			Client client = new Client(clientType);
			Maps maps = client.execute(DiskCore.getHardDisk(null));
			List<HardDiskModel> vmlist = new ArrayList<HardDiskModel>();
			List<HashMap<String, String>> maplist = maps.getHashMapList();
			for (int i = 0; i < maplist.size(); i++) {
				HashMap<String, String> map = maps.getHashMapList().get(i);
				HardDiskModel entity = new HardDiskModel();
				invoke(entity, map);
				vmlist.add(entity);
			}
			return vmlist;
		} catch (Exception e) {
			LOGGER.error("GeAlltHardDisk Exception.",e);
			throw e;
		}
	}
	
	//根据虚拟机获取硬盘信息
	@Override
	public HardDiskModel getHardDiskByVM(String vmname) throws Exception{
		try {
			Client client = new Client(clientType);
			Maps maps = client.execute(DiskCore.getHardDisk(null));
			List<HardDiskModel> vmlist = new ArrayList<HardDiskModel>();
			List<HashMap<String, String>> maplist = maps.getHashMapList();
			HardDiskModel entity = new HardDiskModel();
			if(maplist.size()>0){
				HashMap<String, String> map = maps.getHashMapList().get(0);
				invoke(entity, map);
			}
			return entity;
		} catch (Exception e) {
			LOGGER.error("GetHardDiskByVM Exception.",e);
			throw e;
		}
	}

	//获取lib库中所有的vhdx信息
	@Override
	public List<HardDiskModel> getVhdxInLib(String libServer) throws Exception {
		try {
			Client client = new Client(clientType);
			Maps maps = client.execute(DiskCore.getVhdxInLib(libServer));
			List<HashMap<String, String>> vhdxlist = maps.getHashMapList();
			List<HardDiskModel> vhdxS = new ArrayList<HardDiskModel>();
			System.out.println(vhdxlist.size());
			if( null != vhdxlist){
				for (int i = 0; i < vhdxlist.size(); i++) {
					HashMap<String, String> map = vhdxlist.get(i);
					HardDiskModel entity = new HardDiskModel();
					invoke(entity, map);
					System.out.println(entity.toString());
					vhdxS.add(entity);
				}
			}
			return vhdxS;
		} catch (Exception e) {
			LOGGER.error("GetVhdxInLib Exception.",e);
			throw e;
		}
	}
	
	
	public static void main(String[] args) throws Exception {
		DiskServiceApi api = new DiskServiceApiImpl();
		//根据库获取硬盘信息
//		List<HardDiskModel> modelList = api.getVhdxInLib("syscen50.syscen95.com");
		//获取所有的硬盘信息
//		List<HardDiskModel> modelList = api.getAlltHardDisk();
//		for (int i = 0; i < modelList.size(); i++) {
//			HardDiskModel model = modelList.get(i);
//			System.out.println("model:"+model);
//		}
//		HardDiskModel model = api.getHardDiskByVM("vmm1");
//		System.out.println("model:"+model);
	}
}