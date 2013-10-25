package com.etrack.base;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.quartz.Calendar;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerMetaData;
import org.quartz.Trigger;
import org.quartz.TriggerKey;
import org.quartz.impl.matchers.GroupMatcher;
import org.quartz.spi.OperableTrigger;

public class SchedulerTemplate {
	protected Scheduler scheduler;

	public SchedulerTemplate(Scheduler scheduler) {
		this.scheduler = scheduler;
	}

	public void setScheduler(Scheduler scheduler) {
		this.scheduler = scheduler;
	}

	public Scheduler getScheduler() {
		return scheduler;
	}

	public List<String> getCalendarNames() {
		try {
			return scheduler.getCalendarNames();
		} catch (SchedulerException e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean isShutdown() {
		try {
			return scheduler.isShutdown();
		} catch (SchedulerException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean isInStandbyMode() {
		try {
			return scheduler.isInStandbyMode();
		} catch (SchedulerException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean isStarted() {
		try {
			return scheduler.isStarted();
		} catch (SchedulerException e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<JobExecutionContext> getCurrentlyExecutingJobs() {
		try {
			List<JobExecutionContext> result = new ArrayList<JobExecutionContext>();
			List<?> jobs = scheduler.getCurrentlyExecutingJobs();
			for (Object job : jobs) {
				JobExecutionContext jobec = (JobExecutionContext) job;
				result.add(jobec);
			}
			return result;
		} catch (SchedulerException e) {
			e.printStackTrace();
			return null;
		}
	}

	public SchedulerMetaData getSchedulerMetaData() {
		try {
			return scheduler.getMetaData();
		} catch (SchedulerException e) {
			e.printStackTrace();
			return null;
		}
	}

	/** Get all the JobDetails in the scheduler. */
	public List<JobDetail> getJobDetails() {
		try {
			List<JobDetail> jobs = new ArrayList<JobDetail>();
			List<String> groups = scheduler.getJobGroupNames();
			for (String group : groups) {
				Set<JobKey> keys = scheduler.getJobKeys(GroupMatcher
						.jobGroupEquals(group));
				for (JobKey key : keys) {
					JobDetail jobDetail = scheduler.getJobDetail(key);
					jobs.add(jobDetail);
				}
			}
			return jobs;
		} catch (SchedulerException e) {
			e.printStackTrace();
			return null;
		}
	}

	/** Get all the triggers in the scheduler. */
	public List<Trigger> getTriggers(JobDetail jobDetail) {
		try {
			List<Trigger> triggers = (List<Trigger>)scheduler.getTriggersOfJob(jobDetail.getKey());
			return triggers;
		} catch (SchedulerException e) {
			e.printStackTrace();
			return null;
		}
	}

	public JobDetail getJobDetail(String jobName, String group) {
		try {
			JobKey key = JobKey.jobKey(jobName, group);
			return scheduler.getJobDetail(key);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Trigger getTrigger(String triggerName, String group) {
		try {
			TriggerKey key = TriggerKey.triggerKey(triggerName, group);
			return scheduler.getTrigger(key);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Calendar getCalendar(String calName) {
		try {
			return scheduler.getCalendar(calName);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * Get a list of next fire time dates up to maxCount time. If next fire time
	 * needed before maxCount, then there should be a null object in the last
	 * element of the list.
	 */
	public List<Date> getNextFireTimes(Trigger trigger, Date startTime,
			int maxCount) {
		// We will clone the original trigger so we may call its triggered() to
		// get a proper fireTime.
		OperableTrigger clonedTrigger = (OperableTrigger) ((OperableTrigger) trigger)
				.clone();
		Calendar cal = null;

		if (clonedTrigger.getNextFireTime() == null) {
			clonedTrigger.computeFirstFireTime(cal);
		}

		List<Date> list = new ArrayList<Date>();
		Date nextDate = startTime;
		int count = 0;
		while (count++ < maxCount) {
			nextDate = clonedTrigger.getFireTimeAfter(nextDate);
			if (nextDate == null)
				break;
			list.add(nextDate);
			clonedTrigger.triggered(cal);
		}
		return list;
	}

	/**
	 * Get a list of next fire time dates up to maxCount time. If next fire time
	 * needed before maxCount, then there should be a null object in the last
	 * element of the list.
	 */
	public List<Date> getNextFireTimesWithCalendar(Trigger trigger,
			Date startTime, int maxCount) {
		List<Date> dates = getNextFireTimes(trigger, startTime, maxCount);
		String calName = trigger.getCalendarName();
		if (calName == null) {
			return dates;
		}

		// Else check if dates has excluded by calendar or not.
		Calendar cal = getCalendar(calName);
		List<Date> result = new ArrayList<Date>();
		for (Date dt : dates) {
			if (cal.isTimeIncluded(dt.getTime())) {
				result.add(dt);
			}
		}
		return result;
	}

	/** Update existing job with newJobDetail and return the old one. */
	public JobDetail updateJobDetail(JobDetail newJobDetail) {
		try {
			JobDetail oldJob = scheduler.getJobDetail(newJobDetail.getKey());
			scheduler.addJob(newJobDetail, true);
			return oldJob;
		} catch (SchedulerException e) {
			e.printStackTrace();
			return null;
		}
	}

	/** Update existing trigger with newTrigger and return the old one. */
	public Trigger updateTrigger(Trigger newTrigger) {
		try {
			Trigger oldTrigger = scheduler.getTrigger(newTrigger.getKey());
			scheduler.rescheduleJob(oldTrigger.getKey(), newTrigger);
			return oldTrigger;
		} catch (SchedulerException e) {
			e.printStackTrace();
			return null;
		}
	}

	/** Add a JobDetail with a trigger schedule when to fire. */
	public Date scheduleJob(JobDetail jobDetail, Trigger trigger) {
		try {
			Date nextFireTime = scheduler.scheduleJob(jobDetail, trigger);
			return nextFireTime;
		} catch (SchedulerException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * Schedule new trigger to an existing JobDetail. You need to set
	 * "trigger.setJobName()".
	 */
	public void scheduleJob(Trigger trigger) {
		try {
			scheduler.scheduleJob(trigger);
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}

	/** Remove a trigger and its JobDetail if it's not set durable. */
	public Trigger uncheduleJob(String triggerName, String triggerGroup) {
		try {
			Trigger trigger = scheduler.getTrigger(TriggerKey.triggerKey(
					triggerName, triggerGroup));
			boolean success = scheduler.unscheduleJob(trigger.getKey());
			if (!success)
				throw new SchedulerException(
						"Failed to unschedule job. Trigger name=" + triggerName
								+ ", group=" + triggerGroup);
			return trigger;
		} catch (SchedulerException e) {
			e.printStackTrace();
			return null;
		}
	}

	public void addJob(JobDetail job, boolean replace) {
		try {
			scheduler.addJob(job, replace);
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}

	/** Remove a JobDetail and all the triggers associated with it. */
	public List<? extends Trigger> deleteJob(String jobName, String group) {
		try {
			JobKey key = JobKey.jobKey(jobName, group);
			List<? extends Trigger> triggers = scheduler.getTriggersOfJob(key);
			boolean success = scheduler.deleteJob(key);
			if (!success)
				throw new SchedulerException("Unable to delete job " + key);
			return triggers;
		} catch (SchedulerException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * Run a job immediately with a non-volatile trigger (remove as soon as it's
	 * finished.)
	 */
	public void runJobNow(String name, String group) {
		try {
			JobKey key = JobKey.jobKey(name, group);
			scheduler.triggerJob(key);
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}

	public String getSchedulerName() {
		try {
			return scheduler.getSchedulerName();
		} catch (SchedulerException e) {
			e.printStackTrace();
			return null;
		}
	}

	public String getSchedulerInstanceId() {
		try {
			return scheduler.getSchedulerInstanceId();
		} catch (SchedulerException e) {
			e.printStackTrace();
			return null;
		}
	}

	public String getSchedulerNameAndId() {
		return getSchedulerName() + "_$_" + getSchedulerInstanceId();
	}

	@Override
	public String toString() {
		return "QuartzScheduler[" + getSchedulerNameAndId() + "]";
	}
}
