package com.etrack.concurrent;

import java.util.Date;

import org.apache.log4j.Logger;

import com.etrack.base.DateUtil;
import com.etrack.base.UuidGenerate;
import com.etrack.concurrent.model.ShareThreadModel;
import com.etrack.constants.OrderStatus;
import com.etrack.mybatis.model.Channel;
import com.etrack.mybatis.model.OrderTracking;
import com.etrack.mybatis.model.Orders;
import com.kuaidi.KOrderDetails;
import com.kuaidi.KOrderInfo;

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
			int status_trans=1;
			int status_error=2;
			int status_finished=3;
			int index = shareModel.sc.incrementAndGet();
			Orders entity = (Orders) shareModel.queue.take();
			if (entity == shareModel.exitQueue) {
				isEnd = true;
			}else{
				// 请求查询快递方法
				Channel channel = shareModel.channelService.getById(entity.getChannelId());
				if(channel==null){
					log.error("Error *******************************Channel is null");
					return isEnd;
				}
				KOrderInfo info =com.kuaidi.Query.get(channel.getCom(), entity.getOrderNumber());
				if(info!=null){
					log.info("search:"+info.toString());
					if(OrderStatus.s_success.equals(info.getStatus())){
						if(OrderStatus.checked.equals(info.getIscheck())){
							entity.setStatus(status_finished);
						}else{
							entity.setStatus(status_trans);
						}
						if(info.getData()!=null ){
							shareModel.orderTrackingService.deleteByOrderID(entity.getId());
							for(KOrderDetails details:info.getData()){
								OrderTracking rs = new OrderTracking();
								rs.setId(UuidGenerate.uuid());
								rs.setOrderId(entity.getId());
								rs.setInformation(details.getContext());
								if(details.getTime()!=null){
									Date d =null;
									try{
										d = DateUtil.StringToDate(details.getTime(), "yyyy-MM-dd HH:mm:ss");
									}catch(Exception e){
										d = DateUtil.StringToDate(details.getTime(), "yyyy-MM-dd HH:mm");
									}
									rs.setTime(d);
								}
								if(details.getFtime()!=null){
									Date d = null;
									try{
										d = DateUtil.StringToDate(details.getFtime(), "yyyy-MM-dd HH:mm:ss");
									}catch(Exception e){
										d = DateUtil.StringToDate(details.getFtime(), "yyyy-MM-dd HH:mm");
									}
									rs.setFtime(d);
								}
								shareModel.result.put(rs);
							}
						}
					}else if(OrderStatus.s_noorder.equals(info.getStatus())){
						entity.setStatus(status_error);
					}else{
						entity.setStatus(status_error);
					}
					shareModel.ordersService.update(entity);
					
					
				}
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
