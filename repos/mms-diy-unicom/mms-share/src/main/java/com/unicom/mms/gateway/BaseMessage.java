package com.unicom.mms.gateway;

/**
 * 
 * 短信父类
 * 
 * @author zhangjh 新增日期：2013-9-25
 * @since mms-share
 */
public class BaseMessage implements java.io.Serializable {
	private static final long serialVersionUID = 8441447705910151037L;
	/**
	 * 发起人
	 */
	private String sender;
	/**
	 * 接收人
	 */
	private String receiver;

	/**
	 * 发送内容
	 */
	private String content;
	
	/**
	 * 渠道,见<code>SharePublicContants</code>的CHANNEL_xxx
	 */
	private String channel;
	
	/**
	 * 消息类型,见<code>SharePublicContants</code>的GATEWAY_MSGTYPE_xxx
	 */
	private int msgType;
	/**
	 * 消息序号ID,表里面的序号
	 */
	private String msgSequence;

	public String getSender() {
		return sender;
	}

	public String getMsgSequence() {
		return msgSequence;
	}

	public void setMsgSequence(String msgSequence) {
		this.msgSequence = msgSequence;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}
	public int getMsgType() {
		return msgType;
	}

	public void setMsgType(int msgType) {
		this.msgType = msgType;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
