package ResumeProcessing;
import java.io.IOException; 
import java.util.*; 

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path; 
import org.apache.hadoop.io.*; 
import org.apache.hadoop.mapred.*; 
import java.util.StringTokenizer;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Reducer.Context;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

//import Test.MapReduce.*; //import the third-party jar 
public class asd {
	
public static class Map extends  Mapper<Object, Text, IntWritable, Text> { 
	private static IntWritable _key=new IntWritable();
	public void map(Object key, Text value, Context context) throws IOException, InterruptedException 
	   {
		    _key.set(Integer.parseInt(key.toString()));
			context.write(_key, value);
	   }
} 
public static class Reduce extends Reducer<IntWritable,Text,IntWritable,Text> { 
	
	 public void reduce(IntWritable key, Iterable<Text> values, Context context) throws IOException, InterruptedException 
	   {
		   for(Text value : values)
		   {
			   context.write(key, value);
		   }
		  
	   }
}
public static void main(String[] args) throws Exception 
{
	    Configuration _conf = new Configuration();
	    Job job = new Job(_conf, "asd");
	    job.setJarByClass(asd.class);
	    FileInputFormat.addInputPath(job, new Path(args[0]));
	    FileOutputFormat.setOutputPath(job, new Path(args[1]));
	    job.setMapperClass(Map.class);
	    job.setReducerClass(Reduce.class);
	    job.setOutputKeyClass(Text.class);
	    job.setOutputValueClass(IntWritable.class);
	    System.exit(job.waitForCompletion(true) ? 0 : 1);
}
	
}