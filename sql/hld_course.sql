create
database /*!32312 IF NOT EXISTS */ hld /*!40100 character set utf8 collate utf8_general_ci*/;

use
hld

drop table if exists v_user;
create table v_user
(
    id          bigint(20) not null auto_increment comment '主键',
    avatar      varchar(100) default null comment '头像',
    account     varchar(45) not null comment '账号',
    password    varchar(64) not null comment '密码',
    salt        varchar(10) not null comment '盐值',
    name        varchar(45)  default null comment '名字',
    birthday    datetime     default null comment '生日',
    gender      char(1)      default null comment '性别（1：男 2：女）',
    email       varchar(45)  default null comment '电子邮件',
    phone       varchar(13)  default null comment '电话',
    dept_id     bigint(20) default null comment '部门id',
    status      char(1)      default null comment '状态(1：启用  2：冻结  3：删除）',
    version     varchar(10)  default null comment '保留字段',
    create_time datetime     default null comment '创建时间',
    create_by   bigint(20) default null comment '创建人',
    update_time datetime     default null comment '更新时间',
    update_by   bigint(20) default null comment '更新时间',
    remark      varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '用户表';

/*INSERT INTO v_user (id, avatar, account, password, name, birthday, sex, email, phone, roleid, deptid, status,
                    create_time, version, create_by, update_time, update_by)
VALUES (1136461373868875778, null, 'admin', '$2a$12$e.8WhFfIvbvXwCfYfywzk.XuwMta7DPL915pp4CglN5JHWSCqegDu', 'admin',
        null, 1, null, '15880015880', null, null, 1, '2019-06-06 10:34:41.120000', null, null,
        '2019-06-06 10:34:41.120000', null);
INSERT INTO v_user (id, avatar, account, password, name, birthday, sex, email, phone, roleid, deptid, status,
                    create_time, version, create_by, update_time, update_by)
VALUES (1136463724012990466, null, 'test', '$2a$12$RClfbwEnz3dhvqRHx6rb1ebi7U0HjnKPdXw7iAXGolL8.XyTx/sAC', 'test', null,
        1, null, '15881588000', null, null, 1, '2019-06-06 10:44:01.450000', null, null, '2019-06-06 10:44:01.450000',
        null);*/


drop table if exists v_dept;
create table v_dept
(
    id           bigint(20) not null auto_increment comment '主键',
    num          int          default null comment '排序',
    pid          bigint       default null comment '父部门id',
    pids         varchar(255) default null comment '父级ids',
    psimple_name varchar(45) not null comment '父简称',
    simple_name  varchar(45) not null comment '简称',
    full_name    varchar(255) default null comment '全称',
    tips         varchar(255) default null comment '提示',
    create_time  datetime     default null comment '创建时间',
    create_by    bigint(20) default null comment '创建人',
    update_time  datetime     default null comment '更新时间',
    update_by    bigint(20) default null comment '更新时间',
    remark       varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '部门表';


drop table if exists v_dict;
create table v_dict
(
    id          bigint(20) not null auto_increment comment '主键',
    num         varchar(32)  default null comment '排序',
    syllable    varchar(255) default null comment '字段',
    key         varchar(255) default null comment '键',
    value       varchar(255) default null comment '值',
    tips        varchar(255) default null comment '提示',
    create_time datetime     default null comment '创建时间',
    create_by   bigint(20) default null comment '创建人',
    update_time datetime     default null comment '更新时间',
    update_by   bigint(20) default null comment '更新时间',
    remark      varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '字典表';


drop table if exists v_menu;
create table v_menu
(
    id          bigint(20) not null auto_increment comment '主键',
    code        varchar(255) default null comment '菜单编号',
    pcode       varchar(255) default null comment '菜单父编号',
    pcodes      varchar(255) default null comment '当前菜单的所有父菜单编号',
    name        varchar(255) default null comment '菜单名称',
    icon        varchar(255) default null comment '菜单图标',
    url         varchar(255) default null comment 'url地址',
    num         int          default null comment '菜单排序号',
    levels      int          default null comment '菜单层级',
    is_menu     char(1)      default null comment '是否是菜单（1：是  0：不是）',
    tips        varchar(255) default null comment '提示',
    status      char(1)      default null comment '菜单状态 :  1:启用   0:不启用',
    is_open     char(1)      default null comment '是否打开:    1:打开   0:不打开',
    create_time datetime     default null comment '创建时间',
    create_by   bigint(20) default null comment '创建人',
    update_time datetime     default null comment '更新时间',
    update_by   bigint(20) default null comment '更新时间',
    remark      varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '菜单表';


drop table if exists v_menu_role;
create table v_menu_role
(
    menu_id bigint(20) default null comment '菜单id',
    role_id bigint(20) default null comment '角色id',
    primary key (menu_id, role_id)
) engine=innodb auto_increment=1 comment = '角色和菜单关联表';



drop table if exists v_role;
create table v_role
(
    id          bigint(20) not null auto_increment comment '主键',
    num         int          default null comment '顺序',
    name        varchar(255) default null comment '角色名称',
    role_key    varchar(255) default null comment '角色权限字符串',
    data_scope  varchar(2)   default null comment '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限 5：仅本人数据权限）',
    tips        varchar(255) default null comment '提示',
    version     int          default null comment '保留字段(暂时没用）',
    create_time datetime     default null comment '创建时间',
    create_by   bigint(20) default null comment '创建人',
    update_time datetime     default null comment '更新时间',
    update_by   bigint(20) default null comment '更新时间',
    remark      varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '角色表';

drop table if exists v_user_role;
create table v_user_role
(
    user_id bigint(20) not null comment '用户ID',
    role_id bigint(20) not null comment '角色ID',
    primary key (user_id, role_id)
) engine=innodb comment = '用户和角色关联表';

drop table if exists v_bank;
create table v_bank
(
    id          bigint(20) not null auto_increment comment '主键',
    name        varchar(50) not null comment '名称',
    description varchar(50)  default null comment '说明',
    create_time datetime     default null comment '创建时间',
    create_by   bigint(20) default null comment '创建人',
    update_time datetime     default null comment '更新时间',
    update_by   bigint(20) default null comment '更新时间',
    remark      varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '题库表';


drop table if exists v_catalog;
create table v_catalog
(
    id            bigint(20) not null auto_increment comment '主键',
    course_id     bigint(20) default null comment '课程id',
    title_name    varchar(50)  default null comment '标题',
    pid           bigint(20) default null comment '父标题id',
    num           int          default null comment '菜单排序号',
    levels        int          default null comment '菜单层级',
    video_address varchar(225) default null comment '视频地址',
    create_time   datetime     default null comment '创建时间',
    create_by     bigint(20) default null comment '创建人',
    update_time   datetime     default null comment '更新时间',
    update_by     bigint(20) default null comment '更新时间',
    remark        varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '目录表';


drop table if exists v_classify;
create table v_classify
(
    id          bigint(20) not null auto_increment comment '主键',
    name        varchar(50) not null comment '类名',
    description varchar(100) default null comment '类名描述',
    pid         bigint(20) default null comment '父类名',
    create_time datetime     default null comment '创建时间',
    create_by   bigint(20) default null comment '创建人',
    update_time datetime     default null comment '更新时间',
    update_by   bigint(20) default null comment '更新时间',
    remark      varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '分类表';


drop table if exists v_forum;
create table v_forum
(
    id          bigint(20) not null auto_increment comment '主键',
    course_id   bigint(20) default null comment '课程id',
    stu_id      bigint(20) default null comment '用户id',
    stars       int          default null comment '五星评价',
    content     varchar(100) default null comment '评论内容',
    create_time datetime     default null comment '创建时间',
    create_by   bigint(20) default null comment '创建人',
    update_time datetime     default null comment '更新时间',
    update_by   bigint(20) default null comment '更新时间',
    remark      varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '评论表';


drop table if exists v_relationship;
create table v_relationship
(
    id          bigint(20) not null auto_increment comment '主键',
    user_id     bigint(20) default null comment '推进用户id',
    push_id     bigint(20) default null comment '被推进用户id',
    create_time datetime     default null comment '创建时间',
    create_by   bigint(20) default null comment '创建人',
    update_time datetime     default null comment '更新时间',
    update_by   bigint(20) default null comment '更新时间',
    remark      varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '人脉表';



drop table if exists v_exam;
create table v_exam
(
    id           bigint(20) not null auto_increment comment '主键',
    stu_id       bigint(20) default null comment '学生id',
    paper_id     bigint(20) default null comment '试卷id',
    score        int          default null comment '得分',
    question_num int          default null comment '试题数量',
    error_answer varchar(100) default null comment '答错试题ids',
    create_time  datetime     default null comment '创建时间',
    create_by    bigint(20) default null comment '创建人',
    update_time  datetime     default null comment '更新时间',
    update_by    bigint(20) default null comment '更新时间',
    remark       varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '考试表';



drop table if exists v_paper;
create table v_paper
(
    id           bigint(20) not null auto_increment comment '主键',
    question_ids varchar(1000) default null comment '试题ids',
    title_name   varchar(50)   default null comment '试卷标题',
    score        int           default null comment '试卷总分',
    paper_time   int           default null comment '考试时长(分钟)',
    question_num int           default null comment '试题数量',
    description  varchar(100)  default null comment '试卷说明',
    create_time  datetime      default null comment '创建时间',
    create_by    bigint(20) default null comment '创建人',
    update_time  datetime      default null comment '更新时间',
    update_by    bigint(20) default null comment '更新时间',
    remark       varchar(500)  default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '试卷表';


drop table if exists v_question;
create table v_question
(
    id          bigint(20) not null auto_increment comment '主键',
    bank_id     bigint        default null comment '题库id',
    qtype       char(1)       default null comment '题型（1：单选 2：多选）',
    qlevel      int           default null comment '难度（1：低 2：中 3：高）',
    question    varchar(1000) default null comment '题目',
    choose      varchar(500)  default null comment '备选答案',
    answer      varchar(20)   default null comment '正确答案',
    create_time datetime      default null comment '创建时间',
    create_by   bigint(20) default null comment '创建人',
    update_time datetime      default null comment '更新时间',
    update_by   bigint(20) default null comment '更新时间',
    remark      varchar(500)  default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '试题表';


drop table if exists v_custom;
create table v_custom
(
    id              bigint(20) not null auto_increment comment '主键',
    username        varchar(20) not null comment '账号',
    password        varchar(64) not null comment '密码',
    name            varchar(20)   default null comment '姓名',
    gender          varchar(10)   default null comment '性别',
    phone           varchar(13) not null comment '手机号',
    email           varchar(50)   default null comment '邮箱',
    address         varchar(50)   default null comment '地址',
    icon            varchar(50)   default null comment '头像',
    birthday        varchar(20)   default null comment '生日',
    cert            varchar(30)   default null comment '身份证号码',
    weixin          varchar(30)   default null comment '微信号码',
    credit          int           default null comment '学分',
    gold            int           default null comment '金币',
    vip_grade       char(1)       default null comment '会员等级(1:月 2:年 3:超级)',
    duration        bigint(20) default null comment '学习时长(秒)',
    position        varchar(20)   default null comment '职位',
    teaching_years  int           default null comment '教学年限',
    certificate     varchar(50)   default null comment '教师资格证书',
    picture_address varchar(50)   default null comment '教师资格证书图片地址',
    description     varchar(500)  default null comment '简介',
    grade           char(1)       default null comment '评级（1：初级 2：中级 3：高级）',
    resume          varchar(50)   default null comment '简历地址',
    status          char(1)       default null comment '状态(1:正常，0:禁用)',
    proportion      numeric(2, 2) default null comment '讲师分成比例',
    create_time     datetime      default null comment '创建时间',
    create_by       bigint(20) default null comment '创建人',
    update_time     datetime      default null comment '更新时间',
    update_by       bigint(20) default null comment '更新时间',
    remark          varchar(500)  default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '客户表';

drop table if exists v_ask;
create table v_ask
(
    id           bigint(20) not null auto_increment comment '主键',
    stu_id       bigint(20) not null comment '学生id',
    teacher_id   bigint(20) not null comment '老师id',
    title_name   varchar(50)  default null comment '标题',
    ask          varchar(500) default null comment '问题',
    answer       varchar(500) default null comment '回答',
    price        money        default null comment '价格',
    ask_audit    char(1)      default null comment '问题审核（1：通过 2：未通过 3：审核中）',
    answer_audit char(1)      default null comment '回答审核（1：通过 2：未通过 3：审核中）',
    create_time  datetime     default null comment '创建时间',
    create_by    bigint(20) default null comment '创建人',
    update_time  datetime     default null comment '更新时间',
    update_by    bigint(20) default null comment '更新时间',
    remark       varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '答疑表';

drop table if exists v_stu_ask;
create table v_stu_ask
(
    id            bigint(20) not null auto_increment comment '主键',
    stu_id        bigint(20) default null comment '学生id',
    stu_name      varchar(20)  default null comment '学生姓名',
    answer_id     bigint(20) default null comment '答疑id',
    teacher_id    bigint(20) default null comment '老师id',
    title_name    varchar(50)  default null comment '标题',
    price         money        default null comment '价格',
    status        char(1)      DEFAULT NULL comment '状态（1：待支付 2：已购买）',
    validity_time int          default null comment '有效时间(天)',
    create_time   datetime     default null comment '创建时间',
    create_by     bigint(20) default null comment '创建人',
    update_time   datetime     default null comment '更新时间',
    update_by     bigint(20) default null comment '更新时间',
    remark        varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '学生与答疑表';

drop table if exists v_course;
create table v_course
(
    id            bigint(20) not null auto_increment comment '主键',
    name          varchar(225)  default null comment '课程名称',
    picture       varchar(225)  default null comment '课程图片',
    classify_id   bigint(20) default null comment '分类id',
    teacher_id    bigint(20) default null comment '老师id',
    price         numeric       default null comment '价格',
    discount      numeric       default null comment '折扣',
    discount_desc varchar(255)  default null comment '折扣描述',
    goal          varchar(500)  default null comment '课程目标',
    suit          varchar(255)  default null comment '适用人群',
    description   varchar(1000) default null comment '课程简介',
    credit        double        default null comment '学分',
    class_hour    bigint(20) default null comment '课时(秒)',
    shelf         char(1)       default null comment '上下架（1：上架 2：下架）',
    audit         char(1)       default null comment '审核（1：已通过 2：未通过 3：审核中）',
    create_time   datetime      default null comment '创建时间',
    create_by     bigint(20) default null comment '创建人',
    update_time   datetime      default null comment '更新时间',
    update_by     bigint(20) default null comment '更新时间',
    remark        varchar(500)  default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '课程表';



drop table if exists v_stu_course;
create table v_stu_course
(
    id            bigint(20) not null auto_increment comment '主键',
    stu_id        bigint(20) default null comment '学生id',
    name          varchar(20)  default null comment '姓名',
    course_id     bigint(20) default null comment '课程id',
    course_name   varchar(225) default null comment '课程名称',
    price         numeric      default null comment '价格',
    validity_time int          default null comment '有效时间(天)',
    status        char(1)      default null comment '状态（1：待支付 2：已购买）',
    create_time   datetime     default null comment '创建时间',
    create_by     bigint(20) default null comment '创建人',
    update_time   datetime     default null comment '更新时间',
    update_by     bigint(20) default null comment '更新时间',
    remark        varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '学生与课程表';


drop table if exists v_material;
create table v_material
(
    id          bigint(20) not null auto_increment comment '主键',
    course_id   bigint(20) default null comment '课程id',
    name        varchar(50)  default null comment '教材名称',
    description varchar(100) default null comment '教材说明',
    address     varchar(100) default null comment '教程地址',
    price       numeric      default null comment '价格',
    shelf       char(1)      default null comment '上下架（1：上架 2：下架）',
    audit       char(1)      default null comment '审核（1：通过 2：未通过 3：审核中）',
    create_time datetime     default null comment '创建时间',
    create_by   bigint(20) default null comment '创建人',
    update_time datetime     default null comment '更新时间',
    update_by   bigint(20) default null comment '更新时间',
    remark      varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '教材表';

drop table if exists v_stu_material;
create table v_stu_material
(
    id            bigint(20) not null auto_increment comment '主键',
    stu_id        bigint(20) default null comment '学生id',
    name          varchar(20)  default null comment '姓名',
    material_id   bigint       default null comment '教材id',
    material_name varchar(225) default null comment '教材名称',
    price         numeric      default null comment '价格',
    validity_time int          default null comment '有效时间(天)',
    status        char(1)      default null comment '状态（1：待支付 2：已购买）',
    create_time   datetime     default null comment '创建时间',
    create_by     bigint(20) default null comment '创建人',
    update_time   datetime     default null comment '更新时间',
    update_by     bigint(20) default null comment '更新时间',
    remark        varchar(500) default null comment '备注',
    primary key (id)
) engine=innodb auto_increment=1 comment = '学生与教材表';
