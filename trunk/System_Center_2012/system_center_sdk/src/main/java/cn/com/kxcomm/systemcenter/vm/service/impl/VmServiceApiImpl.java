package cn.com.kxcomm.systemcenter.vm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.log4j.Logger;

import cn.com.kxcomm.common.constant.BusinessConstants;
import cn.com.kxcomm.systemcenter.Client;
import cn.com.kxcomm.systemcenter.entity.Maps;
import cn.com.kxcomm.systemcenter.vm.api.VmCore;
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
	
	//开启虚拟机
	@Override
	public boolean startVm(String vmId) {
		return false;
	}

	//停止虚拟机
	@Override
	public boolean stopVm(String vmId) {
		return false;
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
	
	
	/**
	 * 方法用途和描述:测试
	 * @param args
	 * @author chenliang 新增日期：2013-5-27
	 * @throws Exception 
	 * @since system_center_sdk
	 */
	public static void main(String[] args) throws Exception {
		VmServiceApiImpl vmApi = new VmServiceApiImpl();
		vmApi.getAllVM();
	}
	
}
