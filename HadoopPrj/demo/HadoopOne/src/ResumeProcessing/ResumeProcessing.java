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
public class ResumeProcessing {
	
	private static Text post=new Text();
	
	private static Text information=new Text();
    private static Text name=new Text();
    private static Text sex=new Text("男");
    private static IntWritable age=new IntWritable();
    private static Text phone=new Text();
    private static Text city=new Text();
    private static Text certificate=new Text();
    private static Text work_experience=new Text();
	
public static class Map extends  Mapper<Object, Text, Text, Text> { 
    
	public void map(Object key, Text value, Context context) throws IOException, InterruptedException 
	   {
		String line = value.toString(); 
		if(line.contains("智联招聘"))
		{
			int postm=line.indexOf("智联招聘");
			//截取到应聘的职位
			post.set(line.substring(5, postm));
			context.write(post, sex);
		}
	   }
} 
public static class Reduce extends Reducer<Text,Text,Text,Text> { 
	
	 public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException 
	   {
		   int sum=0;
		   for(Text value : values)
		   {
			   context.write(key, value);
		   }
		  
	   }
}
public static void main(String[] args) throws Exception 
{
	    Configuration _conf = new Configuration();
	    Job job = new Job(_conf, "Resume_processing");
	    job.setJarByClass(ResumeProcessing.class);
	    FileInputFormat.addInputPath(job, new Path(args[0]));
	    FileOutputFormat.setOutputPath(job, new Path(args[1]));
	    job.setMapperClass(Map.class);
	    job.setReducerClass(Reduce.class);
	    job.setOutputKeyClass(Text.class);
	    job.setOutputValueClass(IntWritable.class);
	    System.exit(job.waitForCompletion(true) ? 0 : 1);
}
	
}