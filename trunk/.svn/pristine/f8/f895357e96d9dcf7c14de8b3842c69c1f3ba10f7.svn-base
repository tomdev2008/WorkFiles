package cn.com.kxcomm.selfservice.action.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

import cn.com.kxcomm.common.AppConfig;
import cn.com.kxcomm.common.BlankUtil;

/**
 * 
* 功能描述:文件工具类
* @author chenliang 新增日期：2012-12-14
* @since ContractManage
 */
public class FileUtil {
	
	private static final Logger LOGGER = Logger.getLogger(FileUtil.class);
	private FileUtil(){
		
	}
	
	
	/**
	 * 
	* 方法用途和描述:上传的合同模板文件
	* @param upfile  需要上传的文件
	* @param upPath 上传的地址
	* @param fileName 文件名
	* @param flat 是否备份
	* @param num 当上传的文件名已经存在，则自动在文件名前追加数字
	* @author chenliang 新增日期：2012-12-19
	* @since ContractManage
	 */
	public static void bakTemplatesDoc(File upfile,String upPath,String fileName,boolean flat,int num){
		try {
			//文件上传
			if(num!=0){
				fileName = num+"_"+fileName;
			}
			File file = new File(upPath,fileName);
			if(!file.exists()){
				FileUtils.copyFile(upfile,file);
			}else{
				bakTemplatesDoc(upfile, upPath, fileName, true,++num);
			}
			if(flat){
				bakFile(upfile, fileName);
			}
		} catch (IOException e) {
			LOGGER.error("bakTemplatesDoc error.",e);
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 备份文件
	* @param upfile  需要备份的文件
	* @param bakFileName  备份文件名
	* @author chenliang 新增日期：2012-12-19
	* @since ContractManage
	 */
	public static void bakFile(File upfile,String bakFileName){
		try {
			//文件备份	
			AppConfig config = AppConfig.getInstance();
			String bakPath = config.getString("bakTemplatesPath");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
			String nowData = sdf.format(new Date());
			bakFileName = "bak_"+bakFileName;
			File fs = new File(bakPath);
			if(!fs.exists()){
				fs.mkdir();
			}
			File bakFile = new File(bakPath, bakFileName);
			FileUtils.copyFile(upfile, bakFile);
		} catch (Exception e) {
			LOGGER.error("bakFile error.",e);
		}
	}
	


	/**
	 * 
	* 方法用途和描述: 删除目录下的文件
	* @param path 文件目录，包含文件名
	* @author chenliang 新增日期：2012-12-19
	* @since ContractManage
	 */
	public static void deleteFile(String path) {
		LOGGER.info("path:"+path);
		if(!BlankUtil.isBlank(path)){
			File file = new File(path);
			if(file.exists() && file.isFile()){
				file.delete();
			}else{
				LOGGER.info("file is not found!");
			}
		}
	}
	
}
