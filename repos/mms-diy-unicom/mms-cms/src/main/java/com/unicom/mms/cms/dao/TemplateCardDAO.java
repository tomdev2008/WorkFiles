package com.unicom.mms.cms.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.unicom.mms.entity.TbTemplateCard;

/**
 *
* 功能描述:最新推荐操作类
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Repository
public class TemplateCardDAO extends CommonDAO<TbTemplateCard>{
	
	private static Logger log = Logger.getLogger(TemplateCardDAO.class);

	/**
	 * 
	 * 执行sql
	 * @author chenliang 新增日期：2012-12-13
	 * @param criteria 带查询条件的DetachedCriteria
	 * @param sql  执行的   
	 * @return
	 */
	public List findListAll(String hql,Object ...objects){
		Session  sessionUse = this.getSession();
		SQLQuery sq=sessionUse.createSQLQuery(hql);
		int j=0;
		for (int i = 0; i < objects.length; i++) {
			log.debug("objects["+i+"]"+objects[i]);
			if(null!=objects[i] && !"".equals(objects[i])){
				sq.setParameter(j, objects[i]);
				j++;
			}
		}
		List lista = sq.list();
		return lista;
	}
}
