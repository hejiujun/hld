package com.hld.web.domain;

import com.hld.web.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Dept extends BaseEntity {
    private Long id;
    private Integer num;
    private Long pid;
    private String pids;
    private String psimpleName;
    private String simpleName;
    private String fullName;
    private String tips;
}
