package cn.com.mmsweb.vo;

public class CollectVo {
 private String id;
 private String picUrl; //图片地址
 private String cardTitle; //名称
 private String name;//类别
 private String wishWord;//内容
 private String time;//时间
 private String userName;//用户名
 private String templateCardId;
 
 
public String getTemplateCardId() {
	return templateCardId;
}
public void setTemplateCardId(String templateCardId) {
	this.templateCardId = templateCardId;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPicUrl() {
	return picUrl;
}
public void setPicUrl(String picUrl) {
	this.picUrl = picUrl;
}
public String getCardTitle() {
	return cardTitle;
}
public void setCardTitle(String cardTitle) {
	this.cardTitle = cardTitle;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getWishWord() {
	return wishWord;
}
public void setWishWord(String wishWord) {
	this.wishWord = wishWord;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
@Override
public String toString() {
	return "CollectVo [id=" + id + ", picUrl=" + picUrl + ", cardTitle="
			+ cardTitle + ", name=" + name + ", wishWord=" + wishWord
			+ ", time=" + time + ", userName=" + userName + ", templateCardId="
			+ templateCardId + "]";
}

 
}
