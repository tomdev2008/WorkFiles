package cn.com.kxcomm.systemcenter;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.log4j.Logger;

import cn.com.kxcomm.systemcenter.domer.api.UserCore.DeleteDomUser;
import cn.com.kxcomm.util.AppConfig;

/**
 * 
* 功能描述:创建域用户实现类
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-11
* @author chenliang 修改日期：2013-10-11
* @since system_center_sdk
 */
public class ScriptCore{
	
	private static final Logger LOGGER = Logger.getLogger(ScriptCore.class);
	
	/**
	 * 
	* 方法用途和描述: 执行powerShell脚本域用户验证
	* @author chenliang 新增日期：2013-10-11
	 * @throws IOException 
	* @since system_center_sdk
	 */
	private static File verification() throws IOException {
		AppConfig config = AppConfig.getInstance();
		BufferedWriter writer = null;
		try {
			String confName = config.getString("username");
			String confPwd = config.getString("password");
			
			LOGGER.debug("confName="+confName+",confPwd="+confPwd);
			String[] str = new String[3];
			str[0] = "$uname='"+confName+"'";
			str[1] = "$pwd=ConvertTo-SecureString  '"+confPwd+"' -AsPlainText -Force";
			str[2] = "$credential =New-Object System.Management.Automation.PSCredential($uname,$pwd)";
			
			String dirUrl = System.getProperty("user.dir");
			File file = new File(dirUrl+File.separator+"src/main/resources/temp/temp.ps1");
			if(!file.exists()){
				file.createNewFile();
			}
			
			writer = new BufferedWriter(new FileWriter(file));
			for (int i = 0; i < str.length; i++) {
				writer.write(str[i]+"\n");
			}
			writer.newLine();
			writer.flush();
			return file;
		} catch (IOException e) {
			LOGGER.error("执行powerShell脚本域用户验证异常.",e);
			throw e;
		} finally{
			if(writer != null){
				writer.close();
			}
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 拼接远程执行powershell脚本
	* @param powerShell
	* @return
	* @author chenliang 新增日期：2013-10-11
	* @since system_center_sdk
	 */
	private static String scritpExec(String powerShell){
		AppConfig config = AppConfig.getInstance();
		String confName = config.getString("hyperIp");
		//powerShell = "Invoke-Command -ComputerName "+ confName +" -ScriptBlock { " + powerShell + " } -Credential $credential ";
		LOGGER.debug("command={"+powerShell+"}");
		return powerShell;
	}
	
	
	/**
	 * 
	* 方法用途和描述: 文件追加powerShell脚本
	* @param file
	* @param script
	* @author chenliang 新增日期：2013-10-11
	 * @throws IOException 
	* @since system_center_sdk
	 */
	private static void pursue(File file,String script) throws IOException {
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(file,true));
			writer.write(script);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			LOGGER.error("文件追加powerShell脚本异常.",e);
			throw e;
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 执行ps1脚本
	* @param scriptStr 
	* @return
	* @throws IOException
	* @author chenliang 新增日期：2013-10-12
	* @since system_center_sdk
	 */
	protected static Process executeScript(String scriptStr) throws IOException {
		try {
			//创建执行文件，设置验证变量
			File file = verification();
			String script = scritpExec(scriptStr);
			//追加文件到temp.ps1脚本
			pursue(file, script);
			//执行powerShell脚本
			String deleteExec = "powershell -file "+file.getPath();
			LOGGER.debug("deleteExec:"+deleteExec);
			
			Process ps = Runtime.getRuntime().exec(deleteExec);
			ps.getOutputStream().close();
			return ps;
		} catch (IOException e) {
			LOGGER.error("执行ps1脚本异常.",e);
			throw e;
		}
	}
	
	public static void main(String[] args) throws IOException {
		BufferedReader reader = null;
		try {
//			File file = verification();
//			
//			String script = scritpExec("Get-ExecutionPolicy");
//			BufferedWriter writer = new BufferedWriter(new FileWriter(file,true));
//			writer.write(script);
//			writer.flush();
//			writer.close();
			
//			String deleteExec = "powershell -file "+file.getPath();
			String deleteExec = "powershell get-item c:";
			Process ps = Runtime.getRuntime().exec(deleteExec);
			ps.getOutputStream().close();
			InputStream is = ps.getInputStream();
			reader = new BufferedReader(new InputStreamReader(is,"GB2312"));
			String line;
			while ((line = reader.readLine())!=null) {
				System.out.println(line+"\n");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(reader != null){
				reader.close();
			}
		}
	}
	
}
