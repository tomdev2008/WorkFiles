package com.unicom.mms.demo.concurrent;

import org.apache.log4j.Logger;

import com.unicom.mms.demo.model.ReadModel;
import com.unicom.mms.demo.model.SaveModel;
import com.unicom.mms.demo.model.ShareThreadModel;


public class SendThread implements Runnable{
	protected static Logger log = Logger.getLogger(SendThread.class);
	private ReadThread readThread ;
	private String threadName = "";
	private ShareThreadModel shareModel ;
	
	public void setShortData(ShareThreadModel shareModel,ReadThread readThread ) {
		this.shareModel = shareModel;
		this.readThread = readThread;
	}
	
	public SendThread(String threadName,ShareThreadModel shareModel,ReadThread readThread ) {
		this.threadName = threadName;
		this.shareModel = shareModel;
		this.readThread = readThread;
		log.info("ShortQueue->创建发送线程:"+threadName);
	}
	
	private boolean send(){
		boolean isEnd = false;
		try{
			int index = shareModel.sc.incrementAndGet();
			ReadModel entity = (ReadModel) shareModel.queue.take();
			if (entity == shareModel.exitQueue) {
				isEnd = true;
				
			}else{
				System.out.println(index+":"+entity.toString());
				SaveModel rs = new SaveModel();
				rs.setId(index);
				rs.setOrderNo("rs"+index);
				shareModel.result.put(rs);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isEnd;
	}
	@Override
	public void run() {
		while (true) {
			try {
				if(send()) {
					shareModel.queue.put(shareModel.exitQueue);
					shareModel.iThread--;
					if (shareModel.iThread == 0) {
						shareModel.result.put(shareModel.exitSave);
						shareModel.runFlag = false;
					}
					System.out.println("--------------------------Send End----------------------------剩下："+shareModel.iThread+"个线程");
					break;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}
