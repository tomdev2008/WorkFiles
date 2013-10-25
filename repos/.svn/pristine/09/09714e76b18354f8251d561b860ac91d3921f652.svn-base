package com.unicom.mms.activemq;

import javax.jms.Connection;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.ObjectMessage;
import javax.jms.Session;
import javax.jms.Topic;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.log4j.Logger;

import com.unicom.mms.gateway.MsgReport;
import com.unicom.mms.gateway.RealTimeSMS;

public class RealTimeSmsListener implements MessageListener{
	private ActiveMQConnectionFactory connectionFactory;
	private Connection connection;
	private Session session;
	private Topic realtimesmsTopic;
	private Topic msgreportTopic;
	private MessageProducer msgReportProducer;
	private static final Logger log = Logger.getLogger(RealTimeSmsListener.class);
	
	public ActiveMQConnectionFactory getConnectionFactory() {
		return connectionFactory;
	}

	public void setConnectionFactory(ActiveMQConnectionFactory connectionFactory) {
		this.connectionFactory = connectionFactory;
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

	@Override
	public void onMessage(Message message) {
		try{
			ObjectMessage obj = (ObjectMessage)message;
			RealTimeSMS u = (RealTimeSMS) obj.getObject();
			log.info("*********************Received  messages."+ u.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void run() throws JMSException {
		if(connectionFactory!=null){
			log.info("connectionFactory is ok");
			
			connection = connectionFactory.createConnection();
	        session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
	        MessageConsumer consumer = session.createConsumer(realtimesmsTopic);
	        consumer.setMessageListener(this);
	        connection.start();
	        
	        msgReportProducer = session.createProducer(msgreportTopic);
	        log.info("Waiting for messages...");
		}
	}
	
	public void sendReport(MsgReport report){
		try {
			msgReportProducer.send(session.createObjectMessage(report));
			log.info("发送报告:"+report.toString());
		} catch (JMSException e) {
			e.printStackTrace();
		}
	}
}
