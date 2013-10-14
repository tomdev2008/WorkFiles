package com.easyhadoop.join;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;


public class JoinMain {
	
	 public static void main(String[] args) throws Exception {
		    Configuration conf = new Configuration();
//		    String[] otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();
//		    if (otherArgs.length != 3) {
//		      System.err.println("Usage: <tradeTableDir> <payTableDir> <output>");
//		      System.exit(2);
//		    }
//		    String tradeTableDir = args[0]; 
//		    String payTableDir = args[1];
//		    String joinTableDir = args[2];
		    Job job = new Job(conf, "Join");
		    job.setJarByClass(JoinMain.class);
		    job.setMapperClass(PreMapper.class);
		    
		    job.setMapOutputKeyClass(TextPair.class);
		    job.setPartitionerClass(KeyPartition.class);
		    job.setGroupingComparatorClass(FirstComparator.class);
		    
		    job.setOutputKeyClass(Text.class); 
		    job.setOutputValueClass(Text.class);
		    
		    job.setReducerClass(CommonReduce.class);
		    FileInputFormat.addInputPath(job, new Path("/user/hadoop/input/load3/action.txt"));
		    FileInputFormat.addInputPath(job, new Path("/user/hadoop/input/load3/alipay.txt"));
		    FileOutputFormat.setOutputPath(job, new Path("/user/hadoop/output3/"));
		    System.exit(job.waitForCompletion(true) ? 0 : 1);
		  }

}
