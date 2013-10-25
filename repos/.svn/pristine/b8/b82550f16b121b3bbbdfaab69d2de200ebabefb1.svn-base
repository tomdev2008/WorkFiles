package com.unicom.mms.socket;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class UploadSocket implements Runnable{
	private Socket s;
	UploadSocket(Socket s)
    {
        this.s = s;
    }
	public static void main(String[] args)throws Exception
    {
        ServerSocket ss = new ServerSocket(9006);
        //开启线程并发访问
        while(true)
        {
            Socket s = ss.accept();
            String ip = s.getInetAddress().getHostAddress();
            System.out.println(ip+"....connected");
            new Thread(new UploadSocket(s)).start();
        }
    }

	@Override
	public void run() {
		int count = 1;
		String ip = s.getInetAddress().getHostAddress();
		try{
			 //获取客户端数据
            InputStream in = s.getInputStream();
            //指定文件存放路径将读取到客户提交的数据写入文件中
            File dir = new File("c:\\pic");
            File file = new File(dir,ip+"("+count+").jpg");
            while(file.exists())
                file = new File(dir,ip+"("+(count++)+").jpg");
            FileOutputStream fos = new FileOutputStream(file);
            byte[] buf = new byte[1024];
            int len = 0;
            while((len=in.read(buf))!=-1)
            {
                fos.write(buf,0,len);
            }
            //返回上传状态给客户端
            OutputStream out = s.getOutputStream();
            out.write("上传文件成功".getBytes());
            fos.close();
            s.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
