package com.unicom.mms.base.dao;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.unicom.mms.entity.TbUsers;

/**
 *
* 功能描述:最新推荐操作类
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Repository
public class UserDAO extends HibernateCommonDAO<TbUsers>{
	
	private static Logger log = Logger.getLogger(UserDAO.class);

}
