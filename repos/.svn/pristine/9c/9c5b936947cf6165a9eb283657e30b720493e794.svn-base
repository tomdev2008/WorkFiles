package com.unicom.mms.gateway;

import java.util.Date;

/**
 * 
 * 群发短信消息体<br/>
 * @author zhangjh 新增日期：2013-9-25
 * @since mms-share
 */
public class BatchSendSMS extends BaseMessage {
	private static final long serialVersionUID = -6509658568425869409L;
	/**
	 * 开始发送时间
	 */
	private Date startSendTime;
	/**
	 * 结束发送时间
	 */
	private Date endSendTime;
	public Date getStartSendTime() {
		return startSendTime;
	}
	public void setStartSendTime(Date startSendTime) {
		this.startSendTime = startSendTime;
	}
	public Date getEndSendTime() {
		return endSendTime;
	}
	public void setEndSendTime(Date endSendTime) {
		this.endSendTime = endSendTime;
	}
	@Override
	public String toString() {
		return "BatchSendSMS [startSendTime=" + startSendTime
				+ ", endSendTime=" + endSendTime + ", getSender()="
				+ getSender() + ", getMsgSequence()=" + getMsgSequence()
				+ ", getReceiver()=" + getReceiver() + ", getChannel()="
				+ getChannel() + ", getMsgType()=" + getMsgType()
				+ ", getContent()=" + getContent() + "]";
	}
	
}
