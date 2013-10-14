package SUMM;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class Driver {

	public static void main(String[] args) throws Exception 
	  {
		    Configuration _conf = new Configuration();
		    
		    Job job = new Job(_conf, "word count");
		    job.setJarByClass(Driver.class);
		    FileInputFormat.addInputPath(job, new Path(args[0]));
		    FileOutputFormat.setOutputPath(job, new Path(args[1]));
		    job.setMapperClass(SumMaps.class);
		    job.setReducerClass(SumReduce.class);
		    job.setOutputKeyClass(Text.class);
		    job.setOutputValueClass(IntWritable.class);
		    System.exit(job.waitForCompletion(true) ? 0 : 1);
		  }
}
