package com.unicom.mms.pushjob.model;

import java.util.Date;

/**
 * 
 * 功能描述:发送结果 
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-12
 * @author chenliang 修改日期：2013-9-12
 * @since mms-task
 */
public class JobSendRecsModel {

	private Integer id;
	// 创建时间
	private Date createTime;
	// 声音文件的URL
	private String musicUrl;
	// 发送时间
	private Date sendTime;
	// 地址
	private String picUrl;
	// 发送类型
	private Integer sendType;
	// 接收人号码
	private String reciver;
	// 是否成功发送(初始化：0) 0:待发送 1：发送成功 2：发送失败
	private Integer bSuccess;
	// 发送号码
	private String pushMdn;
	// 发送内容
	private String contents;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getMusicUrl() {
		return musicUrl;
	}

	public void setMusicUrl(String musicUrl) {
		this.musicUrl = musicUrl;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public Integer getSendType() {
		return sendType;
	}

	public void setSendType(Integer sendType) {
		this.sendType = sendType;
	}

	public String getReciver() {
		return reciver;
	}

	public void setReciver(String reciver) {
		this.reciver = reciver;
	}

	public Integer getbSuccess() {
		return bSuccess;
	}

	public void setbSuccess(Integer bSuccess) {
		this.bSuccess = bSuccess;
	}

	public String getPushMdn() {
		return pushMdn;
	}

	public void setPushMdn(String pushMdn) {
		this.pushMdn = pushMdn;
	}

}
