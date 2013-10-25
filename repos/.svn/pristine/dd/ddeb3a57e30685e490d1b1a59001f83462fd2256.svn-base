package com.unicom.mms.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.log4j.Logger;


/**
 * 
 * 功能描述:Ftp工具类
 * <p>版权所有：金鹏科技
 * <p>未经本公司许可，不得以任何方式复制或使用本程序任何部分
 *
 * @author chenxinwei 新增日期：2010-7-30
 * @author 你的姓名 修改日期：2010-7-30
 * @since zte_crbt_bi
 */
public class FtpUtil {
	private static final Logger log = Logger.getLogger(FtpUtil.class);
	private static FtpUtil instance = null;
	public static FtpUtil getInstance(){
		if(instance==null)
			instance = new FtpUtil();
		
		return instance;
	}

	public static int deleteFile(String host,int port,String user,String passwd,String remoteDir,String listNames[]) throws IOException{
		FTPClient ftp = FtpUtil.connentFtp(host, port, user, passwd);
		ftp.changeWorkingDirectory(remoteDir);
		int result = 0;
		for (int i = 0; i < listNames.length; i++) {
			boolean flag = ftp.deleteFile(remoteDir + listNames[i]);
			if(flag)
				result++;
			log.info("delete file:"+remoteDir + listNames[i]);
		}
		return result;
	}
	
	public static String[] listNames(String host,int port,String user,String passwd,String remoteDir) throws IOException{
		FTPClient ftp = FtpUtil.connentFtp(host, port, user, passwd);
		ftp.changeWorkingDirectory(remoteDir);
		return ftp.listNames();
	}

	/**
	 * 方法用途和描述: 从FTP指定的目录下载制定扩展名的文件
	 * @param host 
	 * @param port
	 * @param remoteDir 远程目录
	 * @param localDir 本地目录
	 * @param fileType 文件类型，如果为NULL则下载所有文件
	 * @param tempDir 下载时使用的临时目录，如果为null则不使用临时目录
	 * @param delRemoteFile 下载后是否删除FTP服务器上的文件
	 * @return
	 * @throws IOException
	 * @author chenxinwei 新增日期：2010-7-31
	 * @author 你的姓名 修改日期：2010-7-31
	 * @since zte_crbt_bi
	 */
	public static int downFiles(String host,int port,String user,String passwd,
			String remoteDir,String localDir,String fileType,
			String tempDir,boolean delRemoteFile) throws IOException{
		int downFiles = 0;
		String[] ftpFilesNames = null;
		File downDir = null;
		if(tempDir!=null) downDir = new File(localDir+File.separator+tempDir);
		else downDir = new File(localDir);
		if(!downDir.exists()){
			if(!downDir.mkdirs()){
				log.error("Fail mkdirs=" +downDir.getPath()+".Can't down files!");
				return 0;
			}
		}
		String downPath = downDir.getPath();
		FileOutputStream fos = null;
		FTPClient ftp = FtpUtil.connentFtp(host, port, user, passwd);
		if(!ftp.isConnected()){
			log.error("The ftp is no connected!Stop to down files!");
			return 0;
		}
		boolean isChange = ftp.changeWorkingDirectory(remoteDir);
		if(!isChange)
			log.info("changeWorkingDirectory:"+isChange+".dir:"+remoteDir);
		ftpFilesNames = ftp.listNames();
		boolean downResult = false;
		File file = null;
		
		for(int i=0;i<ftpFilesNames.length;i++){
			if(fileType==null||ftpFilesNames[i].endsWith(fileType)){
				try{
					log.info("Downing " + ftpFilesNames[i]);
					downResult = false;
					file = new File(downPath+File.separator+ftpFilesNames[i]);
					fos = new FileOutputStream(file);
					downResult = ftp.retrieveFile(ftpFilesNames[i], fos);
					fos.flush();
					log.info("Downed " +ftpFilesNames[i] +" to "
							+ file.getPath() + "." + downResult);
					if(delRemoteFile){
						log.info("Deleted " +ftpFilesNames[i] +" on server." + ftp.deleteFile(ftpFilesNames[i]));
					}
					downFiles++;
				}catch(Exception e){
					log.error("Fail to down file:"+ftpFilesNames[i],e);
				}finally{
					if(fos!=null){
						try {
							fos.close();
							if(tempDir!=null) FileUtil.moveFile(file, new File(localDir+File.separator+file.getName()));
						} catch (IOException e) {
							log.error(e.getMessage());
						}
					}
				}
			}
		}
		if(tempDir!=null){
			String[] files = downDir.list();
			if(files==null||files.length==0)downDir.delete();
		}
		ftp.disconnect();
		return downFiles;
	}
	

