package com.unicom.mms.opcanaccount.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.unicom.mms.base.dao.HibernateCommonDAO;
import com.unicom.mms.opcanaccount.model.TSendedList;

@Repository
public class AccountOpenAndCancelDAO extends HibernateCommonDAO {

	private static final Logger LOGGER = LoggerFactory.getLogger(AccountOpenAndCancelDAO.class);
	
	/**
	 * 
	 * 方法用途和描述: 查询待发送列表
	 * @author chenliang 新增日期：2013-9-25
	 * @param sql 
	 * @since mms-task
	 */
	public List selectSendList(String sql){
		Session session = this.getSession();
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		List list = sqlQuery.list();
		return list;
	}

	/**
	 * 
	* 方法用途和描述: 删除待发送表记录
	* @param deleteSql
	* @author chenliang 新增日期：2013-9-26
	* @since mms-task
	 */
	public void deleteTsendList(String deleteSql,Object ...objects) {
		Session session = this.getSession();
		SQLQuery sqlQuery = session.createSQLQuery(deleteSql);
		for (int i = 0; i < objects.length; i++) {
			if(objects[i] instanceof Integer){
				sqlQuery.setInteger(0, (Integer)objects[i]);
			}
		}
		int result= sqlQuery.executeUpdate();
	}

	/**
	 * 
	* 方法用途和描述: 批量保存已发送表记录
	* @param sendList
	* @author chenliang 新增日期：2013-9-26
	* @since mms-task
	 */
	public void saveBatch(final String insertSql,final List<TSendedList> sendedList) {
		
		getHibernateTemplate().execute(new HibernateCallback() {

			Connection conn = null;
			PreparedStatement pre = null;
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				try {
					conn = session.connection();
					pre = conn.prepareStatement(insertSql);
					for (int i = 0; i < sendedList.size(); i++) {
						TSendedList tsendedList = sendedList.get(i);
						pre.setString(1, tsendedList.getMsgSn());
						pre.setInt(2, tsendedList.getUserId());
						pre.setString(3, tsendedList.getSsn());
						pre.setInt(4, tsendedList.getMsgSendtype());
						pre.setDate(5, tsendedList.getSendTime());
						pre.setInt(6, tsendedList.getMsgStatus());
						pre.setString(7, tsendedList.getMsgBody());
						pre.setString(8, tsendedList.getReceiveMobile());
						pre.setDate(9, tsendedList.getCreateTime());
						pre.setDate(10, tsendedList.getDealTime());
						pre.setInt(11, tsendedList.getIsDel());
						pre.setInt(12, tsendedList.getBillFlag());
						pre.setInt(13, tsendedList.getSendLevel());
						pre.setInt(14, tsendedList.getSendTimestamp());
						pre.setInt(15, tsendedList.getUusdCommandStatus());
						pre.addBatch();
						if(i%100==0){
							pre.executeBatch();
						}
					}
					if(sendedList.size()%100!=0){
						pre.executeBatch();
					}
				} catch (Exception e) {
					LOGGER.error("SaveBatch Execption:",e);
				} finally{
					if(pre!=null){
						pre.close();
					}
					if(conn!=null){
						conn.close();
					}
					if(session!=null){
						session.close();
					}
				}
				return null;
			}
		});
	}
}
