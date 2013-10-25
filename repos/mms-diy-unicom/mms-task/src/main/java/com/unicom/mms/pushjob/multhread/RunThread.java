package com.unicom.mms.pushjob.multhread;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.unicom.mms.pushjob.model.PolicModel;
import com.unicom.mms.pushjob.model.ShareThreadModel;
import com.unicom.mms.pushjob.service.PushJobService;

/**
 * 
* 功能描述:多线程启动入口
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-16
* @author chenliang 修改日期：2013-9-16
* @since mms-task
 */
public class RunThread {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(RunThread.class);
	
	private static RunThread runThread = null;
	
	@Autowired(required = true)
	public PushJobService pushJobService;
	
	public static synchronized RunThread getInstance(){
		if(null == runThread){
			runThread = new RunThread();
		}
		return runThread;
	}
	
	/**
	 * 
	* 方法用途和描述: 启动多线程
	* @author chenliang 新增日期：2013-9-16
	* @since mms-task
	 */
	public void run(PolicModel policModel){
		if(null != policModel){
			ShareThreadModel shareModel = new ShareThreadModel();
			//开始启动时间
			shareModel.startThread = System.currentTimeMillis();
			//待发短信总数
//			shareModel.iTotalCount = pushJobService.selectPushMdnCount(policModel.getId());
			//判断改任务是否之前发送过，如果发送过则接着继续发送
			LOGGER.info("shortMessage-->jobId:"+policModel.getId()+",本次推送："+shareModel.iTotalCount+"条短信");
			if(shareModel.iTotalCount>0){
				shareModel.setJobId(policModel.getId());
				PushReadThread readThread = new PushReadThread(shareModel);
				shareModel.mainExec.submit(readThread); //启动读线程
				PushSaveThread saveThread = new PushSaveThread(shareModel);
				shareModel.mainExec.submit(saveThread); //启动写线程
				String threadName = policModel.getPolicName()+"-"+policModel.getId()+"-SendThread";
				shareModel.iBatch = shareModel.maxmumPoolSize - 2;
				for (int i = 0; i < shareModel.iBatch; i++) {
					PushSendThread sendThread = new PushSendThread(threadName+"-"+i,shareModel);
					shareModel.mainExec.submit(sendThread); //启动多个发送线程
				}
			}
			shareModel.mainExec.shutdown();
		}
	}

}
