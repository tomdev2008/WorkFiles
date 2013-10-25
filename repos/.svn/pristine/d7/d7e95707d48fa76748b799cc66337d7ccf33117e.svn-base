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
	 * 错误原因
	 */
	private String reason;
	/**
	 * 消息ID
	 */
	private String transationId;
	/**
	 * 渠道,见<code>SharePublicContants</code>的CHANNEL_xxx
	 */
	private String channel;

	/**
	 * 消息类型,见<code>SharePublicContants</code>的GATEWAY_MSGTYPE_xxx
	 */
	private int msgType;
	/**
	 * 消息序号ID,表里面的序号，用来做唯一标记
	 */
	private String msgSequence;

	public int getReportType() {
		return reportType;
	}

	public void setReportType(int reportType) {
		this.reportType = reportType;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getTransationId() {
		return transationId;
	}

	public void setTransationId(String transationId) {
		this.transationId = transationId;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getMsgSequence() {
		return msgSequence;
	}

	public void setMsgSequence(String msgSequence) {
		this.msgSequence = msgSequence;
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
	public int getMsgType() {
		return msgType;
	}

	public void setMsgType(int msgType) {
		this.msgType = msgType;
	}

	@Override
	public String toString() {
		return "MsgReport [reportType=" + reportType + ", reciveTime="
				+ reciveTime + ", result=" + result + ", reason=" + reason
				+ ", transationId=" + transationId + ", channel=" + channel
				+ ", msgType=" + msgType + ", msgSequence=" + msgSequence + "]";
	}

}
