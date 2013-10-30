package com.unicom.mms.pushjob.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.unicom.mms.base.dao.HibernateCommonDAO;
import com.unicom.mms.entity.TbUsers;

/**
 *
* 功能描述:用户数据操作类
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Repository
public class UserDAO extends HibernateCommonDAO<TbUsers>{
	
	private static Logger log = Logger.getLogger(UserDAO.class);

	/**
	 * 
	* 方法用途和描述: 根据用户号码查询用户的产品代码
	* @param hql
	* @param objects
	* @return
	* @author chenliang 新增日期：2013-10-26
	* @since mms-web
	 */
	public List findProductByMdn(String hql,Object ...objects){
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		int j = 0;
		for (int i = 0; i < objects.length; i++) {
			if(null!=objects[i] && !"".equals(objects[i])){
				query.setString(0, ""+objects[j]);
				j++;
			}
		}
		List list =  query.list();
		return list;
	}
	
}
