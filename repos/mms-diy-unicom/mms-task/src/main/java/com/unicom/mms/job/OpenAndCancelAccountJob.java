package com.unicom.mms.job;

import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.opcanaccount.service.AccountOpenAndCancelService;

/**
 * 
* 功能描述:开销户任务
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-25
* @author chenliang 修改日期：2013-9-25
* @since mms-task
 */
@Service("openAndCancelAccountJob")
public class OpenAndCancelAccountJob {
	
	public static final Logger LOGGER = LoggerFactory.getLogger(OpenAndCancelAccountJob.class);
	
	@Autowired(required = true)
	private AccountOpenAndCancelService accountOpenAndCancelService;

	public void execute() throws JobExecutionException {
		try {
			LOGGER.info("start开销户任务");
			accountOpenAndCancelService.work();
			LOGGER.info("end开销户任务");
		} catch (Exception e) {
			LOGGER.error("OpenAndCancelAccountJob Execption :",e);
		}
	}

}
