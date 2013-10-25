package com.unicom.mms.socket;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

public class UploadClient {
	public static void main(String[] args) throws Exception
    {
		String pic = "D:\\out.jpg";
        //检验文件
        if(pic.length()==0)
        {
            System.out.println("指定一个jpg文件先！");
            return ;
        }
        File file = new File(pic);
        if(!(file.exists() && file.isFile() && file.getName().endsWith(".jpg")))
        {
            System.out.println("选择文件错误，请重新选择一个正确的文件。");
            return ;
        }
        //读取文件并写入到服务器中
        Socket s = new Socket("localhost",9006);
        FileInputStream fis = new FileInputStream(file);
        OutputStream out = s.getOutputStream();
        byte[] buf = new byte[1024];
        int len = 0;
        while((len=fis.read(buf))!=-1)
        {
            out.write(buf,0,len);
        }
        
        //通知服务器发送数据结束
        s.shutdownOutput();
        //获取服务器响应
        InputStream in = s.getInputStream();
        byte[] bufIn = new byte[1024];
        int num = in.read(bufIn);
        String str = new String(bufIn,0,num);
        System.out.println(str);
        fis.close();
        s.close();
    }
}
