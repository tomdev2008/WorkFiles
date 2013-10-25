package com.unicom.mms.complexSocket;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

import com.unicom.mms.objectSocket.Customer;

public class ClientComplexSocket {
	public static class ClientThread extends Thread {
		Socket socket = null;
		ObjectInputStream objInput = null;

		public ClientThread(Socket socket) {
			this.socket = socket;
		}

		@Override
		public void run() {
			try {
				objInput = new ObjectInputStream(socket.getInputStream());
				String rs = (String) objInput.readObject();
				System.out.println("结果:"+rs);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					objInput.close();
					socket.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public static void main(String[] args) {
		Socket socket = null;
		ObjectOutputStream objOut = null;
		 FileInputStream fis = null;
		try {
			Customer c = new Customer();
			c.setName("zxf_noimp");
			c.setAge(24);
			//文件
			String pic = "D:\\out.jpg";
			File file = new File(pic);
			c.setPhoto(file);
			 if(!(file.exists() && file.isFile() ))
		        {
		            System.out.println("选择文件错误，请重新选择一个正确的文件。");
		            return ;
		        }
			
			
			// 向目标机器发出socket请求
			socket = new Socket("127.0.0.1", 11111);
			// 序列化对象
			objOut = new ObjectOutputStream(socket.getOutputStream());
			objOut.writeObject(c);


		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(fis!=null)
					fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		new ClientThread(socket).start();
	}
}
