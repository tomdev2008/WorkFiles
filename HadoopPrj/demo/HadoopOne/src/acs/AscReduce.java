package acs;

import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Reducer.Context;


public class AscReduce extends  Reducer<IntWritable,IntWritable,IntWritable,IntWritable> {
	   private static IntWritable _li=new IntWritable(1);
	   public void reduce(IntWritable key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException 
	   {
		   for(IntWritable value : values)
		   {
			   context.write(_li,key);
			   _li=new IntWritable(_li.get()+1);
		   } 
	   }
}
