package com.unicom.mms.demo.concurrent;

import com.unicom.mms.demo.model.ShareThreadModel;




/**
 * Hello world!
 *
 */
public class RunTask 
{
    public static void main( String[] args )
    {
    	ShareThreadModel shortData = new ShareThreadModel();
		shortData.startTime = System.currentTimeMillis();
		shortData.iTotalCount = 10;
        System.out.println( "Hello World!" );
    	ReadThread read = new ReadThread(shortData);
		shortData.exec.submit(read);
		SaveThread save = new SaveThread(shortData);
		shortData.exec.submit(save);
		String theardName = "SendTheard";
		shortData.iBatch=shortData.maximumPoolSize-2;
		for (int index = 0; index < shortData.iBatch; index++) {
			shortData.iThread++;
			SendThread send = new SendThread(theardName+index,shortData,read);
			shortData.exec.submit(send);
		}
		shortData.exec.shutdown();
		System.out.println("--------------------------Start End----------------------------");
    }
}
