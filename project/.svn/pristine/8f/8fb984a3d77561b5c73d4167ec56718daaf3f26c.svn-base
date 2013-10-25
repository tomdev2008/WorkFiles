package com.etrack.concurrent;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.etrack.concurrent.model.ShareThreadModel;
import com.etrack.mybatis.model.Orders;

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
			List<Integer> values = new ArrayList<Integer>();
			values.add(1);
			values.add(2);
			List<Orders> list = shareData.ordersService.queryByStatus(values);
			shareData.iTotalCount = list.size();
			for(Orders o : list){
				shareData.queue.put(o);
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
