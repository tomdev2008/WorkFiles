package com.unicom.mms.base.ftp;

import java.io.IOException;

import org.apache.commons.configuration.CompositeConfiguration;
import org.apache.commons.net.ftp.FTPClient;

import com.unicom.mms.util.Config;
import com.unicom.mms.util.FtpUtil;

public class FtpUploadFiles {
	private static FtpUploadFiles instance = null;
	private CompositeConfiguration config = Config.getConfig();
	private static boolean isFtpSync;
	private static String ftpHost;
	private static String ftpUser;
	private static String ftpPasswd;
	private static Integer ftpPort;
	private static FTPClient  client = null;
	private static FtpUtil ftpUtil = FtpUtil.getInstance();
	
	private FtpUploadFiles(){
		isFtpSync = config.getString("isFtpSync").equals("true")?true:false;
		ftpHost=config.getString("ftpHost");
		ftpUser=config.getString("ftpUser");
		ftpPasswd=config.getString("ftpPasswd");
		ftpPort=config.getInteger("ftpPort", 21);
		
		try {
			if(isFtpSync){
				client = FtpUtil.connentFtp(ftpHost, ftpPort, ftpUser, ftpPasswd);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static FtpUploadFiles getInstance(){
		if(instance==null)
			instance = new FtpUploadFiles();
			return instance;
	}
	
	/**
	 * 
	 * 上传mms文件
	 * 
	 * @param localPath
	 * @param fileName
	 * @param createDir
	 * @author zhangjh 新增日期：2013-4-25
	 * @since mms-resources
	 */
	public void uploadMmsFile(String localPath,String fileName,String toftpPath){
		if(!isFtpSync)
			return ;
		try {
			if(!client.isConnected()){
				client = FtpUtil.connentFtp(ftpHost, ftpPort, ftpUser, ftpPasswd);
			}
			if(!client.changeWorkingDirectory(toftpPath)){
				client.makeDirectory(toftpPath);
			}
			ftpUtil.putFile(client, toftpPath,fileName, localPath+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * 上传DIY MMS的图片
	 * 
	 * @param localPath
	 * @author zhangjh 新增日期：2013-4-20
	 * @since mms-resources
	 */
	public void uploadDiymms(String localPath,String fileName,String createDir){
		if(!isFtpSync)
			return ;
		String diymmsFilePath=config.getString("diymmsFilePath")+createDir;
		try {
			if(!client.isConnected()){
				client = FtpUtil.connentFtp(ftpHost, ftpPort, ftpUser, ftpPasswd);
			}
			if(!client.changeWorkingDirectory(diymmsFilePath)){
				client.makeDirectory(diymmsFilePath);
			}
			ftpUtil.putFile(client, diymmsFilePath,fileName, localPath+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * 上传饰品
	 * 
	 * @param localPath
	 * @author zhangjh 新增日期：2013-4-23
	 * @since mms-resources
	 */
	public void uploadAccessories(String localPath,String fileName,String createDir){
		if(!isFtpSync)
			return ;
		String AccessoriesFilePath=config.getString("AccessoriesFilePath")+createDir;
		try {
			if(!client.isConnected()){
				client = FtpUtil.connentFtp(ftpHost, ftpPort, ftpUser, ftpPasswd);
			}
			if(!client.changeWorkingDirectory(AccessoriesFilePath)){
				client.makeDirectory(AccessoriesFilePath);
			}
			ftpUtil.putFile(client, AccessoriesFilePath,fileName, localPath+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	 
	/**
	 * 
	 * 上传音乐文件
	 * 
	 * @param localPath
	 * @author zhangjh 新增日期：2013-4-23
	 * @since mms-resources
	 */
	public void uploadMusic(String localPath,String fileName,String createDir){
		if(!isFtpSync)
			return ;
		String MusicFilePath=config.getString("MusicFilePath")+createDir;
		try {
			if(!client.isConnected()){
				client = FtpUtil.connentFtp(ftpHost, ftpPort, ftpUser, ftpPasswd);
			}
			if(!client.changeWorkingDirectory(MusicFilePath)){
				client.makeDirectory(MusicFilePath);
			}
			ftpUtil.putFile(client, MusicFilePath,fileName, localPath+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * 上传相框
	 * 
	 * @param localPath
	 * @author zhangjh 新增日期：2013-4-23
	 * @since mms-resources
	 */
	public void uploadPhotoFrame(String localPath,String fileName,String createDir){
		if(!isFtpSync)
			return ;
		String PhotoFrameFilePath=config.getString("PhotoFrameFilePath")+createDir;
		try {
			if(!client.isConnected()){
				client = FtpUtil.connentFtp(ftpHost, ftpPort, ftpUser, ftpPasswd);
			}
			if(!client.changeWorkingDirectory(PhotoFrameFilePath)){
				client.makeDirectory(PhotoFrameFilePath);
			}
			ftpUtil.putFile(client, PhotoFrameFilePath,fileName, localPath+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * 上传邮戳
	 * 
	 * @param localPath
	 * @author zhangjh 新增日期：2013-4-23
	 * @since mms-resources
	 */
	public void uploadPostMark(String localPath,String fileName,String createDir){
		if(!isFtpSync)
			return ;
		String PostMarkFilePath=config.getString("PostMarkFilePath")+createDir;
		try {
			if(!client.isConnected()){
				client = FtpUtil.connentFtp(ftpHost, ftpPort, ftpUser, ftpPasswd);
			}
			if(!client.changeWorkingDirectory(PostMarkFilePath)){
				client.makeDirectory(PostMarkFilePath);
			}
			ftpUtil.putFile(client, PostMarkFilePath,fileName, localPath+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * 上传邮票
	 * 
	 * @param localPath
	 * @author zhangjh 新增日期：2013-4-23
	 * @since mms-resources
	 */
	public void uploadStamps(String localPath,String fileName,String createDir){
		if(!isFtpSync)
			return ;
		String StampsFilePath=config.getString("StampsFilePath")+createDir;
		try {
			if(!client.isConnected()){
				client = FtpUtil.connentFtp(ftpHost, ftpPort, ftpUser, ftpPasswd);
			}
			if(!client.changeWorkingDirectory(StampsFilePath)){
				client.makeDirectory(StampsFilePath);
			}
			ftpUtil.putFile(client, StampsFilePath,fileName, localPath+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * 上传字体
	 * 
	 * @param localPath
	 * @author zhangjh 新增日期：2013-4-23
	 * @since mms-resources
	 */
	public void uploadFonts(String localPath,String fileName,String createDir){
		if(!isFtpSync)
			return ;
		String FontsFilePath=config.getString("FontsFilePath")+createDir;
		try {
			if(!client.isConnected()){
				client = FtpUtil.connentFtp(ftpHost, ftpPort, ftpUser, ftpPasswd);
			}
			if(!client.changeWorkingDirectory(FontsFilePath)){
				client.makeDirectory(FontsFilePath);
			}
			
			ftpUtil.putFile(client, FontsFilePath,fileName, localPath+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void uploadTemplateCard(String localPath,String fileName,String createDir){
		if(!isFtpSync)
			return ;
		String TemplateCardFilePath=config.getString("TemplateCardFilePath")+createDir;
		try {
			if(!client.isConnected()){
				client = FtpUtil.connentFtp(ftpHost, ftpPort, ftpUser, ftpPasswd);
			}
			if(!client.changeWorkingDirectory(TemplateCardFilePath)){
				client.makeDirectory(TemplateCardFilePath);
			}
			ftpUtil.putFile(client, TemplateCardFilePath,fileName, localPath+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
