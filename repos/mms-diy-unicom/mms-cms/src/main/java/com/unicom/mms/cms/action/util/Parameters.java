package com.unicom.mms.cms.action.util;

public class Parameters {
	
	public  String templateCard_uploadUrl = "";  //模板excel地址
	
	
	private static Parameters instance = null;
	private Parameters(){
		
	}
	public static Parameters getInstance(){
		if(instance == null)
			instance = new Parameters();
		return instance;
	}
}
