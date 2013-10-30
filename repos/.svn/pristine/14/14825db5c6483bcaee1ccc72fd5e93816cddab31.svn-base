package com.unicom.mms.mcp.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbSendSmsQueue;
import com.unicom.mms.entity.TbSendedSmsRecs;
import com.unicom.mms.mcp.dao.SendSmsRecsDAO;
import com.unicom.mms.mcp.dao.SendSmsQueueDAO;


@Service("sendSmsQueueService")
public class SendSmsQueueService {
	
	private static final Logger LOGGER = Logger.getLogger(SendSmsQueueService.class);
	
	@Autowired(required = true)
	private SendSmsQueueDAO sendSmsQueueDAO;
	
	/**
	 * 
	* 方法用途和描述: 根据消息id查询短信
	* @return
	* @author chenliang 新增日期：2013-10-25
	* @since mms-mcp
	 */
	public TbSendSmsQueue findByMsgSn(String msgSn) throws Exception{
		try {
			TbSendSmsQueue sendsmsQueue = sendSmsQueueDAO.findByField("msgSn", msgSn);
			return sendsmsQueue;
		} catch (Exception e) {
			LOGGER.error("FindByMsgSn Exception.",e);
			throw e;
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 删除待发送表数据
	* @param sendSmsQueueEntity
	* @author chenliang 新增日期：2013-10-25
	* @since mms-mcp
	 */
	public void deleteById(TbSendSmsQueue sendSmsQueueEntity){
		try {
			sendSmsQueueDAO.delete(sendSmsQueueEntity);
		} catch (Exception e) {
			LOGGER.error("DeleteById Exception.",e);
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 保存
	* @param smsQueue
	* @author chenliang 新增日期：2013-10-28
	* @since mms-mcp
	 */
	public void save(TbSendSmsQueue smsQueue){
		try {
			sendSmsQueueDAO.save(smsQueue);
		} catch (Exception e) {
			LOGGER.error("Save SendSmsQueue Exception.",e);
		}
	}
}
