package com.unicom.mms.activemq.client;

import com.unicom.mms.InitInstance;
import com.unicom.mms.gateway.PostcardMMS;

public class SendPostcard {
	public static void main(String[] args) throws Exception {
		InitInstance initInstance = InitInstance.getInstance();
		PostcardMMS req = new PostcardMMS();
		req.setMusicPath("http://127.0.0.1/resources/systemData/Music/cat.amr");
		req.setImagePath("http://127.0.0.1/resources/userData/2013-10/1382776942400.gif");
		req.setReceiver("15580898198");
		req.setSender("15580898198");
		req.setSubject("smil测试");
		req.setMsgType(3);
		req.setProductCode("3174201001");
		initInstance.msgPublisher.run();
		initInstance.msgPublisher.send(req);
	}
}
