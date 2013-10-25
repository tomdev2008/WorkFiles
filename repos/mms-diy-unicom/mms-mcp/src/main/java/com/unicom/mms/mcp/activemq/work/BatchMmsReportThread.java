package com.unicom.mms.mcp.activemq.work;

import com.unicom.mms.gateway.MsgReport;

/**
 * 
 * 处理批量发送彩信的报告
 * 
 * @author zhangjh 新增日期：2013-9-27
 * @since mms-mcp
 */
public class BatchMmsReportThread implements Runnable {
	private MsgReport report;
	
	public MsgReport getReport() {
		return report;
	}
	public void setReport(MsgReport report) {
		this.report = report;
	}
	public BatchMmsReportThread(MsgReport report ){
		this.report = report;
	}
	@Override
	public void run() {
		// TODO 在这里写上业务逻辑
		System.out.println("接收到报告:"+report.toString());
		System.out.println("在这里处理报告的业务逻辑");
	}

}
