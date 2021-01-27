package com.hld.web.domain;

import com.hld.web.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Role extends BaseEntity {
    private Long id;
    private Integer num;
    private String name;
    private String roleKey;
    private String dataScope;
    private String tips;
    private Integer version;
}
