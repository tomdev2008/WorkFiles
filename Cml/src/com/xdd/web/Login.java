package com.xdd.web;

import com.opensymphony.xwork2.ActionSupport;
import com.xdd.po.User;
import com.xdd.service.UserService;

public class Login extends ActionSupport{
     private String name;
     private User user;
     private UserService userService;
     private String msg;

	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	private String password;
    public String execute() throws Exception{
        user  = userService.queryUserByCondition(name);
        System.out.println("name="+name+"password="+password);
    	if(user!=null&&!"".equals(user)){
    		if(name.equals(user.getName())&&password.equals(user.getPassWord())){
    			msg="您好,"+name+"!";
    		}else{
    			msg="用户名或者密码不正确";
    		}
    	}else{
    		 msg="用户名不能为空";
    	}
    	return SUCCESS;
    }

	public User getUser() {
		return user;
	}
}
