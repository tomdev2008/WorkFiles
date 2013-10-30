package com.unicom.mms.mcp.service;


import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.constants.SharePublicContants;
import com.unicom.mms.entity.TbSendMmsQueue;
import com.unicom.mms.entity.TbSendedMmsRecs;
import com.unicom.mms.gateway.MsgReport;
import com.unicom.mms.gateway.PostcardMMS;
import com.unicom.mms.mcp.dao.SendMmsRecsDAO;

@Service("sendMmsRecsService")
public class SendMmsRecsService {
	
	private static final Logger LOGGER = Logger.getLogger(SendMmsRecsService.class);
	
	@Autowired(required = true)
	private SendMmsRecsDAO sendMmsRecsDAO;
	@Autowired(required = true)
	private SendMmsQueueService sendMmsQueueService;
	
	/**
	 * 
	* 方法用途和描述: 实施发送彩信，返回状态报告处理
	* @author chenliang 新增日期：2013-10-25
	* @since mms-mcp
	 */
	public void saveWork(MsgReport report) throws Exception{
		try {
			PostcardMMS postcardMms = (PostcardMMS) report.getReq();
			//根据消息id查询待发送表中对应的消息内容
			TbSendMmsQueue sendMmsQueue = sendMmsQueueService.findByField("transationId", postcardMms.getMsgSn());

			if(null != sendMmsQueue){
				//把待发表中的数据保存到已发表中
				TbSendedMmsRecs sendedMmsRecs = new TbSendedMmsRecs();
				sendedMmsRecs.setChannel(sendMmsQueue.getChannel()); //渠道
				sendedMmsRecs.setCreateTime(new Date()); //创建时间
				sendedMmsRecs.setJobId(sendedMmsRecs.getJobId()); //任务id
				sendedMmsRecs.setMsgBody(sendMmsQueue.getMsgBody()); //消息内容
				sendedMmsRecs.setMsgStatus(report.getResult()); //消息结果
				sendedMmsRecs.setMusicUrl(sendMmsQueue.getMusicUrl()); //音乐地址
				sendedMmsRecs.setPicUrl(sendMmsQueue.getPicUrl()); //图片地址
				sendedMmsRecs.setReciver(sendMmsQueue.getReciver()); //接收人
				sendedMmsRecs.setSendLevel(sendMmsQueue.getSendLevel()); //等级
				sendedMmsRecs.setSendTime(report.getReciveTime()); //发送时间
				sendedMmsRecs.setSponsor(sendMmsQueue.getSponsor()); //发起人
				sendedMmsRecs.setTitle(sendMmsQueue.getTitle()); //标题
				sendedMmsRecs.setTransationId(sendMmsQueue.getTransationId()); //消息id
				sendedMmsRecs.setbSuccess(SharePublicContants.MSGSTATUS_SENDING); //发送状态
				sendMmsRecsDAO.save(sendedMmsRecs);
				
				//删除待发表中的数据
				sendMmsQueueService.deleteByEntity(sendMmsQueue);
			}else{
				LOGGER.info("彩信待发表中没有该消息id的数据，请核查msgSn["+report.getMessageID()+"]");
			}
			LOGGER.info("SendMmsReport work Success.");
		} catch (Exception e) {
			LOGGER.error("SendMmsReport Exception.",e);
			throw e;
		}
	}

	/**
	 * 
	* 方法用途和描述: 群发彩信，返回状态报告处理
	* @param report
	* @author chenliang 新增日期：2013-10-25
	 * @throws Exception 
	* @since mms-mcp
	 */
	public void batchWork(MsgReport report) throws Exception {
		try {
			
		} catch (Exception e) {
			LOGGER.error("BatchMmsReport Exception.",e);
			throw e;
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 更新彩信已发表中的状态
	* @param report
	* @author chenliang 新增日期：2013-10-28
	 * @throws Exception 
	* @since mms-mcp
	 */
	public void updateMmsRecsStates(MsgReport report) throws Exception {
		try {
			PostcardMMS postcardMms = (PostcardMMS) report.getReq();
			TbSendedMmsRecs sendedMmsRecs = sendMmsRecsDAO.findByField("transationId", postcardMms.getMsgSn());
			if(null != sendedMmsRecs){
				sendedMmsRecs.setMsgReport(report.getResult());
				sendedMmsRecs.setbSuccess(SharePublicContants.MSGSTATUS_SUCCESS);
				sendMmsRecsDAO.merge(sendedMmsRecs);
			}else{
				LOGGER.info("彩信已发表中没有消息id["+postcardMms.getMsgSn()+"]的数据.");
			}
		} catch (Exception e) {
			LOGGER.error("更新用户收到消息状态报告异常.",e);
			throw e;
		}
	}
}
