package com.unicom.mms;

import javax.jms.JMSException;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.unicom.mms.activemq.BatchSendSmsListener;
import com.unicom.mms.activemq.RealTimeSmsListener;
import com.unicom.mms.util.PropertiesConfig;

public class InitInstance {
	private static InitInstance initInstance = null;
	
	public static InitInstance getInstance(){
		if(initInstance == null){
			initInstance = new InitInstance();
		}
		return initInstance;
	}
	
	private PropertiesConfig smsProperties;
	private BatchSendSmsListener batchSendSmsListener;
	private RealTimeSmsListener realTimeSmsListener;
	
	private InitInstance(){
		try {
			smsProperties = new PropertiesConfig("/smsc/sms.properties");
			ApplicationContext context = new ClassPathXmlApplicationContext("classpath:modules/applicationContext.xml");
			if(context!=null){
				System.out.println("success load spring");
			}
			//监听消息
			realTimeSmsListener= (RealTimeSmsListener) context.getBean("realTimeSmsListener");
			batchSendSmsListener= (BatchSendSmsListener) context.getBean("batchSendSmsListener");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * 监听MQ的消息
	 * 
	 * @author zhangjh 新增日期：2013-10-12
	 * @since smsc-gateway
	 */
	public void startMQListener(){
		try {
			realTimeSmsListener.run();
			batchSendSmsListener.run();
		} catch (JMSException e) {
			e.printStackTrace();
		}
	}
	public PropertiesConfig getSmsProperties() {
		return smsProperties;
	}

	public BatchSendSmsListener getBatchSendSmsListener() {
		return batchSendSmsListener;
	}

	public RealTimeSmsListener getRealTimeSmsListener() {
		return realTimeSmsListener;
	}
}
