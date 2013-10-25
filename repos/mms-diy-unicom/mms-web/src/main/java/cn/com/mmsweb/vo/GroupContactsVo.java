package cn.com.mmsweb.vo;

public class GroupContactsVo {
   private String contactsId;     //联系人ID
   private String groupsId;       //分组ID
   private String contactsName;   //联系人名称
   private String groupsName;     //分组名称
   private String msn;            //号码
   private String birthday;       //生日
   private String email;          //邮箱
   private String userName;       //用户名称
public String getContactsId() {
	return contactsId;
}
public void setContactsId(String contactsId) {
	this.contactsId = contactsId;
}
public String getGroupsId() {
	return groupsId;
}
public void setGroupsId(String groupsId) {
	this.groupsId = groupsId;
}
public String getContactsName() {
	return contactsName;
}
public void setContactsName(String contactsName) {
	this.contactsName = contactsName;
}
public String getGroupsName() {
	return groupsName;
}
public void setGroupsName(String groupsName) {
	this.groupsName = groupsName;
}
public String getMsn() {
	return msn;
}
public void setMsn(String msn) {
	this.msn = msn;
}
public String getBirthday() {
	return birthday;
}
public void setBirthday(String birthday) {
	this.birthday = birthday;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
@Override
public String toString() {
	return "GroupContactsVo [contactsId=" + contactsId + ", groupsId="
			+ groupsId + ", contactsName=" + contactsName + ", groupsName="
			+ groupsName + ", msn=" + msn + ", birthday=" + birthday
			+ ", email=" + email + ", userName=" + userName + "]";
}
   
   
}
