package com.unicom.mms.mm7;

import org.apache.log4j.Logger;

import com.cmcc.mm7.vasp.conf.MM7Config;
import com.cmcc.mm7.vasp.message.MM7DeliverReq;
import com.cmcc.mm7.vasp.message.MM7DeliveryReportReq;
import com.cmcc.mm7.vasp.message.MM7ReadReplyReq;
import com.cmcc.mm7.vasp.message.MM7VASPRes;
import com.cmcc.mm7.vasp.service.MM7Receiver;

public class MmsReceiver extends MM7Receiver{
	private static Logger logger = Logger.getLogger(MmsReceiver.class);
	
	public MmsReceiver(){
		MM7Config Config = new MM7Config(MmsReceiver.class.getResource("/mm7Config.xml").getFile());
		Config.setConnConfigName(MmsReceiver.class.getResource("/ConnConfig.xml").getFile());
		this.setConfig(Config);
		this.start();
		for (;;) {
			try {
				Thread.sleep(5);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public MM7VASPRes doDeliver(MM7DeliverReq mm7DeliverReq) {
		logger.info("doDeliver:"+mm7DeliverReq.toString());
		return super.doDeliver(mm7DeliverReq);
	}

	@Override
	public MM7VASPRes doDeliveryReport(MM7DeliveryReportReq mm7DeliveryReportReq) {
		logger.info("doDeliveryReport:"+mm7DeliveryReportReq.toString());
		return super.doDeliveryReport(mm7DeliveryReportReq);
	}

	@Override
	public MM7VASPRes doReadReply(MM7ReadReplyReq mm7ReadReplyReq) {
		logger.info("doReadReply:"+mm7ReadReplyReq.toString());
		return super.doReadReply(mm7ReadReplyReq);
	}
	
	
}
