package com.unicom.mms.demo.concurrent;

import org.apache.log4j.Logger;

import com.unicom.mms.demo.model.ReadModel;
import com.unicom.mms.demo.model.ShareThreadModel;


public class ReadThread extends Thread{
	private ShareThreadModel shareData ;
	protected static Logger log = Logger.getLogger(ReadThread.class);
	
	public void setShareData(ShareThreadModel shareData) {
		this.shareData = shareData;
	}

	public ReadThread(ShareThreadModel shareData){
		log.info("创建读线程");
		this.shareData = shareData;
	}

	/**
	 * 
	 * 读取数据
	 * 
	 * @author zhangjh 新增日期：2013-5-30
	 * @since task
	 */
	private void read(){
		try{
			for(int i=0;i<10;i++){
				ReadModel m = new ReadModel();
				m.setId(i);
				m.setMdn("1560000001"+i);
				shareData.queue.put(m);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@Override
	public void run() {
		try {
			read();
			log.info("ShortQueue->写入结束锁,销毁读线程");
			shareData.queue.put(shareData.exitQueue);
			log.info("--------------------------Read End----------------------------");
		} catch (Exception e) {
			log.error("读线程异常", e);
		} 
	}
}
