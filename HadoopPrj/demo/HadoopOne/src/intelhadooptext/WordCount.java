package intelhadooptext;
import java.io.IOException; 
import java.util.*; 
import org.apache.hadoop.fs.Path; 
import org.apache.hadoop.io.*; 
import org.apache.hadoop.mapred.*; 

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

//import Test.MapReduce.*; //import the third-party jar 
public class WordCount {
	
	public static class WordCountMap extends Mapper<Object, Text, Text, IntWritable>{
		
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
public static class Reduce extends MapReduceBase implements 
    Reducer<Text, IntWritable, Text, IntWritable> { 
	public void reduce(Text key, Iterator<IntWritable> values, 
			OutputCollector<Text, IntWritable> output, Reporter reporter) 
	        throws IOException { 
		int sum = 0; 
		while (values.hasNext()) { 
			sum += values.next().get();
		} 
	    output.collect(key, new IntWritable(sum));
	}
}
public static void main(String[] args) throws Exception { 
	JobConf conf = new JobConf(WordCount.class); 
	conf.setJobName("wordcount"); 
	conf.setOutputKeyClass(Text.class); 
	conf.setOutputValueClass(IntWritable.class); 
	
	conf.setMapperClass(Map.class); 
	conf.setCombinerClass(Reduce.class); 
	conf.setReducerClass(Reduce.class);
	
	conf.setInputFormat(TextInputFormat.class); 
	conf.setOutputFormat(TextOutputFormat.class); 
	FileInputFormat.setInputPaths(conf, new Path(args[0])); 
	FileOutputFormat.setOutputPath(conf, new Path(args[1])); 
	JobClient.runJob(conf); 
}
	public static String run(String s){ 
		return s.toLowerCase(); 
		} 
	
}