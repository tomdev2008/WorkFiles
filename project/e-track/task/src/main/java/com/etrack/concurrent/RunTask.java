package com.etrack.concurrent;

import com.etrack.concurrent.model.ShareThreadModel;


public class RunTask 
{
	public static  void start(){
    	ShareThreadModel shortData = new ShareThreadModel();
		shortData.startTime = System.currentTimeMillis();
		shortData.iTotalCount = 10;
    	ReadThread read = new ReadThread(shortData);
		shortData.exec.submit(read);
		SaveThread save = new SaveThread(shortData);
		shortData.exec.submit(save);
		String theardName = "SendTheard";
		shortData.iThread=shortData.maximumPoolSize-2;
		for (int index = 0; index < shortData.iThread; index++) {
			SendThread send = new SendThread(theardName+index,shortData,read);
			shortData.exec.submit(send);
		}
		shortData.exec.shutdown();
		System.out.println("--------------------------Start End----------------------------");
	}
    public static void main( String[] args ){
    	RunTask.start();
    }
}
