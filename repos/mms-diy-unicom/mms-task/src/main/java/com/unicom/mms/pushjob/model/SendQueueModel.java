package com.unicom.mms.pushjob.model;

import java.util.Date;

import com.unicom.mms.entity.TbUsers;

/**
 * 
 * 功能描述:发送队列表 
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-12
 * @author chenliang 修改日期：2013-9-12
 * @since mms-task
 */
public class SendQueueModel {

	private Integer id;
	// 发送时间
	private Date sendTime;
	// 创建时间
	private Date createTime;
	// 声音文件的URL
	private String musicUrl;
	// 地址
	private String picUrl;
	// 发送类型
	private Integer sendType;
	// 接收人号码
	private String reciverMdn;
	// 发送号码
	private String sendMdn;
	// mms 类型
	private Integer mmsType;
	// 发送类型
	private Integer sendTimeType;
	// 发送内容
	private String sendContents;
	// 端口
	private String port;
	

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
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

	public String getSendMdn() {
		return sendMdn;
	}

	public void setSendMdn(String sendMdn) {
		this.sendMdn = sendMdn;
	}

	public String getReciverMdn() {
		return reciverMdn;
	}

	public void setReciverMdn(String reciverMdn) {
		this.reciverMdn = reciverMdn;
	}

	public Integer getMmsType() {
		return mmsType;
	}

	public void setMmsType(Integer mmsType) {
		this.mmsType = mmsType;
	}

	public Integer getSendTimeType() {
		return sendTimeType;
	}

	public void setSendTimeType(Integer sendTimeType) {
		this.sendTimeType = sendTimeType;
	}

	public String getSendContents() {
		return sendContents;
	}

	public void setSendContents(String sendContents) {
		this.sendContents = sendContents;
	}

	@Override
	public String toString() {
		return "SendQueueModel [id=" + id + ", sendTime=" + sendTime
				+ ", createTime=" + createTime + ", musicUrl=" + musicUrl
				+ ", picUrl=" + picUrl + ", sendType=" + sendType
				+ ", reciverMdn=" + reciverMdn + ", sendMdn=" + sendMdn
				+ ", mmsType=" + mmsType + ", sendTimeType=" + sendTimeType
				+ ", sendContents=" + sendContents + ", port=" + port + "]";
	}
	
}
