package com.unicom.mms.mcp.activemq.test;

import com.unicom.mms.gateway.RealTimeSMS;
import com.unicom.mms.mcp.activemq.InitSpringBean;
import com.unicom.mms.mcp.activemq.MsgPublisher;

public class SendMSG {
	public static void main(String[] args){
		InitSpringBean initSpringBean = InitSpringBean.getSingleInstance();
		MsgPublisher msgPublisher = initSpringBean.getMsgPublisher();
		RealTimeSMS msg = new RealTimeSMS();
		msg.setChannel("Channel");
		msg.setContent("Content");
		msg.setMsgSequence("MsgSequence");
		msg.setMsgType(9);
		msg.setReceiver("Receiver");
		msg.setSender("Sender");
		try {
			msgPublisher.send(msg);
			System.out.println("发送消息:"+msg.getSender());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
