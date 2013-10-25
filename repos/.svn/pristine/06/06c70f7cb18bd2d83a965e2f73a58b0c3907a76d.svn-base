package com.unicom.mms.demo.model;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicInteger;

import org.apache.log4j.Logger;

/**
 * 
 * 共享对象
 * 
 * @author zhangjh 新增日期：2013-6-28
 * @since mms-task
 */
public class ShareThreadModel {
	/**
	 * 消费线程数
	 */
	public int iThread = 0;
	/**
	 * 程序启动时间
	 */
	public long startTime = 0;
	/**
	 * 定义的总线程数
	 */
	public int maximumPoolSize = Runtime.getRuntime().availableProcessors()*5+2;
	/**
	 * 主线程
	 */
	public final ExecutorService exec = Executors.newFixedThreadPool(maximumPoolSize);
	/**
	 * 待请求的阻塞队列
	 */
	public final BlockingQueue<ReadModel> queue = new LinkedBlockingQueue<ReadModel>(10);
	/**
	 * 完成标记
	 */
	public final ReadModel exitQueue = new ReadModel();
	/**
	 * 读个数
	 */
	public final AtomicInteger rc = new AtomicInteger();
	/**
	 * 写个数
	 */
	public final AtomicInteger wc = new AtomicInteger();
	/**
	 * 发个数
	 */
	public final AtomicInteger sc = new AtomicInteger();
	/**
	 * 记录最后一个用户的有效回复时间
	 */
	public Date endReplyTime = null;
	/**
	 * 共用数据库连接
	 */
	public Connection conn = null;
	/**
	 * 运行程序标记,true:进行中 false:结束
	 */
	public boolean runFlag = false;
	/**
	 * 待发送短信的总数
	 */
	public int iTotalCount = 0;
	/**
	 * 成功发送数
	 */
	public int iSuccesdCount = 0;
	public int tmpSuccesdCount = 0;
	/**
	 * 失败发送数
	 */
	public int iFaildCount = 0;
	/**
	 * 日发送量
	 */
	public int iDaySendCount = 0;
	/**
	 * 剩下数
	 */
	public int iLastCount = 0;
	/**
	 * 最大发送数，超过则停止线程工作
	 */
	public int iMaxSend = 0;
	/**
	 * 外部重置，可发送歌曲数
	 */
	public int songNum = 0;
	/**
	 * 短信分拆的长度
	 */
	public int smsLength = 160;
	/**
	 * 任务实例ID
	 */
	public long jobInstanceId = 0;
	/**
	 * 回复日期
	 */
	public int replyDay = 0;
	/**
	 * 临时对象锁
	 */
	public static final Object TmpLock = new Object();
	/**
	 * 保存点,每隔50个用户保存一次
	 */
	public int controlSaveCount=0;
	/**
	 * 任务ID
	 */
	public long jobId = 0;
	/**
	 * true:还有批量发送的铃音,false:没有可批量发送的号码
	 */
	public boolean isBatch = false;
	/**
	 * 批量发送线程个数,标记为0代表批量发送完毕
	 */
	public int iBatch = 0;
	/**
	 * 批量发送的次数
	 */
	public List ringList = new ArrayList();
	/**
	 * 批量发送的次数,与ringList.size()代表已经发送完
	 */
	public int iRingList = 0;
	@SuppressWarnings("unchecked")
	/**
	 * 保存结果的队列
	 */
	public final BlockingQueue<SaveModel> result = new LinkedBlockingQueue<SaveModel>();
	/**
	 * 完成保存结果标记
	 */
	public final SaveModel exitSave = new SaveModel();
	public void setiMaxSend(int iMaxSend) {
		this.iMaxSend = iMaxSend;
	}
	public void setReplyDay(int replyDay) {
		this.replyDay = replyDay;
	}
	public long getJobInstanceId() {
		return jobInstanceId;
	}
	public void setJobInstanceId(long jobInstanceId) {
		this.jobInstanceId = jobInstanceId;
	}
	private static ShareThreadModel instance;
	
	public void setSongNum(int songNum) {
		this.songNum = songNum;
	}
	public static Logger log = Logger.getLogger(ShareThreadModel.class);

	
	public ShareThreadModel() {
		try {
//			conn =  MyBatisUtil.getSession().getConnection();
//			if (conn == null) {
//				conn = MyBatisUtil.getSession().getConnection();
//			}
			log.info("创建数据库连接成功");
		} catch (Exception e) {
			log.error("SmsQueue get Connection error:", e);
		}
	}
	
	public static ShareThreadModel getSingletonInstance() {
		if (instance == null) {
			instance = new ShareThreadModel();
		}
		return instance;
	}
	
	
	public boolean isRunFlag() {
		return runFlag;
	}
	public void setRunFlag(boolean runFlag) {
		this.runFlag = runFlag;
	}
	
	
}
