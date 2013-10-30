package com.unicom.mms.mcp.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbSendMmsQueue;
import com.unicom.mms.mcp.dao.SendMmsQueueDAO;

@Service("sendMmsQueueService")
public class SendMmsQueueService {
	
	private static final Logger LOGGER = Logger.getLogger(SendMmsQueueService.class);
	
	@Autowired(required = true)
	private SendMmsQueueDAO sendMmsQueueDAO;
	
	/**
	 * 
	* 方法用途和描述: 根据字段查询对象
	* @param field
	* @param value
	* @author chenliang 新增日期：2013-10-26
	* @since mms-mcp
	 */
	public TbSendMmsQueue findByField(String field,String value){
		TbSendMmsQueue queue = sendMmsQueueDAO.findByField(field, value);
		return queue;
	}
	
	/**
	 * 
	* 方法用途和描述: 删除待发表中的数据
	* @param sendMmsQueue
	* @author chenliang 新增日期：2013-10-26
	* @since mms-mcp
	 */
	public void deleteByEntity(TbSendMmsQueue sendMmsQueue){
		sendMmsQueueDAO.delete(sendMmsQueue);
	}
}
