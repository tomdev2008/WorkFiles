package com.unicom.mms.base.threads;

import com.unicom.mms.base.ftp.FtpSyncFiles;

public class StartUpThread extends Thread{
	
	@Override
	public void run() {
		FtpSyncFiles ftpSyncFiles =  FtpSyncFiles.getInstance();
		ftpSyncFiles.syncSystemData();
		ftpSyncFiles.syncUserData();
	}
}