	public boolean putFile(FTPClient client, String toFtpPath, String fileName,String filePath){
		boolean result = false;
		try{
			log.info("Uping file:"+filePath);
			FileInputStream input = new FileInputStream(filePath);  
			result = uploadFileToFtp(client,fileName, input, toFtpPath);  
			log.info("Put file to ftp.File:"+ toFtpPath + "," + result);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public static FTPClient connentFtp(String host,int port,String user,String passwd) throws IOException{
		FTPClient ftp=new FTPClient();
		ftp.setControlEncoding("gbk"); 
		log.info("ftp.setControlEncoding==gbk");
		ftp.connect(host, port);
		boolean result = ftp.login(user, passwd);
		ftp.setFileTransferMode(FTP.BINARY_FILE_TYPE);
		if(result){
			log.info("Connected ftp:"+host);
		}else{
			ftp.disconnect();
			log.error("Fail to login to ftp!Please check the ftp setting!");
		}
		return ftp;
	}
	
	/** 
     * 方法用于上传文件到FTP服务器的指定文件夹中 
     *  
     * @param fileName :上传文件的名称 
     * @param input :上传文件的输入流对象 
     * @param toFtpPath :上传到FTP的目的路径 
     *  
     * @return boolean:表示上传是否成功 
     *  
     */  
    public boolean uploadFileToFtp(FTPClient ftpClient,String fileName, InputStream input,  
            String toFtpPath) {  
        boolean bool = false;  
        try {  
            // 使得能够处理中文编码  
            fileName = new String(fileName.getBytes("GBK"), "ISO-8859-1");  
            toFtpPath = new String(toFtpPath.getBytes("GBK"), "ISO-8859-1");  
            // 转到上传文件的FTP目录中  
            ftpClient.changeWorkingDirectory(toFtpPath);  
            // 设置处理文件的类型为字节流的形式  
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);  
            // 如果缺省该句 传输txt正常 但图片和其他格式的文件传输出现乱码  
            ftpClient.storeFile(fileName, input);  
            input.close();  
            bool = true;  
        } catch (IOException e) {  
            bool = false;  
            e.printStackTrace();  
        }   
        return bool;  
    }  
    
    /** 
     * 方法用于从FTP服务器中下载文件 
     *  
     * @param ftpUrl :下载文件所处FTP中路径 
     * @param fileName :下载的文件名称 
     * @param outputSream :下载文件的输出流对象 
     *  
     * @return boolean :表示是否上传成功 
     *  
     */  
    public boolean downloadFileFromFtp(FTPClient ftpClient,String ftpUrl, String fileName,OutputStream outputStream) {  
        boolean bool = false;  
        try {  
            ftpClient.changeWorkingDirectory(ftpUrl);  
            FTPFile[] ftpFile = ftpClient.listFiles();  
            for (int i = 0; i < ftpFile.length; i++) {  
                if (fileName.equals(ftpFile[i].getName())) {  
                    ftpClient.retrieveFile(new String(ftpFile[i].getName()  
                            .getBytes("GBK"), "ISO-8859-1"), outputStream);  
                    outputStream.flush();  
                    outputStream.close();  
                }  
            }  
            bool = true;  
        } catch (IOException e) {  
            e.printStackTrace();  
            bool = false;  
        }  
        return bool;  
    }  

	 //上传整个目录到FTP的指定目录中  
    public void uploadDirFiles(FTPClient ftpClient,String dirPath,String toRemotePath) throws IOException{  
        if (dirPath!=null && !dirPath.equals("")) {  
            //建立上传目录的File对象  
            File dirFile = new File(dirPath);  
            //判断File对象是否为目录类型  
            if (dirFile.isDirectory()) {  
                //如果是目录类型。  
                //在FTP上创建一个和File对象文件相同名称的文件夹  
                ftpClient.makeDirectory(toRemotePath+"//"+dirFile.getName());  
                //获得File对象中包含的子目录数组  
                File[] subFiles = dirFile.listFiles();  
                //路径  
                String path = toRemotePath+"//"+dirFile.getName();  
                System.out.println(path);  
                //判断数组是否为空  
                if (subFiles!=null && subFiles.length>0) {  
                    //遍历整个File数组  
                    for (int i = 0; i < subFiles.length; i++) {  
                        //判断是否为目录类型  
                        if (subFiles[i].isDirectory()) {  
                            //如果为目录类型  
                            //跳转到FTP的根目录层级  
                            ftpClient.changeWorkingDirectory("//");  
                            //在FTP上建立相同的目录名称  
                            ftpClient.makeDirectory(path+"//"+subFiles[i].getName());  
                            //递归调用自身方法，进行到下一层级的目录循环  
                            uploadDirFiles(ftpClient,subFiles[i].getAbsolutePath(), path);  
                        } else {  
                            //如果为文件类型  
                            //建立一个文件输出流对象  
                            FileInputStream input = new FileInputStream(subFiles[i]);  
                            //TODO 调用文件上传方法，将文件上传到FTP上  
                            uploadFileToFtp(ftpClient,subFiles[i].getName(), input, path+"//");  
                            //关闭文件输入流  
                            input.close();  
                        }  
                    }  
                }  
            } else {  
                //如果为文件类型  
                //建立一个文件输出流对象  
                FileInputStream input = new FileInputStream(dirFile);  
                //调用文件上传方法，将文件上传到FTP上  
                uploadFileToFtp(ftpClient,dirFile.getName(), input, toRemotePath);  
                //关闭文件输入流  
                input.close();  
            }  
        }  
    }  
      
    //本方法用于下载FTP上的目录结构到本地中  
    public  void downloadDirFiles(FTPClient ftpClient,String remotePath,String localPath,String fileName) throws IOException{  
    	java.util.Properties prop = System.getProperties();		
		String os = prop.getProperty("os.name");		
		String local_sp = "";
		if(os.startsWith("win") || os.startsWith("Win")) {
			local_sp = "\\";
		}else{
			local_sp = "//";
		}
        if (remotePath!=null && !remotePath.equals("")) {  
            //在本地建立一个相同的文件目录  
            File localFile = new File(localPath+local_sp+fileName);  
            localFile.mkdirs();  
            //获得目录在本地的绝对路径  
            localPath = localFile.getAbsolutePath();  
            //获得FTPFile对象数组  
            FTPFile[] ftpFiles = ftpClient.listFiles(new String(remotePath.getBytes("GBK"),"ISO-8859-1"));  
            if (ftpFiles!=null && ftpFiles.length>0) {  
                for (int i = 0; i < ftpFiles.length; i++) {  
                    FTPFile subFile = ftpFiles[i];  
                    //判断是否为目录结构  
                    if (subFile.isDirectory()) {  
                        //如果为目录结构  
                        //调用自身方法，进行下一层级目录循环  
                        downloadDirFiles(ftpClient,remotePath+subFile.getName(), localPath, subFile.getName());  
                        System.out.println("进行下一层级目录循环:"+remotePath+File.separator+subFile.getName());  
                    } else {  
                        //如果不为目录结构,为文件类型  
                        FileOutputStream outputStream = new FileOutputStream(new File(localPath+local_sp+subFile.getName()));  
                        //调用下载方法对文件进行下载  
                        downloadFileFromFtp(ftpClient,remotePath, subFile.getName(), outputStream);  
                        //关闭文件输出流  
                        outputStream.close();  
                        //System.out.println("下载文件:"+localPath+local_sp+subFile.getName());  
                    }  
                }  
            }  
        }  
    }


	public static void main(String args[]){
		try {
			FTPClient c = FtpUtil.connentFtp("192.168.1.11", 21, "kxcomm", "kxcomm123");
			c.setFileType(FTPClient.BINARY_FILE_TYPE);
			boolean isDir = c.changeWorkingDirectory("/home/kxcomm/contractDocFile");
			log.info("	 is "+isDir);
			//FtpUtil.putFile(c, "/home/kxcomm/contractDocFile/nishuone.doc", "E://kangxun//hahaha.doc");
			FtpUtil ftpUtil = FtpUtil.getInstance();
			//ftpUtil.downloadDirFiles(c, "/home/kxcomm/mms/systemData", "D:\\192.168.1.11\\home\\test", "systemData");
			ftpUtil.putFile(c, "/home/kxcomm/mms/systemData", "aaa.mid", "D:\\192.168.1.11\\home\\kxcomm\\mms\\systemData\\Music\\mlh.mid");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
