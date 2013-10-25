package com.etrack.concurrent;

import com.etrack.concurrent.model.ShareThreadModel;
import com.etrack.mybatis.model.OrderTracking;

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
					OrderTracking result = (OrderTracking)shareModel.result.take();
					if (result == shareModel.exitSave) {
						System.out.println("--------------------------Save End----------------------------");
						break;
					}
					//TODO 保存
					shareModel.orderTrackingService.save(result);
					System.out.println(index+":"+result.toString());
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
	}

}
