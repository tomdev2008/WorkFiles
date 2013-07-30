

import java.io.IOException;  
import java.util.StringTokenizer;  

import org.apache.hadoop.io.IntWritable;  
import org.apache.hadoop.io.LongWritable;  
import org.apache.hadoop.io.Text;  
import org.apache.hadoop.mapred.MapReduceBase;  
import org.apache.hadoop.mapred.Mapper;  
import org.apache.hadoop.mapred.OutputCollector;  
import org.apache.hadoop.mapred.Reporter;  

public class WordCountMapper extends MapReduceBase implements  
Mapper<LongWritable, Text, Text, IntWritable> {  

	private IntWritable one = new IntWritable(1);  

	@Override  
	public void map(LongWritable key, Text value,  
			OutputCollector<Text, IntWritable> output, Reporter reporter)  
					throws IOException {  
		//StringTokenizer 就是一个用来拆字符串的,默认是/t/n/f/r,也可自定义  
		StringTokenizer st = new StringTokenizer(value.toString());  
		Text text = new Text();  
		while (st.hasMoreTokens()) {  
			text.set(st.nextToken());  
			//把每个单词以1记数  
			output.collect(text, one);  
		}  

	}   
}  
