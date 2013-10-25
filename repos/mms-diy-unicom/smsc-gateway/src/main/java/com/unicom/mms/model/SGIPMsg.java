package com.unicom.mms.model;

import java.util.Date;

import com.unicom.mms.util.PropertiesConfig;

public class SGIPMsg {
	/**
	 * SP的接入号码，字符
	 */
	private String SPNumber;
	/**
	 * 付费号码，字符，手机号码前加“86”国别标志；当且仅当群发且对用户收费时为空；如果为空，则该条短消息产生的费用由UserNumber代表的用户支付；如果为全零字符串“000000000000000000000”，表示该条短消息产生的费用由SP支付。
	 */
	private  String ChargeNumber;
	/**
	 * 一个或多个接收该短消息的手机号，手机号之间用逗号(,)隔开，字符，手机号码前加“86”国别标志，如8613001125453,8613001132345
	 */
	private String[] UserNumber;
	/**
	 * 企业代码，取值范围0-99999，字符
	 */
	private  String CorpId;
	/**
	 * 业务代码，由SP定义，字符
	 */
	private  String ServiceType;
	/**
	 * 计费类型，字符
	 */
	private  int FeeType;
	/**
	 * 取值范围0-99999，该条短消息的收费值，单位为分，由SP定义，字符.对于包月制收费的用户，该值为月租费的值
	 */
	private  String FeeValue;
	/**
	 * 取值范围0-99999，赠送用户的话费，单位为分，由SP定义，特指由SP向用户发送广告时的赠送话费，字符
	 */
	private  String GivenValue;
	/**
	 * 代收费标志，0：应收；1：实收，字符
	 */
	private  int AgentFlag;
	/**
	 * 引起MT消息的原因
		0-MO点播引起的第一条MT消息；
		1-MO点播引起的非第一条MT消息；
		2-非MO点播引起的MT消息；
		3-系统反馈引起的MT消息。
		字符
	 */
	private  int MorelatetoMTFlag;
	/**
	 * 优先级0-9从低到高，默认为0，十六进制数字
	 */
	private  int Priority;
	/**
	 * 短消息寿命的终止时间，如果为空，表示使用短消息中心的缺省值。时间内容为16个字符，格式为“yymmddhhmmsstnnp”，其中“tnnp”取固定值“032+”，即默认系统为北京时间
	 */
	private  Date ExpireTime;
	/**
	 * 短消息定时发送的时间，如果为空，表示立刻发送该短消息。时间内容为16个字符，格式为“yymmddhhmmsstnnp”，其中“tnnp”取固定值“032+”，即默认系统为北京时间
	 */
	private  Date ScheduleTime;
	/**
	 * 状态报告标记
		0-该条消息只有最后出错时要返回状态报告
		1-该条消息无论最后是否成功都要返回状态报告
		2-该条消息不需要返回状态报告
		3-该条消息仅携带包月计费信息，不下发给用户，要返回状态报告
		其它-保留
		缺省设置为0，十六进制数字
	 */
	private  int ReportFlag;
	/**
	 * GSM协议类型。详细解释请参考GSM03.40中的9.2.3.9 十六进制数字
	 */
	private  int TP_pid;
	/**
	 * GSM协议类型。详细解释请参考GSM03.40中的9.2.3.23,仅使用1位，右对齐 十六进制数字
	 */
	private  int TP_udhi;
	/**
	 * 短消息的编码格式。
		0：纯ASCII字符串
		3：写卡操作
		4：二进制编码
		8：UCS2编码
		15：GBK编码
		其它参见GSM3.38第4节：SMS Data Coding Scheme
		十六进制数字
	 */
	private  int MessageCoding;
	/**
	 * 信息类型：
		0-短消息信息
		其它：待定
		十六进制数字
	 */
	private  int MessageType;
	private  int MessageLen;
	/**
	 * 短消息的内容，十六进制数字
	 */
	private  byte[] MessageContent;
	/**
	 * 保留，扩展用
	 */
	private  String reserve;
	
