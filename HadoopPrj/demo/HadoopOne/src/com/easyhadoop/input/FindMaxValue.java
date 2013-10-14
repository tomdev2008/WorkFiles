package com.easyhadoop.input;

import java.io.IOException;
import java.util.Iterator;


import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.ArrayWritable;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;

public class FindMaxValue {

	public static class FindMaxValueMapper extends
			Mapper<IntWritable, ArrayWritable, IntWritable, FloatWritable> {

		private final static IntWritable one = new IntWritable(1);

		// private PrintWriter file=null;
		public void map(IntWritable key, ArrayWritable value, Context context)
				throws IOException, InterruptedException {
			//把输入数据转换成list，并找出最大的
			FloatWritable[] floatArray = (FloatWritable[]) value.toArray();
			float maxfloat = floatArray[0].get();
			float tmp;
			for (int i = 1; i < floatArray.length; i++) {
				tmp = floatArray[i].get();
				if (tmp > maxfloat) {
					maxfloat = tmp;
				}
			}
			/*
			 * if(file==null) 
			 * { file=new PrintWriter("stackfile"); } 
			 * Throwable th=new Throwable(); 
			 * th.printStackTrace(file); 
			 * Thread.dumpStack();
			 */
			context.write(one, new FloatWritable(maxfloat));
		}
	}

	public static  class FindMaxValueReducer extends Reducer<IntWritable, FloatWritable, Text, FloatWritable> {
		 public void reduce(IntWritable key, Iterable<FloatWritable> values, 
                 Context context
                 ) throws IOException, InterruptedException {
			 Iterator it = values.iterator();
			 float maxfloat=0, tmp;
			 //获得第一个值
			 if(it.hasNext())
				 maxfloat = ((FloatWritable)(it.next())).get();
			 else
			 {
				 context.write(new Text("Max float value: "), null);
				 return;
			 }
			 //System.out.print(maxfloat + " ");
			 //找出最大的值
			 while(it.hasNext())
			 {
				 tmp = ((FloatWritable)(it.next())).get();
				 //System.out.print(tmp + " ");
				 if (tmp > maxfloat) {
					 maxfloat = tmp;
				 }
			 }
			 context.write(new Text("Max float value: "), new FloatWritable(maxfloat));
		 }
		
	}

	/**
	 * @param args
	 * @throws Exception 
	 * @throws IOException 
	 */
	public static void main(String[] args) throws Exception  {
		// TODO Auto-generated method stub
		Configuration conf = new Configuration();

		String[] paths = { "111", "output1" };
		String[] otherArgs = new GenericOptionsParser(conf, paths)
				.getRemainingArgs();
		// String[] otherArgs = new GenericOptionsParser(conf,
		// args).getRemainingArgs();
//		if (otherArgs.length != 2) {
//			System.err.println("Usage: FindMaxValue <NumOfValues> <OutputDir>");
//			//System.exit(2);
//		}
		
		conf.set("NumOfValues", otherArgs[0]);
		conf.set("hadoop.job.ugi", "hadoop,hadoop123");
		conf.set("mapred.system.dir",
				"/home/hadoop/HadoopHome/tmp/hadoop-hadoop/mapred/system/");
		Job job = new Job(conf, "FindMaxValue");
		// job.setNumReduceTasks(2);

		job.setJarByClass(FindMaxValue.class);
		job.setMapperClass(FindMaxValueMapper.class);
		//job.setCombinerClass(FindMaxValueReducer.class);
		job.setReducerClass(FindMaxValueReducer.class);
		job.setMapOutputKeyClass(IntWritable.class);
		job.setMapOutputValueClass(FloatWritable.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(FloatWritable.class);
		
		job.setInputFormatClass(FindMaxValueInputFormat.class);

		FileOutputFormat.setOutputPath(job, new Path("/user/hadoop/output/"));
		System.out.println(conf.get("mapred.job.tracker"));
		System.exit(job.waitForCompletion(true) ? 0 : 1);
	}

}
