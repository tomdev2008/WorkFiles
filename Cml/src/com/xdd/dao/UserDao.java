package com.xdd.dao;
import java.util.List;
import com.xdd.po.User;


public interface UserDao {
	//返回用户实体集合
	public List<User> queryUserList();
	//根据条件返回用户实体
	public User queryUserByCondition(String condition);
}
