package com.unicom.mms.socket;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.Callable;
import java.util.concurrent.CompletionService;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorCompletionService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.unicom.mms.base.constants.FilePathConstants;
import com.unicom.mms.base.ftp.FtpUploadFiles;
import com.unicom.mms.parameters.PathManage;
import com.unicom.mms.resources.FileType;
import com.unicom.mms.util.FileUtil;

public class MmsServerSocket {

	   
    private int listenPort;  
   
    private String savePath;  
    
    private UploadObject uploadObject=null;
    
   
    /** 
     * 构造方法 
     * 
     * @param listenPort 侦听端口 
     * @param savePath   接收的文件要保存的路径 
     * 
     * @throws IOException 如果创建保存路径失败 
     */  
    public MmsServerSocket(int listenPort, String savePath) throws IOException {  
        this.listenPort = listenPort;  
        this.savePath = savePath;  
   
        File file = new File(savePath);  
        if (!file.exists() && !file.mkdirs()) {  
            throw new IOException("无法创建文件夹 " + savePath);  
        }  
    }  
   
    // 开始侦听  
    public void start() {  
    	System.out.println("Socket Server Starting.......");
        new ListenThread().start();  
    	System.out.println("Socket Server Started.........");
    }  
   
    // 网上抄来的，将字节转成 int。b 长度不得小于 4，且只会取前 4 位。  
    public static int b2i(byte[] b) {  
        int value = 0;  
        for (int i = 0; i < 4; i++) {  
            int shift = (4 - 1 - i) * 8;  
            value += (b[i] & 0x000000FF) << shift;  
        }  
        return value;  
    }  
   
   
    /** 
     * 侦听线程 
     */  
    private class ListenThread extends Thread {  
    	ExecutorService threadPool = Executors.newCachedThreadPool();  
        CompletionService<UploadObject> cs = new ExecutorCompletionService<UploadObject>(threadPool);  
        @Override  
        public void run() {  
            try {  
                ServerSocket server = new ServerSocket(listenPort);    
                // 开始循环  
                while (true) {  
                    Socket socket = server.accept();  
                    cs.submit(new HandleThread(socket));
                    try {  
                        UploadObject result = cs.take().get();
                        // 如何实现接收完文件后上传到服务器ftp,因为这是多线程,如果有回调方法可能比较好
                        try{
                         	FtpUploadFiles ftpUploadFiles = FtpUploadFiles.getInstance();
                         	PathManage pathManage = FilePathConstants.pathMap.get(result.getFileType());
                            if(pathManage!=null && !pathManage.getFileType().equals(FileType.TempDataType)){
                            	String tpFtpDir = pathManage.getFtpPath();
                            	if(result.getCreateDir()!=null){
                            		tpFtpDir +=result.getCreateDir();
                            	}
                            	ftpUploadFiles.uploadMmsFile(result.getPath(), result.getNewLocalFile(), tpFtpDir);
                            }
                         }catch(Exception e){
                         	e.printStackTrace();
                         }
                    } catch (InterruptedException e) {  
                        e.printStackTrace();  
                    } catch (ExecutionException e) {  
                        e.printStackTrace();  
                    }  
                }  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
            
        }  
    }  
   
    /** 
     * 读取流并保存文件的线程 
     */  
    private class HandleThread implements Callable<UploadObject> {  
   
        private Socket socket;  
   
        private HandleThread(Socket socket) {  
            this.socket = socket;  
        }  
   
        
        public UploadObject call() throws Exception  {  
            try {  
                InputStream is = socket.getInputStream();  
                readAndSave(is);  
            } catch (IOException e) {  
                e.printStackTrace();  
            } finally {  
                try {  
                    socket.close();  
                } catch (IOException e) {  
                    // nothing to do  
                }  
            }  
            return uploadObject;
        }  
   
        // 从流中读取内容并保存  
        private void readAndSave(InputStream is) throws IOException {  
        	 uploadObject = new UploadObject();
        	 String fileType = getFileType(is);  
        	 System.out.println("fileType:"+fileType);
        	 String createDir = getCreateDir(is);
            String filename = getFileName(is);  
            int file_len = readInteger(is);  
            System.out.println("接收文件：" + filename + "，长度：" + file_len);  
            //本地路径
            StringBuilder path = new StringBuilder();
            PathManage pathManage = FilePathConstants.pathMap.get(fileType);
            if(pathManage!=null){
            	path.append(pathManage.getLocalPath());
            }
            if(!"null".equals(createDir)){
            	path.append(createDir+"/");
            	uploadObject.setCreateDir(createDir+"/");
            }
            String filePath = path + filename;
            FileUtil.checkDirectory(path.toString());
            readAndSave0(is, filePath, file_len,fileType,filePath);  
            System.out.println("文件保存成功（" + file_len + "字节）。");  
           
            uploadObject.setFileType(fileType);
            uploadObject.setPath(path.toString());
            uploadObject.setNewLocalFile(filename);
            System.out.println("set uploadObject" + uploadObject.toString());
        }  
   
        private void readAndSave0(InputStream is, String path, int file_len,String fileType,String filePath) throws IOException {  
            FileOutputStream os = getFileOS(path);  
            readAndWrite(is, os, file_len);  
            os.close();  
        }  
   
        // 边读边写，直到读取 size 个字节  
        private void readAndWrite(InputStream is, FileOutputStream os, int size) throws IOException {  
            byte[] buffer = new byte[4096];  
            int count = 0;  
            while (count < size) {  
                int n = is.read(buffer);  
                // 这里没有考虑 n = -1 的情况  
                os.write(buffer, 0, n);  
                count += n;  
            }  
        }  
   
        private String getCreateDir(InputStream is) throws IOException {  
            int name_len = readInteger(is);  
            byte[] result = new byte[name_len];  
            is.read(result);  
            return new String(result);  
        }  
   
        
		/**
		 * 
		 * 获取分类
		 * 
		 * @param is
		 * @return
		 * @throws IOException
		 * @author zhangjh 新增日期：2013-4-25
		 * @since mms-resources
		 */
        private String getFileType(InputStream is) throws IOException {  
            int name_len = readInteger(is);  
            byte[] result = new byte[name_len];  
            is.read(result);  
            return new String(result);  
        }  
   
        
        // 读取文件名  
        private String getFileName(InputStream is) throws IOException {  
            int name_len = readInteger(is);  
            byte[] result = new byte[name_len];  
            is.read(result);  
            return new String(result);  
        }  
   
        // 读取一个数字  
        private int readInteger(InputStream is) throws IOException {  
            byte[] bytes = new byte[4];  
            is.read(bytes);  
            return b2i(bytes);  
        }  
   
        // 创建文件并返回输出流  
        private FileOutputStream getFileOS(String path) throws IOException {  
            File file = new File(path);  
            if (!file.exists()) {  
                file.createNewFile();  
            }  
   
            return new FileOutputStream(file);  
        }  
    }  
    
    public static void main(String[] args) throws Exception {  
    	  int port = 7788;  
          new MmsServerSocket(port, "D://home//").start();  
    }
}
