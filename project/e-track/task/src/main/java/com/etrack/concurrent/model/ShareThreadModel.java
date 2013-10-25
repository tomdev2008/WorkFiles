package com.etrack.concurrent.model;

import java.sql.Connection;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicInteger;

import org.apache.log4j.Logger;

import com.etrack.base.MyBatisUtil;
import com.etrack.mybatis.model.OrderTracking;
import com.etrack.mybatis.model.Orders;
import com.etrack.service.ChannelService;
import com.etrack.service.OrderTrackingService;
import com.etrack.service.OrdersService;


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
	public final BlockingQueue<Orders> queue = new LinkedBlockingQueue<Orders>(10);
	/**
	 * 完成标记
	 */
	public final Orders exitQueue = new Orders();
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
	 * 共用数据库连接
	 */
	public Connection conn = null;
	/**
	 * 运行程序标记,true:进行中 false:结束
	 */
	public boolean runFlag = false;
	/**
	 * 待发送的总数
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
	 * 剩下数
	 */
	public int iLastCount = 0;
	/**
	 * 临时对象锁
	 */
	public static final Object TmpLock = new Object();
	/**
	 * 保存点,每隔50个用户保存一次
	 */
	public int controlSaveCount=50;
	
	/**
	 * 保存结果的队列
	 */
	@SuppressWarnings("unchecked")
	public final BlockingQueue<OrderTracking> result = new LinkedBlockingQueue<OrderTracking>();
	/**
	 * 完成保存结果标记
	 */
	public final OrderTracking exitSave = new OrderTracking();
	
	private static ShareThreadModel instance;
	
	public OrdersService ordersService = OrdersService.getSingleInstance();
	public OrderTrackingService orderTrackingService = OrderTrackingService.getSingleInstance();
	public ChannelService channelService = ChannelService.getSingleInstance();
	public static Logger log = Logger.getLogger(ShareThreadModel.class);

	
	public ShareThreadModel() {
		try {
			conn =  MyBatisUtil.getSession().getConnection();
			if (conn == null) {
				conn = MyBatisUtil.getSession().getConnection();
			}
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
