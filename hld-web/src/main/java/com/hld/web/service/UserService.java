package com.hld.web.service;

import com.hld.web.domain.User;

public interface UserService {
   User selectUserByAccount(String userName);
}
