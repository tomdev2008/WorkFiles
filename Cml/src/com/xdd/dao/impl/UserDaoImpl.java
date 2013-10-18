package com.xdd.dao.impl;
import java.util.List;
import com.xdd.dao.UserDao;
import com.xdd.po.User;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;


public class UserDaoImpl extends SqlMapClientDaoSupport implements UserDao {
	@SuppressWarnings("unchecked")
	public List<User> queryUserList(){
		System.out.println("22222222222222222222");
		List<User> list = getSqlMapClientTemplate().queryForList("User.getUserList");
		return list;
	}
	
	public User queryUserByCondition(String condition){
		return (User)getSqlMapClientTemplate().queryForObject("User.queryUserByName",condition);
	}

}
