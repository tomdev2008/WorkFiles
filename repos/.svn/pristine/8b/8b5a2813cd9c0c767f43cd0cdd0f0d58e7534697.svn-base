package com.unicom.mms.pushjob.model;

import java.sql.Connection;
import java.util.Date;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicInteger;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.unicom.mms.entity.TbSendMmsQueue;
import com.unicom.mms.entity.TbSendedMmsRecs;

/**
 * 
 * 功能描述:共享对象 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-12
 * @author chenliang 修改日期：2013-9-12
 * @since mms-task
 */
public class ShareThreadModel {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ShareThreadModel.class);

	// 消费线程数
	public int iThread;
	// 程序启动时间
	public long startThread = 0;
	// 定义的总线程数
	public int maxmumPoolSize = Runtime.getRuntime().availableProcessors() * 5 + 2;
	// 主线程
	public final ExecutorService mainExec = Executors.newFixedThreadPool(maxmumPoolSize);
	// 待发送的阻塞队列
	public final BlockingQueue<SendQueueModel> readQueue = new LinkedBlockingQueue<SendQueueModel>(10);
	// 保存结果的阻塞队列
	public final BlockingQueue<JobSendRecsModel> saveResultQueue = new LinkedBlockingQueue<JobSendRecsModel>(10);
	// 完成读请求标记
	public final SendQueueModel exitRead = new SendQueueModel();
	// 完成保存结果标记
	public final JobSendRecsModel exitSave = new JobSendRecsModel();
	// 读个数
	public final AtomicInteger readC = new AtomicInteger();
	// 写个数
	public final AtomicInteger writeC = new AtomicInteger();
	// 发个数
	public final AtomicInteger sendC = new AtomicInteger();
	// 共用数据连接
	public Connection conn = null;
//	// 程序运行标记 ,true:运行中,false:运行结束
//	public boolean runFlag = false;
	// 待发送短信的总数
	public int iTotalCount = 0;
	// 成功发送数
	public int iSuccessCount = 0;
	public int tempSuccessCount = 0;
	// 失败发送数
	public int iFailedCount = 0;
	// 日发送数
	public int iDaySendCount = 0;
	// 剩下数
	public int iLastCount = 0;
//	// 最大发送数,超过则停止线程工作
//	public int iMaxSend = 0;
	// 任务id
	public long jobId = 0;
	// 临时对象锁
	public static final Object tempLock = new Object();
	// 保存点,每隔50个用户保存一次
	public int controlSaveCount = 0;
	// 批量发送线程个数,标记为0代表批量发送完毕
	public int iBatch = 0;

	public static ShareThreadModel instace;

	public static final ShareThreadModel getInstance() {
		if (null == instace) {
			instace = new ShareThreadModel();
		}
		return instace;
	}
	
	public ShareThreadModel() {
		try {
//			conn = MyBatisUtil.getSession().getConnection();
			LOGGER.info("创建数据库连接成功...");
		} catch (Exception e) {
			LOGGER.error("创建数据库连接异常....",e);
		}
	}

//	public void setiMaxSend(int iMaxSend) {
//		this.iMaxSend = iMaxSend;
//	}

	public long getJobId() {
		return jobId;
	}

	public void setJobId(long jobId) {
		this.jobId = jobId;
	}

//	public boolean isRunFlag() {
//		return runFlag;
//	}
//
//	public void setRunFlag(boolean runFlag) {
//		this.runFlag = runFlag;
//	}
}
