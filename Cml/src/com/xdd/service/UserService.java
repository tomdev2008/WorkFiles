package com.xdd.service;

import java.util.List;

import com.xdd.po.User;

public interface UserService {
        public List<User> queryUserList();
        public User queryUserByCondition(String condition);
}

