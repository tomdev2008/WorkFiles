package MRDemo.WordCount_many;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Mapper.Context;



public class WordCountMap extends Mapper<Object, Text, Text, IntWritable>{
	
	   private static IntWritable value_=new IntWritable(1);
	   private static Text _key=new Text();
	   public void map(Object key, Text value, Context context) throws IOException, InterruptedException 
	   {
		StringTokenizer _value=new StringTokenizer(value.toString().trim());
		while(_value.hasMoreTokens())
		{
			_key.set(_value.nextToken().trim());
			context.write(_key, value_);
		}
	   }
}
