package com.unicom.mms.opcanaccount.model;

import java.io.Serializable;
import java.sql.Date;

/**
 * 
 * 功能描述:vac待发送实体类
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-25
 * @author chenliang 修改日期：2013-9-25
 * @since mms-task
 */
public class TSendList implements Serializable {

	public Integer sendId;
	public String msgSn;
	public Integer userId;
	public String ssn;
	public Integer msgSendtype;
	public Date sendTime;
	public Integer msgStatus;
	public String msgBody;
	public String receiveMobile;
	public Date createTime;
	public Integer sendLevel;
	public Integer uusdCommandStatus;
	public Integer sendTimestamp;

	public Integer getSendId() {
		return sendId;
	}

	public void setSendId(Integer sendId) {
		this.sendId = sendId;
	}

	public String getMsgSn() {
		return msgSn;
	}

	public void setMsgSn(String msgSn) {
		this.msgSn = msgSn;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public Integer getMsgSendtype() {
		return msgSendtype;
	}

	public void setMsgSendtype(Integer msgSendtype) {
		this.msgSendtype = msgSendtype;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public Integer getMsgStatus() {
		return msgStatus;
	}

	public void setMsgStatus(Integer msgStatus) {
		this.msgStatus = msgStatus;
	}

	public String getMsgBody() {
		return msgBody;
	}

	public void setMsgBody(String msgBody) {
		this.msgBody = msgBody;
	}

	public String getReceiveMobile() {
		return receiveMobile;
	}

	public void setReceiveMobile(String receiveMobile) {
		this.receiveMobile = receiveMobile;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getSendLevel() {
		return sendLevel;
	}

	public void setSendLevel(Integer sendLevel) {
		this.sendLevel = sendLevel;
	}

	public Integer getUusdCommandStatus() {
		return uusdCommandStatus;
	}

	public void setUusdCommandStatus(Integer uusdCommandStatus) {
		this.uusdCommandStatus = uusdCommandStatus;
	}

	public Integer getSendTimestamp() {
		return sendTimestamp;
	}

	public void setSendTimestamp(Integer sendTimestamp) {
		this.sendTimestamp = sendTimestamp;
	}

	@Override
	public String toString() {
		return "TSendList [sendId=" + sendId + ", msgSn=" + msgSn + ", userId="
				+ userId + ", ssn=" + ssn + ", msgSendtype=" + msgSendtype
				+ ", sendTime=" + sendTime + ", msgStatus=" + msgStatus
				+ ", msgBody=" + msgBody + ", receiveMobile=" + receiveMobile
				+ ", createTime=" + createTime + ", sendLevel=" + sendLevel
				+ ", uusdCommandStatus=" + uusdCommandStatus
				+ ", sendTimestamp=" + sendTimestamp + "]";
	}

	public TSendList(Integer sendId, String msgSn, Integer userId, String ssn,
			Integer msgSendtype, Date sendTime, Integer msgStatus,
			String msgBody, String receiveMobile, Date createTime,
			Integer sendLevel, Integer uusdCommandStatus, Integer sendTimestamp) {
		super();
		this.sendId = sendId;
		this.msgSn = msgSn;
		this.userId = userId;
		this.ssn = ssn;
		this.msgSendtype = msgSendtype;
		this.sendTime = sendTime;
		this.msgStatus = msgStatus;
		this.msgBody = msgBody;
		this.receiveMobile = receiveMobile;
		this.createTime = createTime;
		this.sendLevel = sendLevel;
		this.uusdCommandStatus = uusdCommandStatus;
		this.sendTimestamp = sendTimestamp;
	}

	public TSendList() {
		super();
	}
	
}
