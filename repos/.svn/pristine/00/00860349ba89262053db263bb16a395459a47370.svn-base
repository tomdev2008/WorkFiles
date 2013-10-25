package com.unicom.mms.pushjob.multhread;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.unicom.mms.pushjob.model.JobSendRecsModel;
import com.unicom.mms.pushjob.model.SendQueueModel;
import com.unicom.mms.pushjob.model.ShareThreadModel;

/**
 * 
* 功能描述:群发短信线程
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-12
* @author chenliang 修改日期：2013-9-12
* @since mms-task
 */
public class PushSendThread extends Thread {

	private static final Logger LOGGER = LoggerFactory.getLogger(PushSendThread.class);
	
	private ShareThreadModel shareModel;
	private int iThreadDealCount = 0;//记录本线程发送个数
	private String threadName = ""; //线程名字
	
	public PushSendThread(String threadName,ShareThreadModel shareThreadModel) {
		LOGGER.info("创建发送短信线程....");
		this.threadName = threadName;
		this.shareModel = shareThreadModel;
	}
	
	
	/**
	 * 
	* 方法用途和描述: 发送短信
	* @author chenliang 新增日期：2013-9-16
	* @since mms-task
	 */
	public void batchSendSms(){
		int iRow = 50;
		StringBuffer sendMdn = null;
		try {
			while (iRow>0) {
				if(shareModel.readQueue.size()<=0){
					break;
				}
				int index = shareModel.sendC.incrementAndGet();
				SendQueueModel sendQueueModel = shareModel.readQueue.take();
				if(sendQueueModel == shareModel.exitRead){
					shareModel.readQueue.put(shareModel.exitRead);
					shareModel.iBatch--;
					break;
				}
				if(iRow==50){
					sendMdn = new StringBuffer();
					sendMdn.append(sendQueueModel.getSendMdn());
				}else{
					sendMdn.append(","+sendQueueModel.getSendMdn());
				}
				iRow--;
				iThreadDealCount++;
				LOGGER.debug(threadName+"批=========\t" + index + ":" + sendQueueModel.toString() );
			}
			if( null != sendMdn ){
				sendSMS(sendMdn.toString());
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 调用发送短信的方法
	* @author chenliang 新增日期：2013-9-18
	* @since mms-task
	 */
	private void sendSMS(String sendMdns){
		try {
			if( null != sendMdns ){
				String mdns[] = sendMdns.split(",");
				for (int i = 0; i < mdns.length; i++) {
					//调用接口发送短信
					
					//添加到保存发送结果阻塞队列
					JobSendRecsModel sendQueueModel = new JobSendRecsModel();
					sendQueueModel.setbSuccess(1);
					sendQueueModel.setCreateTime(new Date());
					sendQueueModel.setPushMdn(mdns[i]);
					sendQueueModel.setSendTime(new Date());
					shareModel.saveResultQueue.put(sendQueueModel);
				};
			}
		} catch (InterruptedException e) {
			LOGGER.info("sendSMSException-",e);
		}
	}
	
	@Override
	public void run() {
		try {
			batchSendSms();
		} catch (Exception e) {
			LOGGER.error("runPushSendThreadException",e);
		}
	}
}
