package com.unicom.mms.mcp.activemq.work;

import org.apache.log4j.Logger;

import com.unicom.mms.constants.SharePublicContants;
import com.unicom.mms.gateway.MsgReport;
import com.unicom.mms.mcp.activemq.InitSpringBean;
import com.unicom.mms.mcp.service.SendSmsRecsService;

/**
 * 
 * 处理批量发送短信的报告
 * 
 * @author zhangjh 新增日期：2013-9-27
 * @since mms-mcp
 */
public class BatchSmsReportThread  implements Runnable  {
	
	private static final Logger LOGGER = Logger.getLogger(BatchSmsReportThread.class);
	
	private MsgReport report;
	
	public MsgReport getReport() {
		return report;
	}
	public void setReport(MsgReport report) {
		this.report = report;
	}
	public BatchSmsReportThread(MsgReport report ){
		this.report = report;
	}
	@Override
	public void run() {
		LOGGER.info("BatchSmsRecs begin.");
		try {
			SendSmsRecsService sendSmsRecsService = InitSpringBean.sendSmsRecsService;
			if(SharePublicContants.MSGREPORT_USER == report.getReportType()){ //用户收到消息报告
				sendSmsRecsService.batchWork(report);
				LOGGER.info("用户收到消息报告处理成功.");
			}else{ //网关收到消息报告
				LOGGER.info("网关收到消息报告.");
			}
		} catch (Exception e) {
			LOGGER.error("BatchSmsReportThread Exception.",e);
		}
		LOGGER.info("BatchSmsRecs Success.");
	}

}