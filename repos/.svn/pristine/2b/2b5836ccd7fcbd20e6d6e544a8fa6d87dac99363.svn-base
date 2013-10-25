package com.unicom.mms.demo.concurrent;

import com.unicom.mms.demo.model.SaveModel;
import com.unicom.mms.demo.model.ShareThreadModel;


public class SaveThread implements Runnable{
	private ShareThreadModel shareModel ;
	
	public SaveThread(ShareThreadModel shareModel){
		this.shareModel = shareModel;
	}
	@Override
	public void run() {
			while(true){
				try {
					int index = shareModel.wc.incrementAndGet();
					SaveModel result = (SaveModel)shareModel.result.take();
					if (result == shareModel.exitSave) {
						System.out.println("--------------------------Save End----------------------------");
						break;
					}
					System.out.println(index+":"+result.toString());
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
	}

}
