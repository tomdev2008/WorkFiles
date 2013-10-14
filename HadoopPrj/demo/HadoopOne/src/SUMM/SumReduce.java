package SUMM;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Reducer.Context;

public class SumReduce extends Reducer<Text,IntWritable,Text,IntWritable>{
	
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
