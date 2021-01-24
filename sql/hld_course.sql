CREATE DATABASE hld CHARACTER SET utf8 COLLATE utf8_general_ci;

USE hld

DROP TABLE IF EXISTS public.v_user;
CREATE TABLE public.v_user
(
  id          bigint PRIMARY KEY NOT NULL,
  avatar      varchar(255) DEFAULT NULL,
  account     varchar(45)        NOT NULL,
  password    varchar(64)        NOT NULL,
  name        varchar(45)  DEFAULT NULL,
  birthday    timestamp    DEFAULT NULL,
  sex         integer      DEFAULT NULL,
  email       varchar(45)  DEFAULT NULL,
  phone       varchar(13)  DEFAULT NULL,
  roleid      varchar(255) DEFAULT NULL,
  deptid      integer      DEFAULT NULL,
  status      integer      DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  version     integer      DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_user IS '用户表';
COMMENT ON COLUMN public.v_user.id IS '主键';
COMMENT ON COLUMN public.v_user.avatar IS '头像';
COMMENT ON COLUMN public.v_user.account IS '账号';
COMMENT ON COLUMN public.v_user.password IS '密码';
COMMENT ON COLUMN public.v_user.name IS '名字';
COMMENT ON COLUMN public.v_user.birthday IS '生日';
COMMENT ON COLUMN public.v_user.sex IS '性别（1：男 2：女）';
COMMENT ON COLUMN public.v_user.email IS '电子邮件';
COMMENT ON COLUMN public.v_user.phone IS '电话';
COMMENT ON COLUMN public.v_user.roleid IS '角色id';
COMMENT ON COLUMN public.v_user.deptid IS '部门id';
COMMENT ON COLUMN public.v_user.status IS '状态(1：启用  2：冻结  3：删除）';
COMMENT ON COLUMN public.v_user.create_time IS '创建时间';
COMMENT ON COLUMN public.v_user.version IS '保留字段';


DROP TABLE IF EXISTS public.v_dept;
CREATE TABLE public.v_dept
(
  id          bigint PRIMARY KEY NOT NULL,
  num         integer      DEFAULT NULL,
  pid         bigint       DEFAULT NULL,
  pids        varchar(255) DEFAULT NULL,
  psimplename  varchar(45)     NOT NULL,
  simplename  varchar(45)      NOT NULL,
  fullname    varchar(255) DEFAULT NULL,
  tips        varchar(255) DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_dept IS '部门表';
COMMENT ON COLUMN public.v_dept.id IS '主键';
COMMENT ON COLUMN public.v_dept.num IS '排序';
COMMENT ON COLUMN public.v_dept.pid IS '父部门id';
COMMENT ON COLUMN public.v_dept.pids IS '父级ids';
COMMENT ON COLUMN public.v_dept.psimplename IS '父简称';
COMMENT ON COLUMN public.v_dept.simplename IS '简称';
COMMENT ON COLUMN public.v_dept.fullname IS '全称';
COMMENT ON COLUMN public.v_dept.tips IS '提示';


DROP TABLE IF EXISTS public.v_dict;
CREATE TABLE public.v_dict
(
  id          bigint PRIMARY KEY NOT NULL,
  num         varchar(32)  DEFAULT NULL,
  syllable   varchar(255) DEFAULT NULL,
  key        varchar(255) DEFAULT NULL,
  value      varchar(255) DEFAULT NULL,
  tips        varchar(255) DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_dict IS '字典表';
COMMENT ON COLUMN public.v_dict.id IS '主键';
COMMENT ON COLUMN public.v_dict.num IS '排序';
COMMENT ON COLUMN public.v_dict.syllable IS '字段';
COMMENT ON COLUMN public.v_dict.key IS '键';
COMMENT ON COLUMN public.v_dict.value IS '值';
COMMENT ON COLUMN public.v_dict.tips IS '提示';


DROP TABLE IF EXISTS public.v_menu;
CREATE TABLE public.v_menu
(
  id          bigint PRIMARY KEY NOT NULL,
  code        varchar(255) DEFAULT NULL,
  pcode       varchar(255) DEFAULT NULL,
  pcodes      varchar(255) DEFAULT NULL,
  name        varchar(255) DEFAULT NULL,
  icon        varchar(255) DEFAULT NULL,
  url         varchar(255) DEFAULT NULL,
  num         integer      DEFAULT NULL,
  levels      integer      DEFAULT NULL,
  ismenu      integer      DEFAULT NULL,
  tips        varchar(255) DEFAULT NULL,
  status      integer      DEFAULT NULL,
  isopen      integer      DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_menu IS '菜单表';
COMMENT ON COLUMN public.v_menu.id IS '主键';
COMMENT ON COLUMN public.v_menu.code IS '菜单编号';
COMMENT ON COLUMN public.v_menu.pcode IS '菜单父编号';
COMMENT ON COLUMN public.v_menu.pcodes IS '当前菜单的所有父菜单编号';
COMMENT ON COLUMN public.v_menu.name IS '菜单名称';
COMMENT ON COLUMN public.v_menu.icon IS '菜单图标';
COMMENT ON COLUMN public.v_menu.url IS 'url地址';
COMMENT ON COLUMN public.v_menu.num IS '菜单排序号';
COMMENT ON COLUMN public.v_menu.levels IS '菜单层级';
COMMENT ON COLUMN public.v_menu.ismenu IS '是否是菜单（1：是  0：不是）';
COMMENT ON COLUMN public.v_menu.tips IS '备注';
COMMENT ON COLUMN public.v_menu.status IS '菜单状态 :  1:启用   0:不启用';
COMMENT ON COLUMN public.v_menu.isopen IS '是否打开:    1:打开   0:不打开';


DROP TABLE IF EXISTS public.v_relation;
CREATE TABLE public.v_relation
(
  id     bigint PRIMARY KEY NOT NULL,
  menuid bigint DEFAULT NULL,
  roleid bigint DEFAULT NULL
);
COMMENT ON TABLE public.v_relation IS '角色和菜单关联表';
COMMENT ON COLUMN public.v_relation.id IS '主键';
COMMENT ON COLUMN public.v_relation.menuid IS '菜单id';
COMMENT ON COLUMN public.v_relation.roleid IS '角色id';


DROP TABLE IF EXISTS public.v_role;
CREATE TABLE public.v_role
(
  id          bigint PRIMARY KEY NOT NULL,
  num         integer      DEFAULT NULL,
  name        varchar(255) DEFAULT NULL,
  rolekey     varchar(255) DEFAULT NULL,
  datascope   varchar(2)   DEFAULT NULL,
  tips        varchar(255) DEFAULT NULL,
  version     integer      DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_role IS '角色表';
COMMENT ON COLUMN public.v_role.id IS '主键';
COMMENT ON COLUMN public.v_role.num IS '顺序';
COMMENT ON COLUMN public.v_role.name IS '角色名称';
COMMENT ON COLUMN public.v_role.rolekey IS '角色权限字符串';
COMMENT ON COLUMN public.v_role.datascope IS '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限 5：仅本人数据权限）';
COMMENT ON COLUMN public.v_role.tips IS '提示';
COMMENT ON COLUMN public.v_role.version IS '保留字段(暂时没用）';


INSERT INTO public.v_user (id, avatar, account, password, name, birthday, sex, email, phone, roleid, deptid, status, create_time, version, create_by, modify_time, modify_by) VALUES (1136461373868875778, null, 'admin', '$2a$12$e.8WhFfIvbvXwCfYfywzk.XuwMta7DPL915pp4CglN5JHWSCqegDu', 'admin', null, 1, null, '15880015880', null, null, 1, '2019-06-06 10:34:41.120000', null, null, '2019-06-06 10:34:41.120000', null);
INSERT INTO public.v_user (id, avatar, account, password, name, birthday, sex, email, phone, roleid, deptid, status, create_time, version, create_by, modify_time, modify_by) VALUES (1136463724012990466, null, 'test', '$2a$12$RClfbwEnz3dhvqRHx6rb1ebi7U0HjnKPdXw7iAXGolL8.XyTx/sAC', 'test', null, 1, null, '15881588000', null, null, 1, '2019-06-06 10:44:01.450000', null, null, '2019-06-06 10:44:01.450000', null);


DROP TABLE IF EXISTS public.v_ask;
CREATE TABLE public.v_ask (
  id  bigint PRIMARY KEY NOT NULL,
  stuid bigint NOT NULL,
  teacherid bigint NOT NULL,
  titlename varchar(50) DEFAULT NULL,
  ask varchar(500) DEFAULT NULL,
  answer varchar(500) DEFAULT NULL,
  price money DEFAULT NULL,
  askaudit integer DEFAULT NULL,
  answeraudit integer DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_ask IS '答疑表';
COMMENT ON COLUMN public.v_ask.id IS '主键';
COMMENT ON COLUMN public.v_ask.stuid IS '学生id';
COMMENT ON COLUMN public.v_ask.teacherid IS '老师id';
COMMENT ON COLUMN public.v_ask.titlename IS '标题';
COMMENT ON COLUMN public.v_ask.ask IS '问题';
COMMENT ON COLUMN public.v_ask.answer IS '回答';
COMMENT ON COLUMN public.v_ask.price IS '价格';
COMMENT ON COLUMN public.v_ask.askaudit IS '问题审核（1：通过 2：未通过 3：审核中）';
COMMENT ON COLUMN public.v_ask.answeraudit IS '回答审核（1：通过 2：未通过 3：审核中）';

DROP TABLE IF EXISTS public.v_bank;
CREATE TABLE public.v_bank
(
  id  bigint PRIMARY KEY NOT NULL,
  name varchar(50) NOT NULL,
  description varchar(50) DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_bank IS '题库表';
COMMENT ON COLUMN public.v_bank.id IS '主键';
COMMENT ON COLUMN public.v_bank.name IS '名称';
COMMENT ON COLUMN public.v_bank.description IS '说明';


DROP TABLE IF EXISTS public.v_catalog;
CREATE TABLE public.v_catalog
(
  id  bigint PRIMARY KEY NOT NULL,
  courseid bigint DEFAULT NULL,
  titlename varchar(50) DEFAULT NULL,
  pid bigint DEFAULT NULL,
  num         integer      DEFAULT NULL,
  levels      integer      DEFAULT NULL,
  address varchar(225) DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_catalog IS '目录表';
COMMENT ON COLUMN public.v_catalog.id IS '主键';
COMMENT ON COLUMN public.v_catalog.courseid IS '课程id';
COMMENT ON COLUMN public.v_catalog.titlename IS '标题';
COMMENT ON COLUMN public.v_catalog.pid IS '父标题id';
COMMENT ON COLUMN public.v_catalog.num IS '菜单排序号';
COMMENT ON COLUMN public.v_catalog.levels IS '菜单层级';
COMMENT ON COLUMN public.v_catalog.address IS '视频地址';

DROP TABLE IF EXISTS public.v_classify;
CREATE TABLE public.v_classify
(
  id  bigint PRIMARY KEY NOT NULL,
  name varchar(50) NOT NULL,
  description varchar(100) DEFAULT NULL,
  pid bigint DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_classify IS '分类表';
COMMENT ON COLUMN public.v_classify.id IS '主键';
COMMENT ON COLUMN public.v_classify.name IS '类名';
COMMENT ON COLUMN public.v_classify.description IS '类名';
COMMENT ON COLUMN public.v_classify.pid IS '类名';

DROP TABLE IF EXISTS public.v_comment;
CREATE TABLE public.v_comment
(
  id  bigint PRIMARY KEY NOT NULL,
  courseid bigint DEFAULT NULL,
  stuid bigint DEFAULT NULL,
  stars integer DEFAULT NULL,
  content varchar(100) DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_comment IS '评论表';
COMMENT ON COLUMN public.v_comment.id IS '主键';
COMMENT ON COLUMN public.v_comment.courseid IS '课程id';
COMMENT ON COLUMN public.v_comment.stuid IS '用户id';
COMMENT ON COLUMN public.v_comment.stars IS '五星评价';
COMMENT ON COLUMN public.v_comment.content IS '评论';


DROP TABLE IF EXISTS public.v_connections;
CREATE TABLE public.v_connections
(
  id  bigint PRIMARY KEY NOT NULL,
  userid bigint DEFAULT NULL,
  pushid bigint DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_connections IS '人脉表';
COMMENT ON COLUMN public.v_connections.id IS '主键';
COMMENT ON COLUMN public.v_connections.userid IS '推进用户id';
COMMENT ON COLUMN public.v_connections.pushid IS '被推进用户id';


DROP TABLE IF EXISTS public.v_course;
CREATE TABLE public.v_course
(
  id  bigint PRIMARY KEY NOT NULL,
  name varchar(225) DEFAULT NULL,
  picture varchar(225) DEFAULT NULL,
  classifyid bigint DEFAULT NULL,
  teacherid bigint DEFAULT NULL,
  price numeric DEFAULT NULL,
  discount numeric DEFAULT NULL,
  discountdesc varchar(255) DEFAULT NULL,
  goal varchar(500) DEFAULT NULL,
  suit varchar(255) DEFAULT NULL,
  description varchar(1000) DEFAULT NULL,
  credit integer DEFAULT NULL,
  classhour integer DEFAULT NULL,
  shelf integer DEFAULT NULL,
  audit integer DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_course IS '课程表';
COMMENT ON COLUMN public.v_course.id IS '主键';
COMMENT ON COLUMN public.v_course.name IS '课程名称';
COMMENT ON COLUMN public.v_course.picture IS '课程图片';
COMMENT ON COLUMN public.v_course.classifyid IS '分类id';
COMMENT ON COLUMN public.v_course.teacherid IS '老师id';
COMMENT ON COLUMN public.v_course.price IS '价格';
COMMENT ON COLUMN public.v_course.discount IS '折扣';
COMMENT ON COLUMN public.v_course.discountdesc IS '折扣描述';
COMMENT ON COLUMN public.v_course.goal IS '课程目标';
COMMENT ON COLUMN public.v_course.suit IS '适用人群';
COMMENT ON COLUMN public.v_course.description IS '课程简介';
COMMENT ON COLUMN public.v_course.credit IS '学分';
COMMENT ON COLUMN public.v_course.classhour IS '课时(分钟)';
COMMENT ON COLUMN public.v_course.shelf IS '上下架（1：上架 2：下架）';
COMMENT ON COLUMN public.v_course.audit IS '审核（1：已通过 2：未通过 3：审核中）';



DROP TABLE IF EXISTS public.v_exam;
CREATE TABLE public.v_exam
(
  id  bigint PRIMARY KEY NOT NULL,
  stuid bigint DEFAULT NULL,
  paperid bigint DEFAULT NULL,
  score integer DEFAULT NULL,
  questionnum integer DEFAULT NULL,
  erroranswer varchar(100) DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_exam IS '考试表';
COMMENT ON COLUMN public.v_exam.id IS '主键';
COMMENT ON COLUMN public.v_exam.stuid IS '学生id';
COMMENT ON COLUMN public.v_exam.paperid IS '试卷id';
COMMENT ON COLUMN public.v_exam.score IS '得分';
COMMENT ON COLUMN public.v_exam.questionnum IS '试题数量';
COMMENT ON COLUMN public.v_exam.erroranswer IS '答错试题ids';


DROP TABLE IF EXISTS public.v_material;
CREATE TABLE public.v_material
(
  id  bigint PRIMARY KEY NOT NULL,
  courseid bigint DEFAULT NULL,
  name varchar(50) DEFAULT NULL,
  description varchar(100) DEFAULT NULL,
  address varchar(100) DEFAULT NULL,
  price numeric DEFAULT NULL,
  shelf integer DEFAULT NULL,
  audit integer DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_material IS '教材表';
COMMENT ON COLUMN public.v_material.id IS '主键';
COMMENT ON COLUMN public.v_material.courseid IS '课程id';
COMMENT ON COLUMN public.v_material.name IS '教材名称';
COMMENT ON COLUMN public.v_material.description IS '教材说明';
COMMENT ON COLUMN public.v_material.address IS '教程地址';
COMMENT ON COLUMN public.v_material.price IS '价格';
COMMENT ON COLUMN public.v_material.shelf IS '上下架（1：上架 2：下架）';
COMMENT ON COLUMN public.v_material.audit IS '审核（1：通过 2：未通过 3：审核中）';


DROP TABLE IF EXISTS public.v_paper;
CREATE TABLE public.v_paper
(
  id  bigint PRIMARY KEY NOT NULL,
  questionids varchar(1000) DEFAULT NULL,
  titlename varchar(50) DEFAULT NULL,
  score integer DEFAULT NULL,
  papertime integer DEFAULT NULL,
  questionnum integer DEFAULT NULL,
  description varchar(100) DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_paper IS '试卷表';
COMMENT ON COLUMN public.v_paper.id IS '主键';
COMMENT ON COLUMN public.v_paper.questionids IS '试题ids';
COMMENT ON COLUMN public.v_paper.titlename IS '试卷标题';
COMMENT ON COLUMN public.v_paper.score IS '试卷总分';
COMMENT ON COLUMN public.v_paper.papertime IS '考试时长(分钟)';
COMMENT ON COLUMN public.v_paper.questionnum IS '试题数量';
COMMENT ON COLUMN public.v_paper.description IS '试卷说明';



DROP TABLE IF EXISTS public.v_question;
CREATE TABLE public.v_question
(
  id  bigint PRIMARY KEY NOT NULL,
  bankid bigint DEFAULT NULL,
  qtype integer DEFAULT NULL,
  qlevel integer DEFAULT NULL,
  question varchar(1000) DEFAULT NULL,
  choose varchar(500) DEFAULT NULL,
  answer varchar(20) DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_question IS '试题表';
COMMENT ON COLUMN public.v_question.id IS '主键';
COMMENT ON COLUMN public.v_question.bankid IS '题库id';
COMMENT ON COLUMN public.v_question.qtype IS '题型（1：单选 2：多选）';
COMMENT ON COLUMN public.v_question.qlevel IS '难度（1：低 2：中 3：高）';
COMMENT ON COLUMN public.v_question.question IS '题目';
COMMENT ON COLUMN public.v_question.choose IS '备选答案';
COMMENT ON COLUMN public.v_question.answer IS '正确答案';


DROP TABLE IF EXISTS public.v_account;
CREATE TABLE public.v_account
(
  id  bigint PRIMARY KEY NOT NULL,
  username varchar(20) NOT NULL,
  password varchar(64) NOT NULL,
  name varchar(20) DEFAULT NULL,
  gender varchar(10) DEFAULT NULL,
  phone varchar(13) NOT NULL,
  email varchar(50) DEFAULT NULL,
  address varchar(50) DEFAULT NULL,
  icon varchar(50) DEFAULT NULL,
  birthday varchar(20) DEFAULT NULL,
  tidentity varchar(30) DEFAULT NULL,
  weixin varchar(30) DEFAULT NULL,
  credit integer DEFAULT NULL,
  gold integer DEFAULT NULL,
  duration integer DEFAULT NULL,
  position varchar(20) DEFAULT NULL,
  teachingyears integer DEFAULT NULL,
  certificate varchar(50) DEFAULT NULL,
  pictureaddress varchar(50) DEFAULT NULL,
  description varchar(500) DEFAULT NULL,
  grade integer DEFAULT NULL,
  resume varchar(50) DEFAULT NULL,
  status integer DEFAULT NULL,
  proportion numeric(2,2) DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_account IS '账户表';
COMMENT ON COLUMN public.v_account.id IS '主键';
COMMENT ON COLUMN public.v_account.name IS '姓名';
COMMENT ON COLUMN public.v_account.gender IS '性别';
COMMENT ON COLUMN public.v_account.phone IS '手机号';
COMMENT ON COLUMN public.v_account.email IS '邮箱';
COMMENT ON COLUMN public.v_account.address IS '地址';
COMMENT ON COLUMN public.v_account.icon IS '头像';
COMMENT ON COLUMN public.v_account.birthday IS '生日';
COMMENT ON COLUMN public.v_account.tidentity IS '身份证号码';
COMMENT ON COLUMN public.v_account.weixin IS '微信号码';
COMMENT ON COLUMN public.v_account.credit IS '学分';
COMMENT ON COLUMN public.v_account.gold IS '金币';
COMMENT ON COLUMN public.v_account.duration IS '学习时长';
COMMENT ON COLUMN public.v_account.position IS '职位';
COMMENT ON COLUMN public.v_account.teachingyears IS '教学年限';
COMMENT ON COLUMN public.v_account.certificate IS '教师资格证书';
COMMENT ON COLUMN public.v_account.pictureaddress IS '教师资格证书图片地址';
COMMENT ON COLUMN public.v_account.description IS '简介';
COMMENT ON COLUMN public.v_account.grade IS '评级（1：初级 2：中级 3：高级）';
COMMENT ON COLUMN public.v_account.resume IS '简历地址';
COMMENT ON COLUMN public.v_account.status IS '状态(1:正常，0:禁用)';
COMMENT ON COLUMN public.v_account.proportion IS '讲师分成比例';



DROP TABLE IF EXISTS public.v_stu_ask;
CREATE TABLE public.v_stu_ask
(
  id  bigint PRIMARY KEY NOT NULL,
  stuid bigint  DEFAULT NULL,
  stuname varchar(20) DEFAULT NULL,
  answerid bigint  DEFAULT NULL,
  teacherid bigint  DEFAULT NULL,
  titlename varchar(50) DEFAULT NULL,
  price money  DEFAULT NULL,
  validity integer  DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_stu_ask IS '学生与答疑表';
COMMENT ON COLUMN public.v_stu_ask.id IS '主键';
COMMENT ON COLUMN public.v_stu_ask.stuid IS '学生id';
COMMENT ON COLUMN public.v_stu_ask.stuname IS '学生姓名';
COMMENT ON COLUMN public.v_stu_ask.answerid IS '答疑id';
COMMENT ON COLUMN public.v_stu_ask.teacherid IS '老师id';
COMMENT ON COLUMN public.v_stu_ask.titlename IS '标题';
COMMENT ON COLUMN public.v_stu_ask.price IS '价格';
COMMENT ON COLUMN public.v_stu_ask.validity IS '有效时间';


DROP TABLE IF EXISTS public.v_user_course;
CREATE TABLE public.v_user_course
(
  id  bigint PRIMARY KEY NOT NULL,
  userid bigint DEFAULT NULL,
  username varchar(20) DEFAULT NULL,
  usertype integer DEFAULT NULL,
  courseid bigint DEFAULT NULL,
  coursename varchar(225) DEFAULT NULL,
  price numeric DEFAULT NULL,
  validity integer DEFAULT NULL,
  status integer DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_user_course IS '用户与课程表';
COMMENT ON COLUMN public.v_user_course.id IS '主键';
COMMENT ON COLUMN public.v_user_course.userid IS '用户id';
COMMENT ON COLUMN public.v_user_course.username IS '用户名字';
COMMENT ON COLUMN public.v_user_course.usertype IS '用户类型（2：学生 3：老师）';
COMMENT ON COLUMN public.v_user_course.courseid IS '课程id';
COMMENT ON COLUMN public.v_user_course.coursename IS '课程名称';
COMMENT ON COLUMN public.v_user_course.price IS '价格';
COMMENT ON COLUMN public.v_user_course.validity IS '有效时间(分钟)';
COMMENT ON COLUMN public.v_user_course.status IS '状态（0：所属 1：待支付 2：已购买）';


DROP TABLE IF EXISTS public.v_user_material;
CREATE TABLE public.v_user_material
(
  id  bigint PRIMARY KEY NOT NULL,
  userid bigint DEFAULT NULL,
  username varchar(20) DEFAULT NULL,
  usertype integer  DEFAULT NULL,
  materialid bigint DEFAULT NULL,
  materialname varchar(225) DEFAULT NULL,
  price numeric DEFAULT NULL,
  validity integer  DEFAULT NULL,
  status integer DEFAULT NULL,
  create_time timestamp    DEFAULT NULL,
  create_by   bigint       DEFAULT NULL,
  modify_time timestamp    DEFAULT NULL,
  modify_by   bigint       DEFAULT NULL
);
COMMENT ON TABLE public.v_user_material IS '用户与教材表';
COMMENT ON COLUMN public.v_user_material.id IS '主键';
COMMENT ON COLUMN public.v_user_material.userid IS '用户id';
COMMENT ON COLUMN public.v_user_material.username IS '用户名字';
COMMENT ON COLUMN public.v_user_material.usertype IS '用户类型（2：学生 3：老师）';
COMMENT ON COLUMN public.v_user_material.materialid IS '教材id';
COMMENT ON COLUMN public.v_user_material.materialname IS '教材名称';
COMMENT ON COLUMN public.v_user_material.price IS '价格';
COMMENT ON COLUMN public.v_user_material.validity IS '有效时间';
COMMENT ON COLUMN public.v_user_material.status IS '状态（0：所属 1：待支付 2：已购买）';

