package com.unicom.mms.complexSocket;

import java.io.File;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;

import org.apache.commons.io.FileUtils;

import com.unicom.mms.objectSocket.Customer;

public class ServerComplexSocket {

	public static void main(String[] args) {
		ServerSocket serverSocket = null;
		try {
			serverSocket = new ServerSocket(11111);
			System.out.println("Server服务已启动。。。。");
			while (true) {
				Socket socket = serverSocket.accept();
				new ServerThread(socket).start();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static class ServerThread extends Thread {

		Socket socket = null;
		public ServerThread(Socket socket) {
			this.socket = socket;
		}

		@Override
		public void run() {
			try {
				System.out.println(socket.getInputStream().getClass().getName());
				ObjectInputStream objInput = new ObjectInputStream(
						socket.getInputStream());
				Customer c = (Customer) objInput.readObject();
				System.out.println(c.toString());
				File accpet = c.getPhoto();
				System.out.println(accpet.getName());
				String fileName = System.currentTimeMillis()+"_"+accpet.getName();
				File file = new File("D:\\home\\",fileName);
				if(!file.exists()){
					FileUtils.copyFile(accpet,file);
				}
				ObjectOutputStream objOut = new ObjectOutputStream(
						socket.getOutputStream());
				String rs = "success";
				objOut.writeObject(rs);
				objOut.close();
				objInput.close();
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}


}
