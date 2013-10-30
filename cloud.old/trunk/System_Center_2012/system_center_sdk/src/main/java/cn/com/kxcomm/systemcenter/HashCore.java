package cn.com.kxcomm.systemcenter;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import cn.com.kxcomm.systemcenter.entity.Hash;
import cn.com.kxcomm.systemcenter.entity.Maps;
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
public class HashCore extends Core{
	
	private static final Logger LOGGER = Logger.getLogger(HashCore.class);
	
	/**
	 * 
	* 方法用途和描述: 解析请求返回的数据
	* @param ps
	* @return
	* @throws IOException
	* @author chenliang 新增日期：2013-10-22
	* @since system_center_sdk
	 */
	protected static Hash setMaps(Process ps) throws IOException {
		BufferedReader rd = new BufferedReader(new InputStreamReader(ps.getInputStream(),"GB2312"));
		HashMap<String, String>  hashMap = new HashMap<String, String>();
		try{
			String line = "";
			HashMap<String, String > map =  new HashMap<String, String>();
		    while((line = rd.readLine()) != null){
	    		String[] temp = line.split(":",2);
	    		if(temp.length==2){
    				map.put(temp[0], temp[1]);
	    		}else{ 
	    			LOGGER.debug("temp length not equel two.result["+line+"]");
	    		}
		    }
		}catch(IOException e){
			LOGGER.error("SetMaps Value Exception.",e);
			throw e;
		}finally{
		    rd.close();
		}
		return new Hash(hashMap);
	}
	
	/**
	 * 
	* 方法用途和描述: 执行ps1脚本
	* @param scriptStr 执行的脚本命令 
	* @param output 输出的字段
	* @return
	* @throws IOException
	* @author chenliang 新增日期：2013-10-12
	* @since system_center_sdk
	 */
	protected static Hash executeScript(String scriptStr,String output) throws IOException {
		try {
			//1、创建powershell脚本文件
			//1.1创建执行文件，设置验证变量
			File file = verification();
			//1.2追加文件到temp.ps1脚本
			pursue(file, scriptStr,output);
			
			//2、执行powerShell脚本文件
			String pwershellExec = "powershell -file "+file.getPath();
			LOGGER.debug("pwershellExec:"+pwershellExec);
			
			Process ps = Runtime.getRuntime().exec(pwershellExec);
			ps.getOutputStream().close();
			return setMaps(ps);
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
