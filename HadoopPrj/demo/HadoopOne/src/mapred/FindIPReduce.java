package mapred;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Reducer.Context;

public class FindIPReduce extends Reducer<Text,Text,Text,Text>{
	
	public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException 
	   {
		int Sume=0;
		for(Text Date:values)
		{
			context.write(key, Date);
		}
	   }
}
