package com.unicom.mms.resources;

import com.unicom.mms.resources.socket.ClientSocket;

public class TestClientSocket {
	public static void main(String[] args) throws Exception {  
   	 int port = 8088;  
   	String hostname ="211.91.224.230";
   	String filepath = "D:\\images\\new-images\\";
   	String createDir = "null";
   	
   	String path = new ClientSocket().sendFile(hostname, port, filepath+"邮戳\\01.PNG","PostMark_"+System.currentTimeMillis()+".png",createDir,FileType.PostMarkType);  
   	 System.out.println("path:"+path);
   
	}
}
