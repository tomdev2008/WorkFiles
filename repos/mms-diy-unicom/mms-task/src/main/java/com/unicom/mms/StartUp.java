package com.unicom.mms;

import org.quartz.Scheduler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 
* 功能描述:任务引擎入口
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-12
* @author chenliang 修改日期：2013-9-12
* @since mms-task
 */
public class StartUp {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(StartUp.class);
	private static ApplicationContext springContext = null;
	public static StartUp instance = null;
	private static Scheduler scheduler = null; 

	public static ApplicationContext springContext (){
		return springContext;
	}
	
	public static Scheduler scheduler (){
		return scheduler;
	}

	public StartUp(){
		if(instance == null){
			LOGGER.info("读取application配置文件,对象注入...");
			springContext = new ClassPathXmlApplicationContext(new String[]{"modules/applicationContext.xml","modules/applicationContext-quartz.xml"});
		}
		scheduler = (Scheduler) springContext.getBean("schedulerFactory");
	}
	
	/**
	 * 方法用途和描述: 
	 * @param args
	 * @author chenliang 新增日期：2013-9-12
	 * @since mms-task
	 */
	public static void main(String[] args) {
		LOGGER.info("===================Start Scheduler!================");
		new StartUp();
	}
	
}
