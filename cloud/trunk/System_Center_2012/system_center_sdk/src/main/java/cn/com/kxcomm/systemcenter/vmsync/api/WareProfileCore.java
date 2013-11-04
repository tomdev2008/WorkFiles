package cn.com.kxcomm.systemcenter.vmsync.api;


import org.apache.log4j.Logger;

import cn.com.kxcomm.common.constant.BusinessConstants;
import cn.com.kxcomm.systemcenter.Command;
import cn.com.kxcomm.systemcenter.MapsCore;
import cn.com.kxcomm.systemcenter.entity.Maps;
import cn.com.kxcomm.util.AppConfig;

/**
 * 
* 功能描述:所有硬件配置信息
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-22
* @author chenliang 修改日期：2013-10-22
* @since system_center_sdk
 */
public class WareProfileCore extends MapsCore {

	private static final Logger LOGGER = Logger.getLogger(WareProfileCore.class);
	
	//poweshell结果输出值字段
	private static String output = "";
	
	/**
	 * 
	* 方法用途和描述: 获取所有硬件配置信息
	* @return
	* @author chenliang 新增日期：2013-10-31
	* @since system_center_sdk
	 */
	public static GetHardwareProfile getHaredwareProfile(){
		return new GetHardwareProfile();
	}
	
	//获取所有硬件配置信息
	public static class GetHardwareProfile implements Command<Maps>{

		@Override
		public Maps execute(String clientType) throws Exception {
			try {
				AppConfig appconfig = AppConfig.getInstance();
				String vmmServer = appconfig.getString("vmmServer");
				if(null == vmmServer || "".equals(vmmServer)){
					LOGGER.info("error vmmServer is null");
					throw new Exception("Exceptino vmmServer is null.");
				}
				if(BusinessConstants.TYPE_SYSTEMCENTER.equals(clientType)){
					LOGGER.info("SystemCenter execute.");
					StringBuffer hardwareProfileCommand = new StringBuffer();
					hardwareProfileCommand.append("Get-SCHardwareProfile -VMMServer \""+vmmServer+"\"");
					Maps maps = executeScript(hardwareProfileCommand.toString(), null);
					return maps;
				}else if(BusinessConstants.TYPE_OPENSTACK.equals(clientType)){
					LOGGER.info("OpenStack execute.");
				}else{
					LOGGER.info("Other execute.");
				}
				return new Maps();
			} catch (Exception e) {
				LOGGER.error("Exception gethardwarePorfile error.",e);
				throw e;
			}
		}
		
	}
	
	
}
