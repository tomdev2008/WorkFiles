package com.unicom.mms.pushjob.multhread;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.unicom.mms.common.contant.BusinessUtil;
import com.unicom.mms.pushjob.model.SendQueueModel;
import com.unicom.mms.pushjob.model.ShareThreadModel;

/**
 * 
* 功能描述:读线程
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-12
* @author chenliang 修改日期：2013-9-12
* @since mms-task
 */
public class PushReadThread extends Thread {

	private static final Logger LOGGER = LoggerFactory.getLogger(PushReadThread.class);
	private ShareThreadModel shareModel;
	
	public PushReadThread(ShareThreadModel shareThreadModel) {
		LOGGER.info("创建读线程....");
		this.shareModel = shareThreadModel;
	}

	/**
	 * 
	* 方法用途和描述: 批量读取需要发送的号码,保存到待发表中
	* @author chenliang 新增日期：2013-9-16
	* @since mms-task
	 */
	public void runRead(){
		PreparedStatement pre = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select a.mdn as reciverMdn as reciverMdn,c.content as sendContents ");
		sql.append(" from tb_push_mdn a,tb_mdn_type b,tb_polic c ");
		sql.append(" where a.mdn_type_id = b.id ");
		sql.append(" and b.id = c.mdn_type_id ");
		sql.append(" and c.id = ? ");
		try {
			pre = shareModel.conn.prepareStatement(sql.toString());
			pre.setLong(1, shareModel.jobId);
			rs = pre.executeQuery();
			while (rs.next()) {
				SendQueueModel sendQueueModel = new SendQueueModel();
				sendQueueModel.setReciverMdn(rs.getString("reciverMdn"));
				sendQueueModel.setMmsType(BusinessUtil.TYPE_SMS);
				sendQueueModel.setSendContents(rs.getString("sendContents"));
				int index = shareModel.readC.getAndIncrement();
				shareModel.readQueue.put(sendQueueModel);
				LOGGER.debug(" ReadThread0===== " + index + " : " + sendQueueModel.toString() + "(" + shareModel.readQueue.size() + ")" );
			}
			LOGGER.info("短信读取完成...");
		} catch (Exception e) {
			LOGGER.error("selectMdn Execption-",e);
		} finally {
			try {
				if( null != pre ){
					pre.close();
				}
				if( rs != null){
					rs.close();
				}
			} catch (SQLException e) {
				LOGGER.error("pstm closeEcecption-",e);
			}
		}
	}

	
	@Override
	public void run() {
		try {
			runRead();
			LOGGER.info("PushReadQueue->写入结束锁,销毁读线程");
			shareModel.readQueue.put(shareModel.exitRead);
		} catch (Exception e) {
			LOGGER.error("ReadThread Execption-",e);
		}
	}
}
