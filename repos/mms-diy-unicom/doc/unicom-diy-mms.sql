CREATE TABLE "t_users" (
"id" INTEGER NULL,
"mdn" VARCHAR2 NULL,
"pwd" VARCHAR2 NULL,
"registerTime" DATE NULL,
"unregisterTime" DATE NULL,
"status" INTEGER NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_cms_users" (
"uid" VARCHAR2 NULL,
"pwd" VARCHAR2 NULL,
"email" VARCHAR2 NULL,
"mdn" VARCHAR2 NULL,
"roleId" INTEGER NULL,
PRIMARY KEY ("uid") 
);

CREATE TABLE "t_template_card" (
"id" INTEGER NULL,
"cardTitle" VARCHAR2 NULL,
"wishWord" VARCHAR2 NULL,
"collectNum" INTEGER NULL,
"cardType" INTEGER NULL,
"picUrl" VARCHAR2 NULL,
"status" INTEGER NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_photo_frame" (
"id" INTEGER NULL,
"name" VARCHAR2 NULL,
"picUrl" VARCHAR2 NULL,
"status" INTEGER NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_hot_billboard" (
"top1" INTEGER NULL,
"top2" INTEGER NULL,
"top3" INTEGER NULL,
"top4" INTEGER NULL,
"top5" INTEGER NULL,
"top6" INTEGER NULL,
"top10" INTEGER NULL,
"top9" INTEGER NULL,
"top8" INTEGER NULL,
"top7" INTEGER NULL
);

CREATE TABLE "t_decoration_type" (
"id" INTEGER NULL,
"name" VARCHAR2 NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_card_type" (
"id" INTEGER NULL,
"name" VARCHAR2 NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_cms_roles" (
"id" INTEGER NULL,
"roleName" VARCHAR2 NULL,
"memo" VARCHAR2 NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_rights" (
"id" INTEGER NULL,
"rightName" VARCHAR2 NULL,
"url" VARCHAR2 NULL,
"rightLevel" INTEGER NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_rights_roles" (
"roleId" INTEGER NULL,
"rightId" INTEGER NULL
);

CREATE TABLE "t_services" (
"id" INTEGER NULL,
"serviceName" VARCHAR2 NULL,
"param" VARCHAR2 NULL,
"result" VARCHAR2 NULL,
"operUser" VARCHAR2 NULL,
"operTime" DATE NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_contacts" (
"id" INTEGER NULL,
"name" VARCHAR2 NULL,
"mdn" VARCHAR2 NULL,
"birthday" DATE NULL,
"email" VARCHAR2 NULL,
"userId" VARCHAR2 NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_groups" (
"id" INTEGER NULL,
"name" VARCHAR2 NULL,
"userId" VARCHAR2 NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_collect" (
"id" INTEGER NULL,
"collectTime" DATE NULL,
"cardId" INTEGER NULL,
"userId" VARCHAR2 NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_send_recs" (
"id" INTEGER NULL,
"sendTime" DATE NULL,
"picUrl" VARCHAR2 NULL,
"sendType" INTEGER NULL,
"reciver" VARCHAR2 NULL,
"userId" VARCHAR2 NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_stamp" (
"id" INTEGER NULL,
"name" VARCHAR2 NULL,
"picUrl" VARCHAR2 NULL,
"status" INTEGER NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_postmark" (
"id" INTEGER NULL,
"name" VARCHAR2 NULL,
"picUrl" VARCHAR2 NULL,
"status" INTEGER NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_decoration" (
"id" INTEGER NULL,
"name" VARCHAR2 NULL,
"picUrl" VARCHAR2 NULL,
"status" INTEGER NULL,
"decoType" INTEGER NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_bg_music" (
"id" INTEGER NULL,
"name" VARCHAR2 NULL,
"fileUrl" VARCHAR2 NULL,
"status" INTEGER NULL,
PRIMARY KEY ("id") 
);

CREATE TABLE "t_new_billboard" (
"top1" INTEGER NULL,
"top2" INTEGER NULL,
"top3" INTEGER NULL,
"top4" INTEGER NULL,
"top5" INTEGER NULL,
"top6" INTEGER NULL,
"top10" INTEGER NULL,
"top9" INTEGER NULL,
"top8" INTEGER NULL,
"top7" INTEGER NULL
);

CREATE TABLE "t_group_contact" (
"groupId" INTEGER NULL,
"contactId" INTEGER NULL
);

CREATE TABLE "t_send_queue" (
"id" INTEGER NULL,
"sendTime" DATE NULL,
"picUrl" VARCHAR2 NULL,
"reciver" INTEGER NULL,
"userId" INTEGER NULL,
PRIMARY KEY ("id") 
);

COMMENT ON COLUMN "t_send_queue"."sendTime" IS '预定发送时间';

CREATE TABLE "t_user_order" (
"id" INTEGER NOT NULL,
"productId" INTEGER NULL,
"userId" INTEGER NULL,
PRIMARY KEY ("id") 
);


ALTER TABLE "t_rights_roles" ADD CONSTRAINT "fkRightId" FOREIGN KEY ("rightId") REFERENCES "t_rights" ("id");
ALTER TABLE "t_rights_roles" ADD CONSTRAINT "fkRoleId" FOREIGN KEY ("roleId") REFERENCES "t_cms_roles" ("id");
ALTER TABLE "t_cms_users" ADD CONSTRAINT "fkuserRoleId" FOREIGN KEY ("roleId") REFERENCES "t_cms_roles" ("id");
ALTER TABLE "t_template_card" ADD CONSTRAINT "fksdfasdfas" FOREIGN KEY ("cardType") REFERENCES "t_card_type" ("id");
ALTER TABLE "t_decoration" ADD CONSTRAINT "sdfasdfasdfsa" FOREIGN KEY ("decoType") REFERENCES "t_decoration_type" ("id");
ALTER TABLE "t_new_billboard" ADD CONSTRAINT "dsxcfvasdfdsaf" FOREIGN KEY ("top1") REFERENCES "t_template_card" ("id");
ALTER TABLE "t_hot_billboard" ADD CONSTRAINT "asfsadfaseasdf" FOREIGN KEY ("top1") REFERENCES "t_template_card" ("id");
ALTER TABLE "t_contacts" ADD CONSTRAINT "asdfasdfwesdfasdf" FOREIGN KEY ("userId") REFERENCES "t_users" ("mdn");
ALTER TABLE "t_groups" ADD CONSTRAINT "asdfasdfasdfewwsrfa" FOREIGN KEY ("userId") REFERENCES "t_users" ("mdn");
ALTER TABLE "t_group_contact" ADD CONSTRAINT "asdfasdfewrewa" FOREIGN KEY ("groupId") REFERENCES "t_groups" ("id");
ALTER TABLE "t_group_contact" ADD CONSTRAINT "dsffgdfgr4sdf" FOREIGN KEY ("contactId") REFERENCES "t_contacts" ("id");
ALTER TABLE "t_collect" ADD CONSTRAINT "asdfcbsdgfdsg" FOREIGN KEY ("userId") REFERENCES "t_users" ("mdn");
ALTER TABLE "t_send_recs" ADD CONSTRAINT "gffdgsdfgasd" FOREIGN KEY ("userId") REFERENCES "t_users" ("mdn");
ALTER TABLE "t_user_order" ADD CONSTRAINT "asdfasdfsdf" FOREIGN KEY ("userId") REFERENCES "t_users" ("id");

