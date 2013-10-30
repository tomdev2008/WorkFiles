package cn.com.kxcomm.systemcenter;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import org.apache.log4j.Logger;
import cn.com.kxcomm.util.AppConfig;

/**
 * 
* 功能描述:创建待执行的powershell脚本基类
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-11
* @author chenliang 修改日期：2013-10-11
* @since system_center_sdk
 */
public class Core{
	
	private static final Logger LOGGER = Logger.getLogger(Core.class);
	
	/**
	 * 
	* 方法用途和描述: 执行powerShell脚本域用户验证
	* @author chenliang 新增日期：2013-10-11
	 * @throws IOException 
	* @since system_center_sdk
	 */
	protected static File verification() throws IOException {
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
				writer.write(str[i]);
				writer.newLine();
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
	* 方法用途和描述: 文件追加powerShell脚本
	* @param file
	* @param script
	* @author chenliang 新增日期：2013-10-11
	 * @throws IOException 
	* @since system_center_sdk
	 */
	protected static void pursue(File file,String powerShell,String output) throws IOException {
		try {
			AppConfig config = AppConfig.getInstance();
			String confName = config.getString("hyperIp");
			LOGGER.debug("command={"+powerShell+"}");
			if(null!=powerShell && !"".equals(powerShell) && null!=confName && !"".equals(confName)){
				BufferedWriter writer = new BufferedWriter(new FileWriter(file,true));
				writer.write("$outputs = Invoke-Command -ComputerName "+ confName +" -ScriptBlock {");
				writer.newLine();
				writer.write("Import-Module -Name virtualmachinemanager –Global;");
				writer.newLine();
				writer.write(powerShell);
				writer.newLine();
				writer.write("} -Credential $credential;");
				writer.newLine();
				if("".equals(output) || null==output){
					writer.write("echo $outputs");
				}else{
					writer.write("echo $outputs | Format-List -property "+output+" ;");
				}
				writer.flush();
				writer.close();
			}else{
				LOGGER.info("Error PowerShell command Or HyperIp is null.");
			}
		} catch (IOException e) {
			LOGGER.error("文件追加powerShell脚本异常.",e);
			throw e;
		}
	}
	
}
