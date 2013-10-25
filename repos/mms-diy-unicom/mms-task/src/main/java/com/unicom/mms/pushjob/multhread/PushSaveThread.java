package com.unicom.mms.pushjob.multhread;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.pushjob.model.JobSendRecsModel;
import com.unicom.mms.pushjob.model.ShareThreadModel;
import com.unicom.mms.pushjob.service.PushJobService;

/**
 * 
* 功能描述: 保存群发结果的线程
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-12
* @author chenliang 修改日期：2013-9-12
* @since mms-task
 */
public class PushSaveThread extends Thread {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PushSaveThread.class);
	
	private ShareThreadModel shareModel;
	
	@Autowired(required = true)
	private PushJobService pushJobService;
	
	public PushSaveThread(ShareThreadModel shareThreadModel) {
		LOGGER.info("创建保存结果线程....");
		this.shareModel = shareThreadModel;
	}
	
	public void saveResult(){
		try {
			JobSendRecsModel sendRecsModel = shareModel.saveResultQueue.take();
//			pushJobService.saveSendRecs(sendRecsModel);
		} catch (InterruptedException e) {
			LOGGER.info("saveSendRecsExcption-",e);
		}
	}

	@Override
	public void run() {
		try {
			saveResult();
		} catch (Exception e) {
			LOGGER.info("runPushSaveThreadException-",e);
		}
	}
}
