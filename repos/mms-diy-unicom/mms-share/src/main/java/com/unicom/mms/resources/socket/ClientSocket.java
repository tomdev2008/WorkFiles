package com.unicom.mms.resources.socket;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

import com.unicom.mms.resources.FileType;
import com.unicom.mms.resources.UrlPathConstants;

public class ClientSocket {

	   
    // 网上抄来的，将 int 转成字节  
    public static byte[] i2b(int i) {  
        return new byte[]{  
                (byte) ((i >> 24) & 0xFF),  
                (byte) ((i >> 16) & 0xFF),  
                (byte) ((i >> 8) & 0xFF),  
                (byte) (i & 0xFF)  
        };  
    }  
   
    /** 
     * 发送文件。文件大小不能大于 {@link Integer#MAX_VALUE} 
     * 
     * @param hostname 接收端主机名或 IP 地址 
     * @param port     接收端端口号 
     * @param filepath 文件路径 
     * 
     * @throws IOException 如果读取文件或发送失败 
     */  
    /**
     * 
    * 通过socket发送文件
    * @param hostname  127.0.0.1
    * @param port  7788
    * @param filepath D:\\mlh.mid
    * @param fileName accessories_10283.mid
    * @param createDir 创建子文件夹，如果为"null"则不创建。
    * @param fileType <code>FileType</code>
    * @return String url访问的地址
    * @throws IOException
    * @author zhangjh 新增日期：2013-4-24
    * @since mms-share
     */
    public String sendFile(String hostname, int port, String filepath,String fileName,String createDir,String fileType) throws IOException {  
    	if(fileName==null||fileType==null||createDir==null||filepath==null)
    		return "fileName、fileType、createDir、filepath不能为空";
        File file = new File(filepath);  
        FileInputStream is = new FileInputStream(filepath);  
   
        Socket socket = new Socket(hostname, port);  
        OutputStream os = socket.getOutputStream();  
   
        try {  
            int length = (int) file.length();  
            System.out.println("发送文件：" + file.getName() + "，长度：" + length);  
   
            // 发送文件名和文件内容  
            writeFileType(fileType,os);
            writeCreateDir(createDir,os);
            writeFileName(file,fileName, os);  
            writeFileContent(is, os, length);  
        } finally {  
            os.close();  
            is.close();  
        }  
        return urlPath(createDir,fileName,fileType);
    }  
   
    // 输出文件内容  
    private void writeFileContent(InputStream is, OutputStream os, int length) throws IOException {  
        // 输出文件长度  
        os.write(i2b(length));  
   
        // 输出文件内容  
        byte[] buffer = new byte[4096];  
        int size;  
        while ((size = is.read(buffer)) != -1) {  
            os.write(buffer, 0, size);  
        }  
    }  
   
    // 输出文件名  
    private void writeFileName(File file,String fileName, OutputStream os) throws IOException {  
        byte[] fn_bytes = file.getName().getBytes();  
        if(fileName!=null && !"".equals(fileName)){
        	fn_bytes = fileName.getBytes();  
        }
        os.write(i2b(fn_bytes.length));         // 输出文件名长度  
        os.write(fn_bytes);    // 输出文件名  
    }
    
    private void writeCreateDir(String createDir, OutputStream os) throws IOException {  
        byte[] fn_bytes = createDir.getBytes();  
        os.write(i2b(fn_bytes.length));         // 输出文件名长度  
        os.write(fn_bytes);    // 输出文件名  
    }
    
    private void writeFileType(String type, OutputStream os) throws IOException {  
        byte[] fn_bytes = type.getBytes();  
        os.write(i2b(fn_bytes.length));         // 输出文件名长度  
        os.write(fn_bytes);    // 输出文件名  
    }
    
    private String urlPath(String createDir,String fileName,String fileType){
    	StringBuilder path = new StringBuilder();
    	if(FileType.AccessoriesType.equals(fileType.trim())){
    		path.append(UrlPathConstants.AccessoriesUrlPath);
        }else if(FileType.DiymmsType.equals(fileType.trim())){
        	path.append(UrlPathConstants.DiymmsUrlPath);
        }else if(FileType.FontsType.equals(fileType.trim())){
        	path.append(UrlPathConstants.FontsUrlPath);
        }else if(FileType.MusicType.equals(fileType.trim())){
        	path.append(UrlPathConstants.MusicUrlPath);
        }else if(FileType.PhotoFrameType.equals(fileType.trim())){
        	path.append(UrlPathConstants.PhotoFrameUrlPath);
        }else if(FileType.PostMarkType.equals(fileType.trim())){
        	path.append(UrlPathConstants.PostMarkUrlPath);
        }else if(FileType.StampsType.equals(fileType.trim())){
        	path.append(UrlPathConstants.StampsUrlPath);
        }else if(FileType.TemplateCard.equals(fileType.trim())){
        	path.append(UrlPathConstants.TemplateCardPath);
        }else if(FileType.TempDataType.equals(fileType.trim())){
        	path.append(UrlPathConstants.TempDataUrlPath);
        }else if(FileType.Background.equals(fileType.trim())){
        	path.append(UrlPathConstants.BackgroundUrlPath);
        }else if(FileType.UserData.equals(fileType.trim())){
        	path.append(UrlPathConstants.UserDataUrlPath);
        }else{
        	return null;
        }
    	if(!"null".equals(createDir)){
    		path.append(createDir+"/");
    	}
    	path.append(fileName);
    	return path.toString();
    }
}
