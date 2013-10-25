package com.unicom.mms.pushjob.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbSendMmsQueue;
import com.unicom.mms.entity.TbSendSmsQueue;
import com.unicom.mms.pushjob.dao.SendMmsQueueDAO;
import com.unicom.mms.pushjob.dao.SendSmsQueueDAO;

/**
 * 
* 功能描述:待发送彩信业务实体类
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-27
* @author chenliang 修改日期：2013-9-27
* @since mms-task
 */
@Service("sendMmsQueueService")
public class SendMmsQueueService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SendMmsQueueService.class);
	
	@Autowired( required = true )
	private SendMmsQueueDAO sendMmsQueueDAO;
	
	/**
	 * 
	* 方法用途和描述: 批量保存待发送短信
	* @param smsList
	* @author chenliang 新增日期：2013-9-27
	* @since mms-task
	 */
	public void saveBatchSendSms(List<TbSendMmsQueue> smsList){
		sendMmsQueueDAO.saveBatchSendSms(null, smsList);
	}
}
