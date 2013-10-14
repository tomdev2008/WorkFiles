package acs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.compress.CompressionCodec;
import org.apache.hadoop.io.compress.GzipCodec;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;

public class AscDirver {
	 //Drive 
	  public static void main(String[] args) throws Exception 
	  {
		    Configuration _conf = new Configuration();
		    //_conf.setBoolean("mapred.output.compress",true);
		    //_conf.setClass("mapred.output.compression.codec",GzipCodec.class,CompressionCodec.class);
		    String[] otherArgs = new GenericOptionsParser(_conf, args).getRemainingArgs();
		    if (otherArgs.length != 2) 
		    {
		      System.err.println("Usage: wordcount <in> <out>");
		      System.exit(2);
		    }
		    Job job = new Job(_conf, "word count");
		    job.setJarByClass(AscDirver.class);
		    FileInputFormat.addInputPath(job, new Path(otherArgs[0]));
		    FileOutputFormat.setOutputPath(job, new Path(otherArgs[1]));
		    job.setMapperClass(AscMap.class);
		    job.setNumReduceTasks(5);
		    job.setReducerClass(AscReduce.class);
		    job.setOutputKeyClass(Text.class);
		    job.setOutputValueClass(IntWritable.class);
		    System.exit(job.waitForCompletion(true) ? 0 : 1);
		  }
 
}