	public SGIPMsg (PropertiesConfig  properties){
		this.SPNumber = properties.getString("SPNumber");
		this.ChargeNumber = properties.getString("ChargeNumber");
		this.CorpId = properties.getString("CorpId");
		this.ServiceType = properties.getString("ServiceType");
		this.FeeType = properties.getInt("FeeType");
		this.FeeValue = properties.getString("FeeValue");
		this.GivenValue =  properties.getString("GivenValue");
		this.AgentFlag = properties.getInt("AgentFlag");
		this.MorelatetoMTFlag = properties.getInt("MorelatetoMTFlag");
		this.Priority = 6; //优先级0-9从低到高，默认为0
		this.ExpireTime = null;
		this.ScheduleTime = null;
		this.ReportFlag = 1;
		this.TP_pid=0;
		this.TP_udhi=0;
		this.MessageCoding = properties.getInt("MessageCoding");
		this.MessageType = 0;
		this.reserve ="";
	}
	public String getSPNumber() {
		return SPNumber;
	}
	public void setSPNumber(String sPNumber) {
		SPNumber = sPNumber;
	}
	public String getChargeNumber() {
		return ChargeNumber;
	}
	public void setChargeNumber(String chargeNumber) {
		ChargeNumber = chargeNumber;
	}
	public String[] getUserNumber() {
		return UserNumber;
	}
	public void setUserNumber(String[] userNumber) {
		UserNumber = userNumber;
	}
	public String getCorpId() {
		return CorpId;
	}
	public void setCorpId(String corpId) {
		CorpId = corpId;
	}
	public String getServiceType() {
		return ServiceType;
	}
	public void setServiceType(String serviceType) {
		ServiceType = serviceType;
	}
	public int getFeeType() {
		return FeeType;
	}
	public void setFeeType(int feeType) {
		FeeType = feeType;
	}
	public String getFeeValue() {
		return FeeValue;
	}
	public void setFeeValue(String feeValue) {
		FeeValue = feeValue;
	}
	public String getGivenValue() {
		return GivenValue;
	}
	public void setGivenValue(String givenValue) {
		GivenValue = givenValue;
	}
	public int getAgentFlag() {
		return AgentFlag;
	}
	public void setAgentFlag(int agentFlag) {
		AgentFlag = agentFlag;
	}
	public int getMorelatetoMTFlag() {
		return MorelatetoMTFlag;
	}
	public void setMorelatetoMTFlag(int morelatetoMTFlag) {
		MorelatetoMTFlag = morelatetoMTFlag;
	}
	public int getPriority() {
		return Priority;
	}
	public void setPriority(int priority) {
		Priority = priority;
	}
	public Date getExpireTime() {
		return ExpireTime;
	}
	public void setExpireTime(Date expireTime) {
		ExpireTime = expireTime;
	}
	public Date getScheduleTime() {
		return ScheduleTime;
	}
	public void setScheduleTime(Date scheduleTime) {
		ScheduleTime = scheduleTime;
	}
	public int getReportFlag() {
		return ReportFlag;
	}
	public void setReportFlag(int reportFlag) {
		ReportFlag = reportFlag;
	}
	public int getTP_pid() {
		return TP_pid;
	}
	public void setTP_pid(int tP_pid) {
		TP_pid = tP_pid;
	}
	public int getTP_udhi() {
		return TP_udhi;
	}
	public void setTP_udhi(int tP_udhi) {
		TP_udhi = tP_udhi;
	}
	public int getMessageCoding() {
		return MessageCoding;
	}
	public void setMessageCoding(int messageCoding) {
		MessageCoding = messageCoding;
	}
	public int getMessageType() {
		return MessageType;
	}
	public void setMessageType(int messageType) {
		MessageType = messageType;
	}
	public int getMessageLen() {
		return MessageLen;
	}
	public void setMessageLen(int messageLen) {
		MessageLen = messageLen;
	}
	public byte[] getMessageContent() {
		return MessageContent;
	}
	public void setMessageContent(byte[] messageContent) {
		MessageContent = messageContent;
	}
	public String getReserve() {
		return reserve;
	}
	public void setReserve(String reserve) {
		this.reserve = reserve;
	}	
}
