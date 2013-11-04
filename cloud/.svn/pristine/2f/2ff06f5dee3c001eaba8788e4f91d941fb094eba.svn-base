package cn.com.kxcomm.systemcenter.vmsync.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import cn.com.kxcomm.common.constant.BusinessConstants;
import cn.com.kxcomm.systemcenter.Client;
import cn.com.kxcomm.systemcenter.entity.Maps;
import cn.com.kxcomm.systemcenter.vmsync.api.LibraryServerCore;
import cn.com.kxcomm.systemcenter.vmsync.api.VmHostCore;
import cn.com.kxcomm.systemcenter.vmsync.model.LibraryServerModel;
import cn.com.kxcomm.systemcenter.vmsync.model.VmHostModel;
import cn.com.kxcomm.systemcenter.vmsync.service.LibraryServerServiceApi;
import cn.com.kxcomm.systemcenter.vmsync.service.VmHostServiceApi;
import cn.com.kxcomm.util.SdkUtil;

/**
 * 
* 功能描述:vm宿主服务器
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-31
* @author chenliang 修改日期：2013-10-31
* @since system_center_sdk
 */
public class VmHostServiceApiImpl extends SdkUtil<VmHostModel> implements VmHostServiceApi {

	private static final Logger LOGGER = Logger.getLogger(VmHostServiceApiImpl.class);
	
	private String clientType = BusinessConstants.TYPE_SYSTEMCENTER;
	
	@Override
	public List<VmHostModel> getVmHost() throws Exception {
		try {
			Client client = new Client(clientType);
			Maps maps = client.execute(VmHostCore.getVmHost());
			List<HashMap<String, String>> maplist = maps.getHashMapList();
			List<VmHostModel> modellist = new ArrayList<VmHostModel>();
			if(null!=maplist){
				for (int i = 0; i < maplist.size(); i++) {
					HashMap<String, String> map = maplist.get(i);
					VmHostModel entity = new VmHostModel();
					invoke(entity, map);
					modellist.add(entity);
				}
			}else{
				LOGGER.info("Error hashMapList is null.");
			}
			return modellist; 
		} catch (Exception e) {
			LOGGER.info("Exception getVmHost error.",e);
			throw e;
		}
	}
	
	public static void main(String[] args) throws Exception {
		VmHostServiceApi libapi = new VmHostServiceApiImpl();
		List<VmHostModel> libModelList = libapi.getVmHost();
		for (int i = 0; i < libModelList.size(); i++) {
			System.out.println(libModelList.toString());
		}
	}

}
