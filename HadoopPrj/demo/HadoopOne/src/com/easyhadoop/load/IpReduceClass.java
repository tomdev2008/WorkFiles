package com.easyhadoop.load;

import java.io.IOException;

import org.apache.hadoop.mapreduce.Reducer;


public class IpReduceClass extends
			Reducer<IpKey, LogValue, IpKey, LogValue> {
		public void reduce(IpKey key, Iterable<LogValue> values,
				Context context) throws IOException, InterruptedException {
	
			LogValue  logValue = new LogValue();
			long flow = 0;
			long counter = 0;
			for (LogValue value : values) {
				flow +=value.getFlow();
				counter+=value.getCounter();
				//container.add(logValue);
			}
			logValue.setFlow(flow);
			logValue.setCounter(counter);
			context.write(key, logValue);
		}
	}