package com.xdd.web;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.xdd.po.User;
import com.xdd.service.UserService;

public class ListUser extends ActionSupport{
	private static final long serialVersionUID = -1527350509975525382L;
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private List<User> list;
	
	public List<User> getList() {
		return list;
	}
	public String queryUser() throws Exception{
    	list = userService.queryUserList();
    	ServletActionContext.getContext().getSession().put("userList", list);
    	return SUCCESS;
    }
}

