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
    private static final long serialVersionUID = 1L;
    
    private String avatar;
    
    private String account;
    
    private String password;
    
    private String name;
    
    private Date birthday;
    
    private Integer sex;
    
    private String email;
    
    private String phone;
    
    private String roleid;
    
    private Long deptid;
    
    private Integer status;
    
    private Integer version;

    public User(String account, String password, String name, String phone) {
        this.account = account;
        this.password = password;
        this.name = name;
        this.phone = phone;
    }
}
