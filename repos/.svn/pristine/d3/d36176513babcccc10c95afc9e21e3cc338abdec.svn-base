package com.unicom.mms.cms.dao;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.unicom.mms.cms.entity.TbRightRole;
import com.unicom.mms.cms.entity.TbRole;

/**
 * 
* 功能描述:角色数据操作类
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Repository
public class RoleDAO  extends CommonDAO<TbRole> {
	public static Logger log = Logger.getLogger(RoleDAO.class);
	
	/**
	 * 
	* 方法用途和描述:插入角色和权限关系
	* @param entity
	* @author chenliang 新增日期：2013-1-14
	* @since mms-cms-unicom
	 */
	public void insertRoleRight(TbRightRole entity){
		try {  
			getHibernateTemplate().save(entity);  
			if (log.isDebugEnabled()) {  
				log.debug("保存实体类成劄1�7," + entity.getClass().getName());  
			}  
		} catch (RuntimeException e) {  
			log.error("保存实体异常," + entity.getClass().getName(), e);  
			throw e;  
		}  
	}
	
	/**
	 * 
	* 方法用途和描述:  修改角色和权限关系
	* @param entity
	* @author chenliang 新增日期：2013-1-14
	* @since mms-cms-unicom
	 */
	public void updateRoleRight(TbRightRole entity){
		try {  
			getHibernateTemplate().saveOrUpdate(entity);  
			if (log.isDebugEnabled()) {  
				log.debug("保存实体类成劄1�7," + entity.getClass().getName());  
			}  
		} catch (RuntimeException e) {  
			log.error("保存实体异常," + entity.getClass().getName(), e);  
			throw e;  
		}  
	}

	/**
	 * 
	* 方法用途和描述: 删除角色和权限的关系
	* @param entity
	* @author chenliang 新增日期：2013-1-14
	* @since mms-cms-unicom
	 */
	public void deleteRoleRight(TbRightRole entity) {
		try {  
			getHibernateTemplate().delete(entity);  
			if (log.isDebugEnabled()) {  
				log.debug("删除实体类成劄1�7," + entity.getClass().getName());  
			}  
		} catch (RuntimeException e) {  
			log.error("删除实体异常", e);  
			throw e;  
		}  
	}	
}
