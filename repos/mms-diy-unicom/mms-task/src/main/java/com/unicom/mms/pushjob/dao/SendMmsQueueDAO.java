package com.unicom.mms.pushjob.dao;

import java.util.List;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.unicom.mms.base.dao.HibernateCommonDAO;
import com.unicom.mms.entity.TbSendMmsQueue;

/**
 * 
* 功能描述:群发彩信任务数据层
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-13
* @author chenliang 修改日期：2013-9-13
* @since mms-task
 */
@Repository
public class SendMmsQueueDAO extends HibernateCommonDAO<TbSendMmsQueue>{

	private static final Logger LOGGER = LoggerFactory.getLogger(SendMmsQueueDAO.class);
	
	/**
	 * 
	* 方法用途和描述: 批量保存待发送彩信
	* @param insertSql
	* @param smsList
	* @author chenliang 新增日期：2013-9-27
	* @since mms-task
	 */
	public void saveBatchSendSms(String insertSql,List<TbSendMmsQueue> smsList){
		Session session = this.getSession();
		try {
			session.beginTransaction(); //开启事物
			for (int i = 0; i < smsList.size(); i++) {
				TbSendMmsQueue sendSms = smsList.get(i);
				session.save(sendSms);
				if( i % 500 == 0){
					session.flush();
					session.clear();
				}
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			LOGGER.error("SaveBatchSendSms Exception:",e);
		} finally{
			session.close();
			LOGGER.info("SavebatchSendSms session close.");
		}
	}
}
