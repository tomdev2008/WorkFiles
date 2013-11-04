package com.unicom.mms.gateway;

import java.util.Date;

public class MsgReport implements java.io.Serializable {
	private static final long serialVersionUID = -2398586445298978374L;
	/**
	 * 消息报告类型,见<code>SharePublicContants</code>的MSGREPORT_xxx
	 */
	private int reportType;
	/**
	 * 网关/用户接收时间
	 */
	private Date reciveTime;

	/**
	 * 报告结果
	 */
	private String result;
	/**
	 * 原因
	 */
	private String reason;
	/**
	 * 消息ID
	 */
	private String MessageID;
	
	/**
	 * 消息类型,见<code>SharePublicContants</code>的GATEWAY_MSGTYPE_xxx
	 */
	private int msgType;

	/**
	 * 发送对象
	 */
	private Object req;

	public int getReportType() {
		return reportType;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getMsgType() {
		return msgType;
	}

	public void setMsgType(int msgType) {
		this.msgType = msgType;
	}

	public void setReportType(int reportType) {
		this.reportType = reportType;
	}

	public Date getReciveTime() {
		return reciveTime;
	}

	public void setReciveTime(Date reciveTime) {
		this.reciveTime = reciveTime;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	public String getMessageID() {
		return MessageID;
	}

	public void setMessageID(String messageID) {
		MessageID = messageID;
	}

	public Object getReq() {
		return req;
	}

	public void setReq(Object req) {
		this.req = req;
	}

	@Override
	public String toString() {
		return "MsgReport [reportType=" + reportType + ", reciveTime="
				+ reciveTime + ", result=" + result + ", reason=" + reason
				+ ", MessageID=" + MessageID + ", msgType=" + msgType + "]";
	}
}