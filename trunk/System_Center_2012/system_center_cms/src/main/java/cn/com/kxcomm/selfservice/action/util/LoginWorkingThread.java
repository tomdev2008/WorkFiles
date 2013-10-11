package cn.com.kxcomm.selfservice.action.util;

public class LoginWorkingThread extends Thread{
	@Override
	public void run() {
		InitDatabase aa = InitDatabase.getSingleInstance();
		
		try {
			aa.writeData();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
