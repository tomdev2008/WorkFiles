package com.unicom.mms.FileTrasmission;

public class TestSocket {
	//程序入口  
    public static void main(String[] args) throws Exception {  
        int port = 7788;  
        new Server(port, "D://home//").start();  
        new Client().sendFile("127.0.0.1", port, "D:\\192.168.1.11\\home\\kxcomm\\mms\\systemData\\Music\\mlh.mid","音效");  
    }  
}
