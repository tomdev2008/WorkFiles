package com.unicom.mms.opcanaccount.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.constants.SharePublicContants;
import com.unicom.mms.opcanaccount.dao.AccountOpenAndCancelDAO;
import com.unicom.mms.opcanaccount.model.TSendList;
import com.unicom.mms.opcanaccount.model.TSendedList;

/**
 * 
* 功能描述:开销户业务处理类
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-25
* @author chenliang 修改日期：2013-9-25
* @since mms-task
 */
@Service("accountOpenAndCancelService")
public class AccountOpenAndCancelService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AccountOpenAndCancelService.class);
	
	@Autowired(required = true)
	public AccountOpenAndCancelDAO accountOpenAndCancelDAO;
	
	/**
	 * 
	* 方法用途和描述: 扫描是否有开销户等待发送短信
	* @author chenliang 新增日期：2013-9-25
	* @since mms-task
	 */
	public void work(){
		System.out.println("work!");
		List<TSendList> sendList = selectSendList();
		if(sendList.size()>0){
			Integer[] deleteIds = new Integer[sendList.size()];
			List<TSendedList> tsendedList = new ArrayList<TSendedList>();
			for (int i = 0; i < sendList.size(); i++) {
				TSendList sendmodel = sendList.get(i);
				//调用发送短信的接口
				TSendedList resultSended = sendSMS(sendmodel);
				tsendedList.add(resultSended);
				deleteIds[i] = sendmodel.getSendId();
			}
			//以下功能移到webservice中去做
			//删除待发送表的数据
			deleteBatch(deleteIds);
			//把发送的结果保存在已发送表
			saveTSendedList(tsendedList);
		}
	}

	/**
	 * 
	* 方法用途和描述: 批量删除待发送表中的数据
	* @param deleteIds
	* @author chenliang 新增日期：2013-9-26
	* @since mms-task
	 */
	private void deleteBatch(Integer[] deleteIds) {
		for (int i = 0; i < deleteIds.length; i++) {
			deleteTsendList(deleteIds[i]);
		}
	}

	/**
	 * 
	* 方法用途和描述: 扫描tsendlist表中的待发送数据
	* @author chenliang 新增日期：2013-9-25
	* @since mms-task
	 */
	private List<TSendList> selectSendList(){
		String selectSql = " select send_id,msg_sn,user_id,ssn,msg_sendtype,send_time,msg_status,msg_body,receive_mobile " +
				" ,create_time,send_level,ussd_command_status,send_timestamp from t_send_list order by send_level";
		List lists = accountOpenAndCancelDAO.selectSendList(selectSql);
		List<TSendList> sendList = new ArrayList<TSendList>();
		Object[] objs = new Object[lists.size()];
		for (int i = 0; i < lists.size(); i++) {
			objs = (Object[]) lists.get(i);
			TSendList send = new TSendList();
			send.setSendId(((BigDecimal)objs[0]).intValue());
			send.setMsgSn(""+objs[1]);
			send.setUserId(((BigDecimal)objs[2]).intValue());
			send.setSsn(""+objs[3]);
			send.setMsgSendtype(((BigDecimal)objs[4]).intValue());
			send.setSendTime((Date)objs[5]);
			send.setMsgStatus(((BigDecimal)objs[6]).intValue());
			send.setMsgBody(""+objs[7]);
			send.setReceiveMobile(""+objs[8]);
			send.setCreateTime((Date)objs[9]);
			send.setSendLevel(((BigDecimal)objs[10]).intValue());
			send.setUusdCommandStatus(((BigDecimal)objs[11]).intValue());
			send.setSendTimestamp(((BigDecimal)objs[12]).intValue());
			sendList.add(send);
		}
		return sendList;
	}
	
	/**
	 * 
	* 方法用途和描述: 删除待发送表的数据
	* @return
	* @author chenliang 新增日期：2013-9-26
	* @since mms-task
	 */
	private void deleteTsendList(Integer id){
		String deleteSql = "delete from t_send_list where send_id = ?";
		accountOpenAndCancelDAO.deleteTsendList(deleteSql,id);
	}
	
	/**
	 * 
	* 方法用途和描述: 批量添加
	* @param sendedList
	* @author chenliang 新增日期：2013-9-26
	* @since mms-task
	 */
	private void saveTSendedList(List<TSendedList> sendedList){
		String insertSql = " insert into t_sended_list(	" +
				" send_id,msg_sn,user_id,ssn,msg_sendtype,send_time,msg_status,msg_body,receive_mobile,	" +
				" create_time,deal_time,is_del,bill_flag,send_level,send_timestamp,ussd_command_status " +
				" ) values(SEQ_TSENDED_LIST_ID.Nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		accountOpenAndCancelDAO.saveBatch(insertSql,sendedList);
	}
	
	/**
	 * 
	* 方法用途和描述: 发送短信
	* @author chenliang 新增日期：2013-9-26
	 * @return 
	* @since mms-task
	 */
	private TSendedList sendSMS(TSendList tSended){
		
		java.util.Date nowDate = new java.util.Date();
		Date now = new Date(nowDate.getTime());
		TSendedList tsendedModel = new TSendedList();
		tsendedModel.setMsgSn(tSended.getMsgSn());
		tsendedModel.setUserId(tSended.getUserId());
		tsendedModel.setSsn(tSended.getSsn());
		tsendedModel.setMsgSendtype(tSended.getMsgSendtype());
		tsendedModel.setSendTime(tSended.getSendTime());
		tsendedModel.setMsgStatus(tSended.getMsgStatus());
		tsendedModel.setMsgBody(tSended.getMsgBody());
		tsendedModel.setReceiveMobile(tSended.getReceiveMobile());
		tsendedModel.setCreateTime(now);
		tsendedModel.setDealTime(now);
		tsendedModel.setIsDel(0);
		tsendedModel.setBillFlag(1);
		tsendedModel.setSendLevel(SharePublicContants.SENDLEVEL_PRIORITY);
		tsendedModel.setSendTimestamp(1);
		tsendedModel.setUusdCommandStatus(2);
		return tsendedModel;
	}
	
}
