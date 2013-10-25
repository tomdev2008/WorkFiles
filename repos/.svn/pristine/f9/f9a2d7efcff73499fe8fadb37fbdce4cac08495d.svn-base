package com.unicom.mms.service.impl;


import java.sql.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.dao.CommonDAO;
import com.unicom.mms.dao.TemplateCardDAO;
import com.unicom.mms.dao.UserDAO;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.entity.TbUsers;
import com.unicom.mms.service.ITemplateCardService;
import com.unicom.mms.service.IUserService;
import com.unicom.mms.util.PageInfo;

/**
 * 
* 功能描述:模板明信片
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Service("userService")
public class UserService extends CommonService<TbUsers> implements IUserService {
	public static Logger log = Logger.getLogger(UserService.class);

	@Autowired(required = true)
	private UserDAO userDAO;
	
	@Override
	public CommonDAO<TbUsers> getBindDao() {
		return userDAO;
	}

	/**
	 * 
	 * 根据用户号码查询用户，若不存在则创建新用户
	 * 
	 * @return
	 * @author lizl 新增日期：2013-7-12
	 * @since mms-mobile
	 */
	@Override
	public TbUsers queryUserByNumber(String phoneNum) {
		TbUsers users = this.findByField("mdn",phoneNum);
		if (null == users) {
			return null;
		} else {
			users = new TbUsers();
			users.setMdn(phoneNum);
			users.setStatus(1);
			users.setPwd("");
			users.setRegisterTime(new java.util.Date());
			users.setUnregisterTime(null);
			userDAO.save(users);
		}
		return users;
	}
}
