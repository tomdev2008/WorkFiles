package Sum;

import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Mapper.Context;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import SUMM.Driver;

public class Sum {
	
	
	public static class SumMap extends Mapper<Object, Text, Text, IntWritable>{
		private Text allsum=new Text();
		private IntWritable number=new IntWritable();
		//private Text keys=new Text("sum");
		public void map(Object key, Text value, Context context) throws IOException, InterruptedException 
	    {
		StringTokenizer tokenzer=new StringTokenizer(value.toString().trim());
		while(tokenzer.hasMoreTokens()){
			number.set(Integer.parseInt(tokenzer.nextToken()));
			allsum.set(key.toString());
			context.write(allsum, number);
			
			//context.write(keys, number);
		}
	    }

}
	
	public static class SumReduce extends Reducer<Text,IntWritable,Text,IntWritable>{
		
		private IntWritable Sum=new IntWritable();
		public void reduce(Text key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException 
		   {
			int Sume=0;
			for(IntWritable aa:values)
			{
				Sume=Sume+aa.get();
			}
			Sum.set(Sume);
			context.write(key, Sum);
		   }
	}
	
	
	public static void main(String[] args) throws Exception 
	  {
		    Configuration _conf = new Configuration();
		    
		    Job job = new Job(_conf, "sum");
		    job.setJarByClass(Driver.class);
		    FileInputFormat.addInputPath(job, new Path(args[0]));
		    FileOutputFormat.setOutputPath(job, new Path(args[1]));
		    job.setMapperClass(SumMap.class);
		    job.setReducerClass(SumReduce.class);
		    job.setOutputKeyClass(Text.class);
		    job.setOutputValueClass(IntWritable.class);
		    System.exit(job.waitForCompletion(true) ? 0 : 1);
		  }
	
	
	
}

