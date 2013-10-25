package com.unicom.mms.base.constants;

import java.util.HashMap;

import org.apache.commons.configuration.CompositeConfiguration;

import com.unicom.mms.parameters.PathManage;
import com.unicom.mms.resources.FileType;
import com.unicom.mms.resources.UrlPathConstants;
import com.unicom.mms.util.Config;


/**
 * 
 * 本地tomcat文件目录
 * 
 * @author zhangjh 新增日期：2013-4-20
 * @since mms-resources
 */
public class FilePathConstants {
	private CompositeConfiguration config = Config.getConfig();
	/**
	 * 字体路径
	 */
	public static String FontsPath = "";  
	/**
	 * DIY彩信
	 */
	public static  String DiymmsFilePath = "";  
	/**
	 * 模版明信片
	 */
	public static  String TemplateCardPath = "";  
	/**
	 * 饰品
	 */
	public static  String AccessoriesFilePath = "";  
	/**
	 * 音乐文件
	 */
	public static  String MusicFilePath = "";  
	/**
	 * 相框
	 */
	public static  String PhotoFrameFilePath = "";  
	/**
	 * 邮戳
	 */
	public static  String PostMarkFilePath = "";  
	/**
	 * 邮票
	 */
	public static  String StampsFilePath = "";  
	/**
	 * 临时存放
	 */
	public static  String TempDataFilePath = "";  
	
	/**
	 * 系统文件存放
	 */
	public static  String SystemDataFilePath = "";  
	/**
	 * 用户文件存放
	 */
	public static  String UserDataFilePath = "";  
	/**
	 * 背景图片
	 */
	public static String BackgroundUrlPath = "";
	
	/**
	 * 根目录
	 */
	public static  String RootFilePath = "";  
	
	public static HashMap<String,PathManage> pathMap = new HashMap<String, PathManage>();
	
	private static FilePathConstants instance = null;
	private FilePathConstants(){
		
	}
	public static FilePathConstants getInstance(){
		if(instance == null)
			instance = new FilePathConstants();
		return instance;
	}
	
	/**
	 * 
	 * 返回绝对路径
	 * 
	 * @param fileUrl
	 * @return
	 * @author zhangjh 新增日期：2013-5-9
	 * @since mms-resources
	 */
	public static String absoluteAddress (String fileUrl){
		java.util.Properties prop = System.getProperties();		
		String os = prop.getProperty("os.name");		
		String newPath= RootFilePath +fileUrl ;
		if(os.startsWith("win") || os.startsWith("Win")) {
			newPath =newPath.replaceAll("\\\\","//");
		}else{
			newPath = newPath.replaceAll("\\\\","/");
		}
		return newPath;
	}
	
	public void initPathManage(){
		PathManage p = new PathManage();
		p.setFileType(FileType.FontsType);
		p.setUrl(UrlPathConstants.FontsUrlPath);
		p.setLocalPath(FilePathConstants.FontsPath);
		p.setFtpPath(config.getString("FontsFilePath"));
		FilePathConstants.pathMap.put(p.getFileType(), p);
		System.out.println("FontsType:"+p.toString());
		
		p = new PathManage();
		p.setFileType(FileType.DiymmsType);
		p.setUrl(UrlPathConstants.DiymmsUrlPath);
		p.setLocalPath(FilePathConstants.DiymmsFilePath);
		p.setFtpPath(config.getString("diymmsFilePath"));
		FilePathConstants.pathMap.put(p.getFileType(), p);
		System.out.println("DiymmsType:"+p.toString());
		
		p = new PathManage();
		p.setFileType(FileType.AccessoriesType);
		p.setUrl(UrlPathConstants.AccessoriesUrlPath);
		p.setLocalPath(FilePathConstants.AccessoriesFilePath);
		p.setFtpPath(config.getString("AccessoriesFilePath"));
		FilePathConstants.pathMap.put(p.getFileType(), p);
		System.out.println("AccessoriesType:"+p.toString());
		
		p = new PathManage();
		p.setFileType(FileType.MusicType);
		p.setUrl(UrlPathConstants.MusicUrlPath);
		p.setLocalPath(FilePathConstants.MusicFilePath);
		p.setFtpPath(config.getString("MusicFilePath"));
		FilePathConstants.pathMap.put(p.getFileType(), p);
		System.out.println("MusicType:"+p.toString());
		
		
		p = new PathManage();
		p.setFileType(FileType.PhotoFrameType);
		p.setUrl(UrlPathConstants.PhotoFrameUrlPath);
		p.setLocalPath(FilePathConstants.PhotoFrameFilePath);
		p.setFtpPath(config.getString("PhotoFrameFilePath"));
		FilePathConstants.pathMap.put(p.getFileType(), p);
		System.out.println("PhotoFrameType:"+p.toString());
		
		p = new PathManage();
		p.setFileType(FileType.PostMarkType);
		p.setUrl(UrlPathConstants.PostMarkUrlPath);
		p.setLocalPath(FilePathConstants.PostMarkFilePath);
		p.setFtpPath(config.getString("PostMarkFilePath"));
		FilePathConstants.pathMap.put(p.getFileType(), p);
		System.out.println("PostMarkType:"+p.toString());
		
		p = new PathManage();
		p.setFileType(FileType.StampsType);
		p.setUrl(UrlPathConstants.StampsUrlPath);
		p.setLocalPath(FilePathConstants.StampsFilePath);
		p.setFtpPath(config.getString("StampsFilePath"));
		FilePathConstants.pathMap.put(p.getFileType(), p);
		System.out.println("StampsType:"+p.toString());
		
		p = new PathManage();
		p.setFileType(FileType.TempDataType);
		p.setUrl(UrlPathConstants.TempDataUrlPath);
		p.setLocalPath(FilePathConstants.TempDataFilePath);
		p.setFtpPath(null);
		FilePathConstants.pathMap.put(p.getFileType(), p);
		System.out.println("TempDataType:"+p.toString());
		
		p = new PathManage();
		p.setFileType(FileType.TemplateCard);
		p.setUrl(UrlPathConstants.TemplateCardPath);
		p.setLocalPath(FilePathConstants.TemplateCardPath);
		p.setFtpPath("TemplateCardFilePath");
		FilePathConstants.pathMap.put(p.getFileType(), p);
		System.out.println("TemplateCard:"+p.toString());
		
		p = new PathManage();
		p.setFileType(FileType.Background);
		p.setUrl(UrlPathConstants.BackgroundUrlPath);
		p.setLocalPath(FilePathConstants.BackgroundUrlPath);
		p.setFtpPath("BackgroundUrlPath");
		FilePathConstants.pathMap.put(p.getFileType(), p);
		System.out.println("BackgroundUrlPath:"+p.toString());
		
		p = new PathManage();
		p.setFileType(FileType.UserData);
		p.setUrl(UrlPathConstants.UserDataUrlPath);
		p.setLocalPath(FilePathConstants.UserDataFilePath);
		p.setFtpPath("UserDataFilePath");
		FilePathConstants.pathMap.put(p.getFileType(), p);
		System.out.println("UserDataFilePath:"+p.toString());
	}
}
