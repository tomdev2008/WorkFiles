
--2010.8.26保存年度考核月度平均分，部门考核分数等信息。
create table ASS_YEAR_GRADE_SCORE
(
  ID              VARCHAR2(32) not null,
  ASSESSMENT_ID   VARCHAR2(32),
  MODIFY_ID       VARCHAR2(32),
  CREATE_DATE     DATE,
  MODIFY_DATE     DATE,
  AVG_MONTH_SCORE NUMBER(10,2),
  ORG_SCORE       NUMBER(10,2),
  YEAR_SCORE      NUMBER(10,2),
  MONTH_SCALE     NUMBER,
  ORG_SCALE       NUMBER,
  YEAR_SCALE      NUMBER,
  FLG_DELETED     INTEGER,
  PRIORITY        INTEGER
);
comment on column ASS_YEAR_GRADE_SCORE.AVG_MONTH_SCORE
  is '月度考核平均分';
comment on column ASS_YEAR_GRADE_SCORE.ORG_SCORE
  is '部门成绩';
comment on column ASS_YEAR_GRADE_SCORE.YEAR_SCORE
  is '年度考核行为成绩';
comment on column ASS_YEAR_GRADE_SCORE.MONTH_SCALE
  is '月度成绩权重';
comment on column ASS_YEAR_GRADE_SCORE.ORG_SCALE
  is '部门成绩权重';
comment on column ASS_YEAR_GRADE_SCORE.YEAR_SCALE
  is '年度行为成绩权重';
comment on column ASS_YEAR_GRADE_SCORE.FLG_DELETED
  is '删除标志';
comment on column ASS_YEAR_GRADE_SCORE.PRIORITY
  is '排序';
alter table ASS_YEAR_GRADE_SCORE
  add constraint PK_ASS_YEAR_GRADE_SCORE primary key (ID)
  using index;

