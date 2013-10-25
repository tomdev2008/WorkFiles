package com.unicom.mms.mcp.activemq;

import javax.jms.Connection;
import javax.jms.DeliveryMode;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.ObjectMessage;
import javax.jms.Session;
import javax.jms.Topic;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.log4j.Logger;

import com.unicom.mms.constants.SharePublicContants;
import com.unicom.mms.gateway.BatchSendMMS;
import com.unicom.mms.gateway.BatchSendSMS;
import com.unicom.mms.gateway.MsgReport;
import com.unicom.mms.gateway.PostcardMMS;
import com.unicom.mms.gateway.RealTimeSMS;
import com.unicom.mms.mcp.activemq.work.BatchMmsReportThread;
import com.unicom.mms.mcp.activemq.work.BatchSmsReportThread;
import com.unicom.mms.mcp.activemq.work.PostcardMmsReport;
import com.unicom.mms.mcp.activemq.work.RealtimeSmsReport;


public class MsgPublisher implements MessageListener{
	private static final Logger log = Logger.getLogger(MsgPublisher.class);
	private ActiveMQConnectionFactory connectionFactory;
	private Connection connection;
	private Session session;
	private final Object mutex = new Object();
	/**
	 * 群发彩信产生者
	 */
	private MessageProducer batchMmsPublisher;
	/**
	 * 	群发短信产生者
	 */
	private MessageProducer batchSmsPublisher;
	/**
	 * 明信片彩信产生者
	 */
	private MessageProducer  postcardMmsPublisher;
	/**
	 * 实时短信产生者
	 */
	private MessageProducer  realtimeSmsPublisher;
	private Topic batchsendmmsTopic;
	private Topic batchsendsmsTopic;
	private Topic postcardmmsTopic;
	private Topic realtimesmsTopic;
	private Topic msgreportTopic;
	
	@Override
	public void onMessage(Message report) {
		log.info("收到报告:"+report.getClass());
		 synchronized (mutex) {
			if (report instanceof MsgReport) {
				MsgReport msgReport = (MsgReport) report;
				Runnable runnable = null;
				switch (msgReport.getMsgType()) {
				case SharePublicContants.GATEWAY_MSGTYPE_BATCHMMS:
					runnable = new BatchMmsReportThread(msgReport);
					break;
				case SharePublicContants.GATEWAY_MSGTYPE_BATCHSMS:
					runnable = new BatchSmsReportThread(msgReport);
					break;
				case SharePublicContants.GATEWAY_MSGTYPE_POSTCARDMMS:
					runnable = new PostcardMmsReport(msgReport);
					break;
				case SharePublicContants.GATEWAY_MSGTYPE_REALTIMESMS:
					runnable = new RealtimeSmsReport(msgReport);
					break;
				default:
					break;
				}
				if(runnable!=null){
					Thread t = new Thread(runnable);
					t.start();
				}
			}
		}
	}
	public void send(Object objMsg) throws Exception {
		ObjectMessage message = session.createObjectMessage();
		if(objMsg instanceof BatchSendMMS){
			BatchSendMMS m = (BatchSendMMS)objMsg;
			message.setObject(m);
			batchMmsPublisher.send(message);
			log.info("发送批量彩信:"+m.toString());
		}else if(objMsg instanceof BatchSendSMS){
			BatchSendSMS m = (BatchSendSMS)objMsg;
			message.setObject((BatchSendSMS)m);
			batchSmsPublisher.send(message);
			log.info("发送批量短信:"+m.toString());
		}else if(objMsg instanceof PostcardMMS){
			PostcardMMS m = (PostcardMMS)objMsg;
			message.setObject(m);
			postcardMmsPublisher.send(message);
			log.info("发送明信片短信:"+m.toString());
		}else if(objMsg instanceof RealTimeSMS){
			RealTimeSMS m = (RealTimeSMS)objMsg;
			message.setObject(m);
			realtimeSmsPublisher.send(message);
			log.info("发送实时短信:"+m.toString());
		}else{
			throw new Exception("搞什么!传错发送对象过来");
		}
	}
	
	public void run() throws Exception {
		connection = connectionFactory.createConnection();
		session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
		batchMmsPublisher = session.createProducer(batchsendmmsTopic);
		batchMmsPublisher.setDeliveryMode(DeliveryMode.PERSISTENT);
		batchSmsPublisher = session.createProducer(batchsendsmsTopic);
		batchSmsPublisher.setDeliveryMode(DeliveryMode.PERSISTENT);
		postcardMmsPublisher = session.createProducer(postcardmmsTopic);
		postcardMmsPublisher.setDeliveryMode(DeliveryMode.PERSISTENT);
		postcardMmsPublisher.setPriority(9);//优先级搞
		realtimeSmsPublisher = session.createProducer(realtimesmsTopic);
		realtimeSmsPublisher.setDeliveryMode(DeliveryMode.PERSISTENT);
		realtimeSmsPublisher.setPriority(9);//优先级搞
		
		session.createConsumer(msgreportTopic).setMessageListener(this);
        connection.start();
        System.out.println("****************************启动监听报告成功*****************************");
	}

	public ActiveMQConnectionFactory getConnectionFactory() {
		return connectionFactory;
	}

	public void setConnectionFactory(ActiveMQConnectionFactory connectionFactory) {
		this.connectionFactory = connectionFactory;
	}

	public Topic getBatchsendmmsTopic() {
		return batchsendmmsTopic;
	}

	public void setBatchsendmmsTopic(Topic batchsendmmsTopic) {
		this.batchsendmmsTopic = batchsendmmsTopic;
	}

	public Topic getBatchsendsmsTopic() {
		return batchsendsmsTopic;
	}

	public void setBatchsendsmsTopic(Topic batchsendsmsTopic) {
		this.batchsendsmsTopic = batchsendsmsTopic;
	}

	public Topic getPostcardmmsTopic() {
		return postcardmmsTopic;
	}

	public void setPostcardmmsTopic(Topic postcardmmsTopic) {
		this.postcardmmsTopic = postcardmmsTopic;
	}

	public Topic getRealtimesmsTopic() {
		return realtimesmsTopic;
	}

	public void setRealtimesmsTopic(Topic realtimesmsTopic) {
		this.realtimesmsTopic = realtimesmsTopic;
	}

	public Topic getMsgreportTopic() {
		return msgreportTopic;
	}

	public void setMsgreportTopic(Topic msgreportTopic) {
		this.msgreportTopic = msgreportTopic;
	}

}
