package com.unicom.mms;

import com.unicom.mms.util.PropertiesConfig;

public class InitInstance {
	private static InitInstance initInstance = null;
	
	public static InitInstance getInstance(){
		if(initInstance == null){
			initInstance = new InitInstance();
		}
		return initInstance;
	}
	
	public PropertiesConfig mm7;
	public PropertiesConfig test;
	
	private InitInstance(){
		mm7 = new PropertiesConfig("/mm7.properties");
		test = new PropertiesConfig("/test.properties");
	}
}
