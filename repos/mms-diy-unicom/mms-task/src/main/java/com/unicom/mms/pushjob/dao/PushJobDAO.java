package com.unicom.mms.pushjob.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.unicom.mms.base.dao.HibernateCommonDAO;
import com.unicom.mms.entity.TbPolic;
import com.unicom.mms.pushjob.model.PolicModel;

/**
 * 
* 功能描述:群发任务数据层
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-13
* @author chenliang 修改日期：2013-9-13
* @since mms-task
 */
@Repository
public class PushJobDAO extends HibernateCommonDAO<TbPolic>{

	private static final Logger LOGGER = LoggerFactory.getLogger(PushJobDAO.class);
	
	/**
	 * 
	* 方法用途和描述: 查询方法
	* @param selectSql
	* @param jobId
	* @return
	* @author chenliang 新增日期：2013-9-27
	* @since mms-task
	 */
	public List selectPushMdn(String selectSql , Object ...obj){
		Session session = this.getSession();
		SQLQuery sq = session.createSQLQuery(selectSql);
		int num = 0;
		for (int i = 0; i < obj.length; i++) {
			if(obj[i] instanceof Integer){
				sq.setInteger(num, (Integer)obj[i]);
			}else if(obj[i] instanceof String){
				sq.setString(num,""+obj[i]);
			}else if(obj[i] instanceof Long){
				sq.setLong(num,(Long)obj[i]);
			}else if(obj[i] instanceof Date){
				sq.setDate(num, (Date)obj[i]);
			}
			num++;
		}
		List lists =  sq.list();
		return lists;
	}
	
	/**
	 * 
	* 方法用途和描述: 查询任务
	* @param hql
	* @return
	* @author chenliang 新增日期：2013-9-29
	* @since mms-task
	 */
	public List selectPolic(String hql){
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		return query.list();
	}

}