--2010.8.23 将config.xml中任务配置做到数据库中
alter table FLW_MONITOR add FLG_DELETED INTEGER DEFAULT 0;
alter table FLW_MONITOR add name varchar2(200);
update flw_monitor fm set fm.name=(select f.flow_name||'[监控]' from flw_flow f where fm.flow_id=f.id);
-- Create table SYS_TASK_JOBS_ARCHIVE
create table SYS_TASK_JOBS_ARCHIVE
(
  ID          VARCHAR2(32) not null,
  AGENT_ID    VARCHAR2(32),
  AGENT_NAME  VARCHAR2(500),
  START_TIME  DATE,
  END_TIME    DATE,
  CREATE_DATE DATE,
  SPEND_TIME  INTEGER,
  STATUS      INTEGER,
  LOG         VARCHAR2(2000),
  TASK_TYPE   INTEGER,
  ARCHIVE_TIME DATE
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_TASK_JOBS_ARCHIVE
  add constraint PK_SYS_TASK_JOBS_ARCHIVE_ID primary key (ID);
-- Create/Recreate indexes 
create index IDX_SYS_T_JOBS_A_TYPE_TIME on SYS_TASK_JOBS_ARCHIVE (TASK_TYPE, STATUS, CREATE_DATE);
-- Create table SYS_TASK_JOBS
create table SYS_TASK_JOBS
(
  ID          VARCHAR2(32) not null,
  AGENT_ID    VARCHAR2(32),
  AGENT_NAME  VARCHAR2(500),
  START_TIME  DATE,
  END_TIME    DATE,
  CREATE_DATE DATE,
  SPEND_TIME  INTEGER,
  STATUS      INTEGER,
  LOG         VARCHAR2(2000),
  TASK_TYPE   INTEGER
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_TASK_JOBS
  add constraint PK_SYS_TASK_JOBS_ID primary key (ID);
-- Create/Recreate indexes 
create index IDX_SYS_T_JOBS_TYPE_TIME on SYS_TASK_JOBS (TASK_TYPE, STATUS, CREATE_DATE);
--Create table SYS_TASKS
create table SYS_TASKS
(
  ID         VARCHAR2(32) not null,
  type		 INTEGER,
  NAME       VARCHAR2(200),
  DESCRIBE   VARCHAR2(500),
  JOB_CLASS  VARCHAR2(200),
  JOB_METHOD VARCHAR2(200),
  JOB_TYPE   INTEGER,
  START_TIME INTEGER,
  END_TIME   INTEGER,
  SERVICE_TIME  DATE,
  INTERVAL   INTEGER,
  PARALLEL   INTEGER,
  ISABLE     INTEGER
);
-- Add comments to the columns 
comment on column SYS_TASKS.ID
  is '主键ID';
comment on column SYS_TASKS.NAME
  is '任务名称';
comment on column SYS_TASKS.DESCRIBE
  is '任务详细描述';
comment on column SYS_TASKS.JOB_CLASS
  is '任务执行类';
comment on column SYS_TASKS.JOB_METHOD
  is '任务执行方法';
comment on column SYS_TASKS.JOB_TYPE
  is '任务执行方式1时间段内执行,0连续执行';
comment on column SYS_TASKS.START_TIME
  is '任务执行时间段始';
comment on column SYS_TASKS.END_TIME
  is '任务执行时间段尾';
comment on column SYS_TASKS.INTERVAL
  is '任务执行时间间隔';
comment on column SYS_TASKS.PARALLEL
  is '任务并发数';
comment on column SYS_TASKS.ISABLE
  is '任务是否可用';
comment on column SYS_TASKS.SERVICE_TIME
  is '服务器最后更新时间';
comment on column SYS_TASKS.TYPE
  is '标识';
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_TASKS
  add constraint PK_SYS_TASKS_ID primary key (ID);
  -- init data
insert into sys_tasks values(
'11111111111111111111111',1,'流程自动发起任务','在流程定义中配置流程批次发起时间后由系统自动发起此批次',
'com.shengdai.kpi.flow.schedule.vo.JobFlow','',1,0,86400000,sysdate,30000,1,1
);
--2010.8.23 流程自动发起
drop table JOB_FLOW;
create table JOB_FLOW
(
  ID              VARCHAR2(32) not null,
  JOB_NAME        VARCHAR2(600),
  CREATE_TIME     DATE,
  FLOW_START_TIME DATE,
  BATCH_DATE      INTEGER,
  MONITOR_ID      VARCHAR2(32),
  FLG_HANDLER     INTEGER,
  REMARK          VARCHAR2(2000)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table JOB_FLOW
  add constraint PK_JOB_FLOW primary key (ID);
create index IDX_JOB_FLOW on JOB_FLOW (FLOW_START_TIME);

--2010.8.18新建抽象处理人集合－部门其他员工(除被考核对象)
merge into comm_handler_rule a
using (select count(*) co
         from comm_handler_rule t
        where t.rule_class =
              'com.shengdai.kpi.ass.handler.RuleForOrgUserExceptSelf') b
ON (b.co > 1)
when  not matched then
  insert 
  values
    (13,
     '部门其他员工(除被考核对象)',
     null,
     '*',
     'com.shengdai.kpi.ass.handler.RuleForOrgUserExceptSelf',
     1);
--2010.8.11更新一下资源菜单的ID,便于统一化管理
update sys_resource sr set sr.id='OR1000000001' where id='root';
update sys_resource sr set sr.parent_id='OR1000000001' where parent_id='root';
--2010.8.10 指标添加是否固化字段
alter table ASS_INDICATOR add flg_fixed integer default 0;
alter table TEMPLATE_INDICATOR add flg_fixed integer default 0;
update template_indicator ti set ti.flg_fixed=1 where ti.ref_resource_id='DIRECTVALUE';
update ass_indicator ai set ai.flg_fixed=1 where ai.ref_resource_id='DIRECTVALUE';
--2010.7.20 业务类型表，添加逻辑删除字段
alter table busi add flg_deleted integer default 0;
--申诉复核业务类型(分开)
insert into busi (id,name,bo_class,busi_instance_class,flg_batch,scope_type) 
values('SSFHM','员工月度申诉','com.shengdai.kpi.appeal.vo.AssCheckAppeal'
,'com.shengdai.kpi.ass.service.impl.BusinessSSFHInstanceImpl',0,'20');
insert into busi (id,name,bo_class,busi_instance_class,flg_batch,scope_type) 
values('SSFHY','员工年度申诉','com.shengdai.kpi.appeal.vo.AssCheckAppeal'
,'com.shengdai.kpi.ass.service.impl.BusinessSSFHInstanceImpl',0,'20');
--待办创建索引
create index IDX_REC_WL_STATUS on REC_WL (STATUS, FLG_DELETED, BO_STATUS, HANDLER_UC_ID);
--2010.7.16 ywy 更改年度计划指标表,增加删除标志列
alter table year_plan_indicator add FLG_DELETED INTEGER default '0';
--2010.7.16 ywy 更改年度计划业务实现类路径
update busi  set bo_class='com.shengdai.kpi.yearplan.vo.YearPlan' , 
flg_batch='1',
busi_instance_class='com.shengdai.kpi.yearplan.service.impl.BusinessNDJHInstanceImpl' where id='NDJH';

--2010.7.15修改指标名称字段大小
alter table ass_indicator modify name varchar2(1000);
alter table template_indicator modify name varchar2(1000);

--2010.7.15 YWY 年度工作计划指标相关表
/*－－指标详细表－－*/
create table YEAR_PLAN_INDICATOR
(
  ID                  VARCHAR2(32) not null,
  YEAR_PLAN_ID         VARCHAR2(32),
  INDICATOR_TYPE_ID   VARCHAR2(32),
  INDICATOR_TYPE_NAME VARCHAR2(100),
  NAME                VARCHAR2(100),
  BASE_VALUE          VARCHAR2(2000),
  DEFY_VALUE          VARCHAR2(2000),
  ISQUANTIZED         INTEGER,
  CAL_WAY             VARCHAR2(2000),
  DATE_SOURCES        VARCHAR2(2000),
  SCALE               INTEGER,
  PRIORITY            INTEGER,
  REMARK              VARCHAR2(2000),
  ASS_WAY             VARCHAR2(2000),
  DEFINED             VARCHAR2(2000),
  REF_RESOURCE_ID     VARCHAR2(32),
  REF_RESOURCE_CLASS  VARCHAR2(100),
  SRC_INDICATOR_ID    VARCHAR2(32),
  STANDARD            VARCHAR2(2000),
  ASS_ORG_NAME        VARCHAR2(500)
);

comment on column YEAR_PLAN_INDICATOR.ASS_ORG_NAME
  is '评价部门';
alter table YEAR_PLAN_INDICATOR
  add constraint PK_YEAR_PLAN_INDICATOR primary key (ID)
  using index ;

/**指标类型表**/
create table YEAR_PLAN_INDICATOR_TYPE
(
  ID          VARCHAR2(32) not null,
  NAME        VARCHAR2(100),
  DESCRIPTION VARCHAR2(500),
  ISFIXED     INTEGER,
  PRIORITY    INTEGER,
  YEAR_PLAN_ID VARCHAR2(32),
  SRC_TYPE_ID VARCHAR2(32),
  CODE        VARCHAR2(32)
);
alter table YEAR_PLAN_INDICATOR_TYPE
  add constraint PK_YEAR_PLAN_INDICATOR_TYPE primary key (ID)
  using index ;


/**指标属性控制**/
create table YEAR_PLAN_INDI_ATTRIBUTE
(
  ID          VARCHAR2(32) not null,
  NAME        VARCHAR2(100),
  CODE        VARCHAR2(500),
  IS_SHOW     INTEGER,
  IS_EDIT     INTEGER,
  YEAR_PLAN_ID VARCHAR2(32),
  PRIORITY    INTEGER default 1
);

comment on table YEAR_PLAN_INDI_ATTRIBUTE
  is '考核模板指标属性控制';
alter table YEAR_PLAN_INDI_ATTRIBUTE
  add constraint PK_YEAR_PLAN_INDI_ATTRIBUTE primary key (ID)
  using index ;



/**环节处理人信息**/
create table YEAR_PLAN_NI_HANDLER_DETAIL
(
  ID           VARCHAR2(32) not null,
  YEAR_PLAN_ID  VARCHAR2(32),
  YEAR_PLAN_INDICATOR_ID VARCHAR2(32),
  NODE_ID      VARCHAR2(32),
  NODE_NAME    VARCHAR2(100),
  HANDLER_ID   VARCHAR2(32),
  REMARK       VARCHAR2(500),
  PRIORITY     NUMBER default 0
);

comment on table YEAR_PLAN_NI_HANDLER_DETAIL
  is '模板配置的环节处理人信息';
alter table YEAR_PLAN_NI_HANDLER_DETAIL
  add constraint PK_YEAR_PLAN_NI_HANDLER_DETAIL primary key (ID)
  using index ;

 --2010.7.13 ywy 添加年度计划表

/*==============================================================*/
/* Table: YEAR_PLAN                                             */
/*==============================================================*/
create table YEAR_PLAN  (
   ID                   VARCHAR(32)                     not null,
   NAME                 VARCHAR(100),
   BATCH_ID             VARCHAR(32),
   TEMPLATE_ID          VARCHAR(32),
   OWNER_ID             VARCHAR(32),
   OWNER_NAME           VARCHAR(100),
   FLOW_ID              VARCHAR(32),
   FLG_DELETED          INTEGER,
   CREATE_DATE          DATE,
   MODIFY_DATE          DATE,
   BATCH_DATE 			INTEGER,
   ORG_ID               VARCHAR(32),
   BUSI_TYPE            VARCHAR(100),
   VERSION              INTEGER,
   REMARK            VARCHAR(1000),
   TYPE          INTEGER default 1,
   BO_STATUS          INTEGER,
   OWNER_TYPE          INTEGER,
   constraint PK_YEAR_PLAN primary key (ID)
);

comment on table YEAR_PLAN is
'年度计划表';





--2010.7.11 XSF 年度考核模板修订,历史数据，所有考核表/模板初始化数据
insert into ass_indi_attribute aia (id, name,code,is_show,is_edit,assessment_id,priority) select 
sys_guid() ,'取值渠道','refResourceId',1,1,a.id,13 from ass_assessment a where a.id not in(select aia.assessment_id 
from ass_indi_attribute aia where aia.code='refResourceId');
insert into template_indi_attribute tia (id, name,code,is_show,is_edit,template_id,priority) select 
sys_guid() ,'取值渠道','refResourceId',1,1,t.id,13 from template t where t.id not in(select tia.template_id 
from template_indi_attribute tia where tia.code='refResourceId');

--2010.7.8 XSF Create/Recreate REC_FLOW indexes 
create index IDX_REC_FLOW_FLOWID on REC_FLOW (FLOW_ID);
create index IDX_REC_FLOW_ID_BATCHID on REC_FLOW (BATCH_ID);
create index IDX_REC_FLOW_ID_BO on REC_FLOW (BO_ID, BO_DELEGATE_ID);
--2010.7.5 XSF 添加公示处理方式
insert into flw_handle_way 
(id, name, handle_type_class, busi_code, priority, bean_name, page_remark, remark, flg_need_handler) 
values(17,'公示','','*',17,'serialFlow','同串行处理方式','',1);
update flw_node fn set fn.handle_way=17 where fn.node_name like '%员工确认%';
--2010.7.4 添加流程实例表的状态
alter table rec_flow add status Integer default 1;
update rec_flow rf set rf.status=(select a.bo_status from ass_assessment a where a.id=rf.bo_id),
rf.flg_deleted=(select a.flg_deleted from ass_assessment a where a.id=rf.bo_id);
alter table rec_flow add busi_type varchar2(32);
update rec_flow rf set rf.busi_type=(select ff.busi_type from flw_flow ff where ff.id=rf.flow_id);
alter table BUSI rename column  DEFAULT_SPREAD_URL to BO_CLASS;
alter table rec_flow drop column parent_rec_node;
alter table rec_flow drop column creator;
alter table rec_flow drop column creator_name;
alter table rec_flow add bo_name varchar2(500);
update rec_flow rf set rf.bo_name=(select a.name from ass_assessment a where a.id=rf.bo_id);
update rec_flow rf set rf.bo_name=(select a.name from ass_check_appeal a where a.id=rf.bo_id) where rf.bo_name is null;
alter table rec_flow add bo_delegate_id varchar2(32);
alter table rec_flow add bo_delegate_name varchar2(500);
alter table rec_flow add bo_delegate_type Integer default 0;
update rec_flow rf set rf.bo_delegate_id=(select a.owner_id from ass_assessment a where a.id=rf.bo_id)
,rf.bo_delegate_name=(select a.owner_name from ass_assessment a where a.id=rf.bo_id),
rf.bo_delegate_type=(select a.owner_type from ass_assessment a where a.id=rf.bo_id);
update rec_flow rf set rf.bo_delegate_id=(select a.owner_id from ass_check_appeal a where a.id=rf.bo_id)
,rf.bo_delegate_name=(select a.owner_name from ass_check_appeal a where a.id=rf.bo_id),
rf.bo_delegate_type=(select a.owner_type from ass_check_appeal a where a.id=rf.bo_id) where rf.bo_delegate_id is null;

update busi b set b.bo_class='com.shengdai.kpi.ass.vo.Assessment' where b.id='YGKHM';
update busi b set b.bo_class='com.shengdai.kpi.ass.vo.Assessment' where b.id='YGKHY';
update busi b set b.bo_class='com.shengdai.kpi.appeal.vo.AssCheckAppeal' where b.id='SSFH';
update busi b set b.bo_class='com.shengdai.kpi.yearplan.vo.AssYearPlan' where b.id='NDJH';
--2010.7.1 添加申诉复核表
-- Create table
create table ASS_CHECK_APPEAL
(
  ID              VARCHAR2(32) not null,
  ASSESSMENT_ID   VARCHAR2(32),
  ASSESSMENT_NAME VARCHAR2(200),
  NAME            VARCHAR2(200),
  BO_STATUS       INTEGER default 1,
  CREATE_DATE     DATE default sysdate,
  APPEALOR_ID     VARCHAR2(32),
  APPEALOR_NAME   VARCHAR2(100),
  OWNER_ID        VARCHAR2(32),
  OWNER_NAME      VARCHAR2(100),
  OWNER_TYPE      INTEGER,
  BATCH_DATE      INTEGER,
  FLG_DELETED     INTEGER default 0,
  BUSI_TYPE       VARCHAR2(32),
  FLOW_ID         VARCHAR2(32),
  FIRST_PRIORITY  INTEGER default 1,
  SECOND_PRIORITY INTEGER default 1,
  APPEAL_CONTENT  VARCHAR2(2000),
  APPEAL_OPINION  VARCHAR2(2000),
  REMARK          VARCHAR2(2000)
);
create table ASS_CHECK_APPEAL_RESULT
(
  ID             VARCHAR2(32) not null,
  APPEAL_ID      VARCHAR2(32),
  RESULT_OPINION VARCHAR2(4000),
  HANDLER_NAME   VARCHAR2(200),
  HANDLER_ID     VARCHAR2(32),
  REAL_HANDLER_NAME   VARCHAR2(200),
  REAL_HANDLER_ID     VARCHAR2(32),
  NODE_NAME      VARCHAR2(40),
  NODE_ID        VARCHAR2(32),
  CREATE_DATE    DATE default sysdate,
  COMP_DATE      DATE,
  STATUS         INTEGER default 0,
  priority 		 INTEGER default 0
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASS_CHECK_APPEAL_RESULT
  add constraint PK_ASS_CA_RESULT_ID primary key (ID);
-- Create/Recreate indexes 
create index IDX_ASS_CA_RESULT_ANID on ASS_CHECK_APPEAL_RESULT (APPEAL_ID, NODE_ID, HANDLER_ID);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ASS_CHECK_APPEAL
  add constraint PK_ASS_CHECK_APPEAL_ID primary key (ID);

--2010.6.29 添加BUSI表的业务类型适用对象类型字段
alter table BUSI add SCOPE_TYPE varchar2(1000) default '20';
alter table ASS_ASSESSMENT modify IMPORTANT_DESC varchar2(2000);
--2010.8.2 ywy 添加Busi表业务对象类路径字段
alter table Busi add bo_Class varchar2(500);

--2010.6.28 增加部门年度考核分数配置表－－ywy
/*==============================================================*/
/* Table: ASS_ORG_MARK                                          */
/*==============================================================*/
create table ASS_ORG_MARK  (
   ID                   VARCHAR2(32)                    not null,
   BATCH                NUMBER(32),
   CREATE_USER_NAME     VARCHAR2(32),
   CREATE_DATE          DATE,
   CREATE_USER_ID       VARCHAR2(32),
   UPDATE_USER_NAME     VARCHAR2(32),
   UPDATE_USER_ID       VARCHAR2(32),
   UPDATE_DATE          DATE,
   FLG_DELETED          NUMBER(2),
   constraint PK_ASS_ORG_MARK primary key (ID)
);

comment on column ASS_ORG_MARK.BATCH is
'批次（周期）';

/*==============================================================*/
/* Table: ASS_ORG_MARK_DETAIL                                   */
/*==============================================================*/
create table ASS_ORG_MARK_DETAIL  (
   BATCH_ID             VARCHAR2(32),
   ORG_ID               VARCHAR2(32),
   ORG_NAME             VARCHAR2(100),
   FLG_DELETED          NUMBER(10),
   MARK                 VARCHAR2(10),
   UPDATE_DATE          DATE,
   DELETE_DATE          DATE,
   CREATE_DATE          DATE
);

alter table ASS_ORG_MARK_DETAIL
   add constraint FK_ASS_ORG__REFERENCE_ASS_ORG_ foreign key (BATCH_ID)
      references ASS_ORG_MARK (ID);
