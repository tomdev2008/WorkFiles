package com.unicom.mms.mcp.service;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.constants.SharePublicContants;
import com.unicom.mms.entity.TbSendSmsQueue;
import com.unicom.mms.entity.TbSendedMmsRecs;
import com.unicom.mms.entity.TbSendedSmsRecs;
import com.unicom.mms.gateway.MsgReport;
import com.unicom.mms.gateway.PostcardMMS;
import com.unicom.mms.gateway.RealTimeSMS;
import com.unicom.mms.mcp.dao.SendSmsRecsDAO;


@Service("sendSmsRecsService")
public class SendSmsRecsService {
	
	private static final Logger LOGGER = Logger.getLogger(SendSmsRecsService.class);
	
	@Autowired(required = true)
	private SendSmsRecsDAO sendSmsRecsDAO;
	@Autowired(required = true)
	private SendSmsQueueService sendSmsQueueService;
	
	/**
	 * 
	* 方法用途和描述: 把实施发送短信的消息体保存到短信已发送表
	* @param msg
	* @author chenliang 新增日期：2013-10-25
	* @since mms-mcp
	 */
	public void save(RealTimeSMS msg) throws Exception{
		try {
			TbSendedSmsRecs sendedSmsRecs = new TbSendedSmsRecs();
			Integer channel = Integer.parseInt(msg.getChannel());
			sendedSmsRecs.setChannel(channel); //渠道
			sendedSmsRecs.setCreateTime(new Date()); //创建时间
			sendedSmsRecs.setMsgBody(msg.getContent()); //消息内容
			sendedSmsRecs.setReceiveMobile(msg.getReceiver()); //接收号码
			sendedSmsRecs.setSendLevel(SharePublicContants.SENDLEVEL_PRIORITY); //发送等级
			sendedSmsRecs.setSponsor(msg.getSender()); //发送人
			sendedSmsRecs.setMsgSn(msg.getMsgSn()); //消息id
			sendSmsRecsDAO.save(sendedSmsRecs);
		} catch (Exception e) {
			LOGGER.error("save sendSmsRecs Exception.",e);
			throw e;
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 实时发送短信
	* @param report
	* @author chenliang 新增日期：2013-10-25
	 * @throws Exception 
	* @since mms-mcp
	 */
	public void saveWork(MsgReport report) throws Exception{
		try {
			RealTimeSMS realTimeSms = (RealTimeSMS) report.getReq();
			//根据消息id查询待发送表中的短信内容
			TbSendSmsQueue sendSmsQueue = sendSmsQueueService.findByMsgSn(realTimeSms.getMsgSn());

			//把待发表中的内容保存到已发表中
			TbSendedSmsRecs smsRecs = new TbSendedSmsRecs();
			smsRecs.setChannel(sendSmsQueue.getChannel());
			smsRecs.setCreateTime(new Date());
			smsRecs.setJobId(sendSmsQueue.getJobId());
			smsRecs.setMsgBody(sendSmsQueue.getMsgBody());
			smsRecs.setMsgSn(sendSmsQueue.getMsgSn());
			smsRecs.setMsgStatus(report.getResult());
			smsRecs.setReceiveMobile(sendSmsQueue.getReceiveMobile());
			smsRecs.setSendLevel(sendSmsQueue.getSendLevel());
			smsRecs.setSendTime(report.getReciveTime());
			smsRecs.setSponsor(sendSmsQueue.getSponsor());
			sendSmsRecsDAO.save(smsRecs);
			
			//删除待发表中的数据
			sendSmsQueueService.deleteById(sendSmsQueue);
			LOGGER.info("RealtimeSmsReport run Success.");
		} catch (Exception e) {
			LOGGER.error("保存状态报告错误.",e);
			throw e;
		}
	}

	/**
	 * 
	* 方法用途和描述: 批量发送彩信，消息报告处理
	* @param report
	* @throws Exception
	* @author chenliang 新增日期：2013-10-25
	* @since mms-mcp
	 */
	public void batchWork(MsgReport report) throws Exception {
		try {
			//
		} catch (Exception e) {
			LOGGER.error("BatchSmsReprot Exception.",e);
			throw e;
		}
	}

	/**
	 * 
	* 方法用途和描述: 更新已发表中的状态
	* @param report
	* @author chenliang 新增日期：2013-10-28
	 * @throws Exception 
	* @since mms-mcp
	 */
	public void updateSmsStates(MsgReport report) throws Exception {
		try {
			RealTimeSMS smsEntity = (RealTimeSMS) report.getReq();
			TbSendedSmsRecs smsRecs = sendSmsRecsDAO.findByField("transationId", smsEntity.getMsgSn());
			if(null != smsRecs){
				smsRecs.setMsgReport(report.getResult());
				sendSmsRecsDAO.merge(smsRecs);
			}else{
				LOGGER.info("短信已发表中没有消息id["+smsEntity.getMsgSn()+"]的数据.");
			}
		} catch (Exception e) {
			LOGGER.error("更新用户收到消息状态报告异常.",e);
			throw e;
		}
	}
	
}
