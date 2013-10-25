package com.etrack.quartz;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.etrack.concurrent.RunTask;


public class OrderQueryJob implements Job{

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		RunTask.start();
	}

}
