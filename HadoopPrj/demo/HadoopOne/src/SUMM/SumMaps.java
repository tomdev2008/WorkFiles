package SUMM;

import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class SumMaps extends Mapper<Object, Text, Text, IntWritable>{
		private Text allsum=new Text();
		private IntWritable number=new IntWritable();
		public void map(Object key, Text value, Context context) throws IOException, InterruptedException 
	    {
		StringTokenizer tokenzer=new StringTokenizer(value.toString().trim());
		while(tokenzer.hasMoreTokens()){
			number.set(Integer.parseInt(tokenzer.nextToken()));
			allsum.set(key.toString());
			context.write(allsum, number);
		}
	    }

}
