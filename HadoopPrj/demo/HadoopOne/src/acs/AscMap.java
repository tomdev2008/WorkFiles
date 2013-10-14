package acs;

import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class AscMap extends Mapper<Object, Text, IntWritable, IntWritable>{
	
	   private static IntWritable value_=new IntWritable();
	   private static IntWritable one=new IntWritable(1);
	   public void map(Object key, Text value, Context context) throws IOException, InterruptedException 
	   {
		String _value=value.toString();
		value_.set(Integer.parseInt(_value));
			context.write(value_ , one);
		
	   }
}
