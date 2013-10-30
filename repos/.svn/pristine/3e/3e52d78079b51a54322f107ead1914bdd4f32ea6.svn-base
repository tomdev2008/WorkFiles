package com.unicom.mms.pushjob.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TSignOrder;
import com.unicom.mms.pushjob.dao.UserDAO;

/**
 * 
* 功能描述:客户业务类
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Service("userService")
public class UserServiceImpl {
	public static Logger log = Logger.getLogger(UserServiceImpl.class);
	
	@Autowired(required = true)
	public UserDAO userDAO;

	public TSignOrder findProductByMdn(String mdn) {
		String hql = "select s from TbUsers u,TSignOrder s where u.id = s.userId and u.mdn = ?";
		List list = userDAO.findProductByMdn(hql, mdn);
		if(null!=list && list.size()>0){
			TSignOrder signOrder = (TSignOrder) list.get(0);
			return signOrder;
		}
		return new TSignOrder();
	}
	
}
