package com.hld.web.service.impl;

import com.hld.web.domain.User;
import com.hld.web.mapper.UserMapper;
import com.hld.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User selectUserByAccount(String userName) {
        return userMapper.selectUserByAccount(userName);
    }
}
