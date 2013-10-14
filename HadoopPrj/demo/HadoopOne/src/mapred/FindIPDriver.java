package mapred;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;


public class FindIPDriver {
	
	public static void main(String[] args) throws Exception 
	  {
		    Configuration _conf = new Configuration();
		    
		    Job job = new Job(_conf, "IP");
		    job.setJarByClass(FindIPDriver.class);
		    FileInputFormat.addInputPath(job, new Path("/data/IP/a/ipp1.txt"));
		    FileInputFormat.addInputPath(job, new Path("/data/IP/b/ipp2.txt"));
		    FileOutputFormat.setOutputPath(job, new Path("/data/IP/output"));
		    job.setMapperClass(FindIPMap.class);
		    job.setReducerClass(FindIPReduce.class);
		    job.setOutputKeyClass(Text.class);
		    job.setOutputValueClass(Text.class);
		    System.exit(job.waitForCompletion(true) ? 0 : 1);
		  }
}
