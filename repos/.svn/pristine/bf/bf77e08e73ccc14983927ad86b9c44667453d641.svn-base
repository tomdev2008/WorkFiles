package com.unicom.mms.job;

import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.pushjob.service.PushJobService;

/**
 * 
* 功能描述:推送短信任务
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-12
* @author chenliang 修改日期：2013-9-12
* @since mms-task
 */
@Service("pushJob")
public class PushJob {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PushJob.class);
	
	@Autowired(required = true)
	private PushJobService pushJobService;

	public void execute() throws JobExecutionException {
		try {
			LOGGER.info("Start PushJob!");
			pushJobService.work();
			LOGGER.info("End PushJob!");			
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}


}
