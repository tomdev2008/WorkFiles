package com.etrack;

import org.apache.log4j.Logger;
import org.quartz.Scheduler;
import org.quartz.impl.StdSchedulerFactory;

public class MainService {
	private static final Logger log = Logger.getLogger(MainService.class);
	public static void main(String[] args){
		try{
			log.info("========================Quartz Startting...=========================");
			Scheduler sched = new StdSchedulerFactory().getScheduler();
			sched.start();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
}
