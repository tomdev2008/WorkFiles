package com.easyhadoop.load;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.util.StringUtils;


/**
 * IpMapClass
 * @author Jay Liu
 * 娌′簲鍒嗛挓ip鐨勬祦閲??
 */
public  class IpMapClass extends
			Mapper<Object, Text, IpKey, LogValue> {
		private final static Long one = new Long(1);  
		private IpKey ipKey = new IpKey();
		private LogValue logValue   = new LogValue();
		public void map(Object key, Text value, Context context)
				throws IOException, InterruptedException {
		
			
			String line = value.toString();
			if (line == null || line.equals(""))
				return;
			String[] splits = StringUtils.split(line, " ",8);
		   	if (splits == null || splits.length < 8)
				return;
		   	String customerId = splits[0];
		   	String clientIp = splits[3];
			if (clientIp.equals("-") || clientIp.equals("127.0.0.1")) {
				return;
			}
			String flow = splits[5];
			if("-".equals(flow))
				return;
			long recbytes = Long.parseLong(flow);
			
			long endTime;
			try {
				endTime = Long.parseLong(splits[1]);//1325354045056
			} catch (NumberFormatException e) {
				return;
			}
			if (endTime > System.currentTimeMillis()) {
				return;
			}

			long endTimeByFiveMinute = (endTime / 300000) * 300000;
			
			String dateTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date(endTimeByFiveMinute));
		    
			ipKey.setCustomerId(customerId);
			ipKey.setDateTime(dateTime);
			ipKey.setIp(clientIp);
			  
			  logValue.setFlow(recbytes);
			  logValue.setCounter(one);
			//以对象作为参数
			context.write(ipKey, logValue); 
		}
}