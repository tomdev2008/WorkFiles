package com.unicom.mms.base.ftp;

import java.io.IOException;

import org.apache.commons.configuration.CompositeConfiguration;
import org.apache.commons.net.ftp.FTPClient;

import com.unicom.mms.base.constants.FilePathConstants;
import com.unicom.mms.resources.UrlPathConstants;
import com.unicom.mms.util.Config;
import com.unicom.mms.util.FtpUtil;

public class FtpSyncFiles {
	private static FtpSyncFiles instance = null;
	private CompositeConfiguration config = Config.getConfig();
	private static boolean isFtpSync;
	private static String ftpHost;
	private static String ftpUser;
	private static String ftpPasswd;
	private static Integer ftpPort;
	private static FTPClient  client = null;
	
	private FtpSyncFiles(){
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
	
	public static FtpSyncFiles getInstance(){
		if(instance==null)
			instance = new FtpSyncFiles();
			return instance;
	}
	
	/**
	 * 
	 * 同步系统下的文件
	 * 
	 * @author zhangjh 新增日期：2013-4-25
	 * @since mms-resources
	 */
	public void syncSystemData(){
		if(!isFtpSync)
			return ;
		String rootFilePath=config.getString("RootFilePath");
		try {
			if(client==null || !client.isConnected()){
				client = FtpUtil.connentFtp(ftpHost, ftpPort, ftpUser, ftpPasswd);
				if(!client.isConnected()){
					return ; 
				}
			}
			FtpUtil ftpUtil = FtpUtil.getInstance();
			ftpUtil.downloadDirFiles(client, rootFilePath+UrlPathConstants.DiymmsUrlPath, FilePathConstants.RootFilePath, UrlPathConstants.DiymmsUrlPath);
			ftpUtil.downloadDirFiles(client, rootFilePath+UrlPathConstants.TemplateCardPath, FilePathConstants.RootFilePath, UrlPathConstants.TemplateCardPath);
			ftpUtil.downloadDirFiles(client, rootFilePath+UrlPathConstants.MusicUrlPath, FilePathConstants.RootFilePath, UrlPathConstants.MusicUrlPath);
			ftpUtil.downloadDirFiles(client, rootFilePath+UrlPathConstants.PhotoFrameUrlPath, FilePathConstants.RootFilePath, UrlPathConstants.PhotoFrameUrlPath);
			ftpUtil.downloadDirFiles(client, rootFilePath+UrlPathConstants.PostMarkUrlPath, FilePathConstants.RootFilePath, UrlPathConstants.PostMarkUrlPath);
			ftpUtil.downloadDirFiles(client, rootFilePath+UrlPathConstants.StampsUrlPath, FilePathConstants.RootFilePath, UrlPathConstants.StampsUrlPath);
			ftpUtil.downloadDirFiles(client, rootFilePath+UrlPathConstants.AccessoriesUrlPath, FilePathConstants.RootFilePath, UrlPathConstants.AccessoriesUrlPath);
			ftpUtil.downloadDirFiles(client, rootFilePath+UrlPathConstants.FontsUrlPath, FilePathConstants.RootFilePath, UrlPathConstants.FontsUrlPath);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * 同步用户数据
	 * 
	 * @author zhangjh 新增日期：2013-4-25
	 * @since mms-resources
	 */
	public void syncUserData(){
		if(!isFtpSync)
			return ;
		String rootFilePath=config.getString("RootFilePath");
		try {
			if(!client.isConnected()){
				client = FtpUtil.connentFtp(ftpHost, ftpPort, ftpUser, ftpPasswd);
			}
			FtpUtil ftpUtil = FtpUtil.getInstance();
			ftpUtil.downloadDirFiles(client, rootFilePath+UrlPathConstants.UserDataUrlPath, FilePathConstants.RootFilePath, UrlPathConstants.UserDataUrlPath);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
