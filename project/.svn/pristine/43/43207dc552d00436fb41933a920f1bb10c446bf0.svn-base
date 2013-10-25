package com.etrack.quartz;

import java.util.List;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.Scheduler;
import org.quartz.Trigger;

import com.etrack.base.SchedulerTemplate;

public class PrintJobList implements Job{
	private static final Logger log = Logger.getLogger(PrintJobList.class);
	@Override
	public void execute(JobExecutionContext jobCtx) throws JobExecutionException {
		try {
			Scheduler scheduler  = jobCtx.getScheduler();
			if (scheduler == null)
				return;
			
			JobDataMap dataMap = jobCtx.getJobDetail().getJobDataMap();
			String isPrint = dataMap.getString("isPrint");
			if (!isPrint.equals("true")) {
				return ;
			}
			
			SchedulerTemplate schedulerTemplate =new SchedulerTemplate(scheduler);
			List<JobDetail> list = schedulerTemplate.getJobDetails();
			for(JobDetail d :list){
				System.out.println(d.getDescription());
//				Trigger trigger = schedulerTemplate.getTrigger(triggerName, group);
				List<Trigger> triggerList = schedulerTemplate.getTriggers(d);
				for(Trigger t :triggerList){
					log.info(t.toString());
				}
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
