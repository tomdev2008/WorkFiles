package com.unicom.mms.cms.dao;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;
import com.unicom.mms.entity.TbUsers;

/**
 *
* 功能描述:登陆用户dao
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Repository
public class UsersDAO extends CommonDAO<TbUsers>{
	
	private static Logger log = Logger.getLogger(UsersDAO.class);

}
