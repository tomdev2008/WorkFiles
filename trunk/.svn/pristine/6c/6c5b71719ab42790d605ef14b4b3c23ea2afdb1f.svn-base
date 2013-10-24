package cn.com.kxcomm.systemcenter.domer.api;


import java.io.File;

import org.apache.log4j.Logger;

import cn.com.kxcomm.systemcenter.Command;
import cn.com.kxcomm.systemcenter.MapsCore;

/**
 * 
* 功能描述:创建域用户实现类
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-11
* @author chenliang 修改日期：2013-10-11
* @since system_center_sdk
 */
public class UserCore extends MapsCore{
	
	private static final Logger LOGGER = Logger.getLogger(UserCore.class);
	private static String exportPath = "domUser"; //ps脚本执行结果数据输出目录
	
	public static SelectDomUser selectDomUser(String userId){
		return new SelectDomUser(userId);
	}
	
	
	/**
	 * 
	* 功能描述:删除域用户
	* 版权所有：康讯通讯
	* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
	* @author chenliang 新增日期：2013-10-11
	* @author chenliang 修改日期：2013-10-11
	* @since system_center_sdk
	 */
	public static class SelectDomUser implements Command<Void>{

		private String id;
		
		public SelectDomUser(){
		}
		
		public SelectDomUser(String userId){
			id = userId;
		}
		
		@Override
		public Void execute(String clientType) throws Exception {
//			exportPath = exportPath(exportPath,"deleteDomUser.csv");
//			String deleteExce = "powershell  \"& {(get-process p*| Export-Csv "+exportPath+")}\" ";
//			executeScript(deleteExce,null);
			//解析exportPath目录下的.csv文件
			
//			String returnResult = readerBuffer(executeScript(deleteExce),new DeleteDomUser());
//			System.out.println("returnResult:"+returnResult);
			LOGGER.info("execute Successfully.");
			return null;
		}
		
	};

	
//	public static String result="";
//	
//	public static String readerBuffer(Process ps,Object obj) throws IOException{
//		if(ps!=null){
//			String line = "";
//			BufferedReader reader = new BufferedReader(new InputStreamReader(ps.getInputStream(),"GB2312"));
//			if(obj instanceof CreateDomUser){
//			}else if(obj instanceof DeleteDomUser){
//				while ((line = reader.readLine()) != null) {
//					result += line +"\n";
//				}
//			}else if(obj instanceof SelectDomUser){
//				
//			}else if(obj instanceof UpdateDomUser){
//				
//			}
//		}
//		return result;
//	}
	
}
