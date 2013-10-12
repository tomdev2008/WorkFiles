package cn.com.kxcomm.systemcenter.domer.api;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.log4j.Logger;

import cn.com.kxcomm.systemcenter.Command;
import cn.com.kxcomm.systemcenter.ScriptCore;
import cn.com.kxcomm.systemcenter.domer.model.DomUserModel;

/**
 * 
* 功能描述:创建域用户实现类
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-11
* @author chenliang 修改日期：2013-10-11
* @since system_center_sdk
 */
public class UserCore extends ScriptCore{
	
	private static final Logger LOGGER = Logger.getLogger(UserCore.class);
	
	public static SelectDomUser selectDomUser(String userId){
		return new SelectDomUser(userId);
	}
	
	public static DeleteDomUser deleteDomUse(String userId){
		return new DeleteDomUser(userId);
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
	public static class DeleteDomUser implements Command<Void>{

		private String id;
		
		public DeleteDomUser(){
		}
		
		public DeleteDomUser(String userId){
			id = userId;
		}
		
		@Override
		public Void execute(String clientType) throws Exception {
			String deleteExce = "powershell get-process p*";
			String returnResult = readerBuffer(executeScript(deleteExce),new DeleteDomUser());
			
			System.out.println("returnResult:"+returnResult);
			return null;
		}
		
	};

	/**
	 * 
	* 功能描述:查询域用户
	* 版权所有：康讯通讯
	* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
	* @author chenliang 新增日期：2013-10-11
	* @author chenliang 修改日期：2013-10-11
	* @since system_center_sdk
	 */
	public static class SelectDomUser implements Command<DomUserModel>{
		
		private String id;
		
		public SelectDomUser(String userId){
			id = userId;
		}
		
		@Override
		public DomUserModel execute(String clientType) throws Exception {
			return null;
		}
		
	}
	
	/**
	 * 
	* 功能描述:修改域用户
	* 版权所有：康讯通讯
	* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
	* @author chenliang 新增日期：2013-10-11
	* @author chenliang 修改日期：2013-10-11
	* @since system_center_sdk
	 */
	private static class UpdateDomUser implements Command<Void>{

		private String id;
		
		public UpdateDomUser(String userId){
			id = userId;
		}
		
		@Override
		public Void execute(String clientType) throws Exception {
			return null;
		}
		
	}
	
	/**
	 * 
	* 功能描述:创建域用户
	* 版权所有：康讯通讯
	* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
	* @author chenliang 新增日期：2013-10-11
	* @author chenliang 修改日期：2013-10-11
	* @since system_center_sdk
	 */
	private static class CreateDomUser implements Command<DomUserModel>{

		private DomUserModel domUser;
		
		public CreateDomUser(DomUserModel domUserModel){
			domUser = domUserModel;
		}
		
		@Override
		public DomUserModel execute(String clientType) throws Exception {
			
			return null;
		}
		
	}
	
	public static String result="";
	
	public static String readerBuffer(Process ps,Object obj) throws IOException{
		if(ps!=null){
			String line = "";
			BufferedReader reader = new BufferedReader(new InputStreamReader(ps.getInputStream(),"GB2312"));
			if(obj instanceof CreateDomUser){
			}else if(obj instanceof DeleteDomUser){
				while ((line = reader.readLine()) != null) {
					result += line +"\n";
				}
			}else if(obj instanceof SelectDomUser){
				
			}else if(obj instanceof UpdateDomUser){
				
			}
		}
		return result;
	}
	
}
