package com.xdd.service.impl;

import java.util.List;

import com.xdd.dao.UserDao;
import com.xdd.po.User;
import com.xdd.service.UserService;

public class UserServiceImpl implements UserService{
	
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public List<User> queryUserList() {
		return userDao.queryUserList();
	}
	public User queryUserByCondition(String condition){
		return userDao.queryUserByCondition(condition);
	}
}

