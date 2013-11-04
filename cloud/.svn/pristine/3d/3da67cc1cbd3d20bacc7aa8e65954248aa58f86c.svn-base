package cn.com.kxcomm.systemcenter.vmsync.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import cn.com.kxcomm.common.constant.BusinessConstants;
import cn.com.kxcomm.systemcenter.Client;
import cn.com.kxcomm.systemcenter.entity.Maps;
import cn.com.kxcomm.systemcenter.vmsync.api.WareProfileCore;
import cn.com.kxcomm.systemcenter.vmsync.model.WarePorfileModel;
import cn.com.kxcomm.systemcenter.vmsync.service.WareProfileServiceApi;
import cn.com.kxcomm.util.SdkUtil;

/**
 * 
* 功能描述:同步服务器信息实现类
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-31
* @author chenliang 修改日期：2013-10-31
* @since system_center_sdk
 */
public class WareProfileServiceApiImpl extends SdkUtil<WarePorfileModel> implements WareProfileServiceApi {

	private static final Logger LOGGER = Logger.getLogger(WareProfileServiceApiImpl.class);
	
	private String clientType = BusinessConstants.TYPE_SYSTEMCENTER;
	
	@Override
	public List<WarePorfileModel> getHardwareProfile() throws Exception {
		try {
			Client client = new Client(clientType);
			Maps maps = client.execute(WareProfileCore.getHaredwareProfile());
			List<HashMap<String, String>> maplist = maps.getHashMapList();
			List<WarePorfileModel> modellist = new ArrayList<WarePorfileModel>();
			if(null!=maplist){
				for (int i = 0; i < maplist.size(); i++) {
					HashMap<String, String> map = maplist.get(i);
					WarePorfileModel entity = new WarePorfileModel();
					invoke(entity, map);
					modellist.add(entity);
				}
			}else{
				LOGGER.info("Error hashMapList is null.");
			}
			return modellist; 
		} catch (Exception e) {
			LOGGER.info("Exception getHardwareProfile error.",e);
			throw e;
		}
	}
	
	public static void main(String[] args) throws Exception {
		WareProfileServiceApi api = new WareProfileServiceApiImpl();
		List<WarePorfileModel> list = api.getHardwareProfile();
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).toString());
		}
	}

}
