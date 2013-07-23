/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2013/7/23 14:32:14                           */
/*==============================================================*/


drop table if exists tb_checking_in;

drop table if exists tb_checking_instance;

drop table if exists tb_depart;

drop table if exists tb_deptOrgen;

drop table if exists tb_employee;

drop table if exists tb_employee_contracts;

drop table if exists tb_orgen;

drop table if exists tb_permanent_assets;

drop table if exists tb_post;

/*==============================================================*/
/* Table: tb_checking_in                                        */
/*==============================================================*/
create table tb_checking_in
(
   id                   varchar(50) not null comment '考勤主键id',
   emp_id               varchar(50) comment '主键id',
   stauts               varchar(50) comment '状态',
   reason               varchar(100) comment '原因',
   time                 date comment '时间',
   primary key (id)
);

/*==============================================================*/
/* Table: tb_checking_instance                                  */
/*==============================================================*/
create table tb_checking_instance
(
   emp_id               varchar(50) comment '主键id',
   instance_id          bigint,
   emp_name             varchar(100) comment '员工姓名',
   orgen_name           varchar(100),
   emp_due              int,
   emp_actual           int,
   neglect_work         int,
   emp_late             int,
   leave_early          int,
   overtime             int,
   emp_leave            int,
   emp_away             int,
   weekend_overtime     int,
   happenday            date
);

/*==============================================================*/
/* Table: tb_depart                                             */
/*==============================================================*/
create table tb_depart
(
   perm_name            varchar(100) comment '员工姓名',
   id                   varchar(50) not null comment '部门主键id',
   duty                 varchar(100) comment '职责',
   parent_depart        varchar(50) comment '父级部门',
   primary key (id)
);

alter table tb_depart comment '部门表';

/*==============================================================*/
/* Table: tb_deptOrgen                                          */
/*==============================================================*/
create table tb_deptOrgen
(
   orgen_id             varchar(50) not null comment '主键id',
   dept_id              varchar(50) not null comment '主键',
   primary key (orgen_id, dept_id)
);

/*==============================================================*/
/* Table: tb_employee                                           */
/*==============================================================*/
create table tb_employee
(
   id                   varchar(50) not null comment '员工主键id',
   orgen_id             varchar(50) comment '机构主键id',
   post_id              varchar(50) comment '岗位主键id',
   identity_card        varchar(18) comment '身份证',
   birthday             date comment '出生年月',
   address              varchar(100) comment '家庭地址',
   orgen_phone          varchar(50) comment '联系电话',
   native_place         varchar(10) comment '籍贯',
   domicile_place       varchar(50) comment '户口所在地',
   graduation_date      date comment '毕业时间',
   graduate_school      varchar(50) comment '毕业学校',
   major                varchar(20) comment '专业',
   education_background varchar(20) comment '学历',
   marry                varchar(20) comment '婚否',
   nation               varchar(20) comment '名族',
   sex                  char(2) comment '性别',
   politics_status      varchar(20) comment '政治面貌',
   dates_employed       date comment '入职时间',
   working_time         date comment '司龄',
   E_mail               varchar(50) comment '邮箱',
   immediate_family     varchar(50) comment '直系亲属',
   status               char(2) comment '状态',
   opening_bank         varchar(50) comment '银行卡开户行',
   card_no              numeric(20,0) comment '银行卡号',
   household_properties char(2) comment '户口性质',
   job_title            varchar(20) comment '职称',
   title_level          varchar(20) comment '职称级别',
   change_jobs          varchar(20) comment '岗位变动',
   social_security_time date comment '社保保险缴费起始月',
   job_no               varchar(20) comment '工号',
   emp_name             varchar(50),
   primary key (id)
);

/*==============================================================*/
/* Table: tb_employee_contracts                                 */
/*==============================================================*/
create table tb_employee_contracts
(
   id                   varchar(50) not null comment '员工合同主键ID',
   emp_id               varchar(50) comment '员工id',
   contract_effective_date date comment '合同生效日期',
   contract_end_date    date comment '合同终止日期',
   contract_date        date comment '合同签订日期',
   status               char(2) comment '状态',
   primary key (id)
);

/*==============================================================*/
/* Table: tb_orgen                                              */
/*==============================================================*/
create table tb_orgen
(
   id                   varchar(50) not null comment '机构主键id',
   perm_name            varchar(100) comment '员工姓名',
   orgen_phone          varchar(50) comment '联系电话',
   place                varchar(100) comment '地址',
   type                 smallint comment '类型',
   create_time          date comment '成立时间',
   parent_orgen         int comment '上级机构',
   number               varchar(100) comment '资产编号',
   tell_phone           varchar(50) comment '手机号码',
   business_license_no  varchar(100) comment '税务登记证',
   bank_name            varchar(100) comment '开户行名称',
   tax_registration_certificate varchar(100) comment '营业执照',
   primary key (id)
);

alter table tb_orgen comment '机构表';

/*==============================================================*/
/* Table: tb_permanent_assets                                   */
/*==============================================================*/
create table tb_permanent_assets
(
   id                   varchar(50) not null comment '固定资产主键id',
   emp_id               varchar(50) comment '员工id',
   number               varchar(100) comment '资产编号',
   perm_name            varchar(100) comment '员工姓名',
   acc_type             smallint comment '资产类型',
   state                smallint comment '状态
            1：使用中
            2：损坏
            3：库存',
   buy_time             date comment '购入时间',
   price                double comment '资产价值',
   remark               varchar(100) comment '备注',
   primary key (id)
);

alter table tb_permanent_assets comment '固定资产';

/*==============================================================*/
/* Table: tb_post                                               */
/*==============================================================*/
create table tb_post
(
   id                   varchar(50) not null comment '岗位id',
   dept_id              varchar(50) comment '部门id',
   post_name            varchar(20) comment '岗位名称',
   post_duty            varchar(50) comment '岗位职责',
   primary key (id)
);

alter table tb_checking_in add constraint FK_Relationship_7 foreign key (emp_id)
      references tb_employee (id) on delete restrict on update restrict;

alter table tb_checking_instance add constraint FK_Relationship_12 foreign key (emp_id)
      references tb_employee (id) on delete restrict on update restrict;

alter table tb_deptOrgen add constraint FK_Relationship_10 foreign key (dept_id)
      references tb_depart (id) on delete restrict on update restrict;

alter table tb_deptOrgen add constraint FK_Relationship_9 foreign key (orgen_id)
      references tb_orgen (id) on delete restrict on update restrict;

alter table tb_employee add constraint FK_Relationship_6 foreign key (post_id)
      references tb_post (id) on delete restrict on update restrict;

alter table tb_employee add constraint FK_Relationship_8 foreign key (orgen_id)
      references tb_orgen (id) on delete restrict on update restrict;

alter table tb_employee_contracts add constraint FK_Relationship_4 foreign key (emp_id)
      references tb_employee (id) on delete restrict on update restrict;

alter table tb_permanent_assets add constraint FK_Relationship_11 foreign key (emp_id)
      references tb_employee (id) on delete restrict on update restrict;

alter table tb_post add constraint FK_Relationship_5 foreign key (dept_id)
      references tb_depart (id) on delete restrict on update restrict;

