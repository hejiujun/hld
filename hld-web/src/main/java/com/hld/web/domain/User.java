package com.hld.web.domain;


import com.hld.web.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;



@Data
@NoArgsConstructor
@AllArgsConstructor
public class User extends BaseEntity {

    private Long id;

    private String avatar;
    
    private String account;
    
    private String password;
    
    private String name;
    
    private Date birthday;
    
    private String gender;
    
    private String email;
    
    private String phone;
    
    private Long roleId;
    
    private Long deptId;
    
    private String status;
    
    private String version;

    public User(String account, String password, String name, String phone) {
        this.account = account;
        this.password = password;
        this.name = name;
        this.phone = phone;
    }
}
