package cn.com.kxcomm.systemcenter.disk.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import cn.com.kxcomm.common.constant.BusinessConstants;
import cn.com.kxcomm.systemcenter.Client;
import cn.com.kxcomm.systemcenter.disk.api.DiskCore;
import cn.com.kxcomm.systemcenter.disk.model.DiskModel;
import cn.com.kxcomm.systemcenter.disk.service.DiskServiceApi;
import cn.com.kxcomm.systemcenter.entity.Hash;
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
public class DiskServiceApiImpl extends SdkUtil<DiskModel> implements DiskServiceApi {

	private static final Logger LOGGER = Logger.getLogger(DiskServiceApiImpl.class);
	
	//底层实现方式
	private String clientType = BusinessConstants.TYPE_SYSTEMCENTER;
	
	public DiskServiceApiImpl(String clientType){
		this.clientType = clientType;
	}
	
	public DiskServiceApiImpl(){
	}
	
	//获取根据虚拟机名称获取虚拟机硬盘信息
	@Override
	public DiskModel getAllDisk(String vmname) throws Exception {
		DiskModel diskModel = new DiskModel();
		try {
			Client client = new Client(clientType);
			Hash hash = client.execute(DiskCore.getAllDisk(vmname));
			HashMap<String, String> map = hash.getHashMap();
			invoke(diskModel, map);
		} catch (Exception e) {
			LOGGER.error("Exectption getAllDisk.",e);
			throw e;
		}
		return diskModel;
	}

}
