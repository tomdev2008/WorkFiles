package MRDemo.WordCount_one;

import java.io.IOException;
import java.util.*;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;

import MRDemo.WordCount_many.WordCountDriver;

public class WordCount {

	public static class WordCountMap extends
			Mapper<Object, Text, Text, IntWritable> {

		private static IntWritable value_ = new IntWritable(1);
		private static Text _key = new Text();

		public void map(Object key, Text value, Context context)
				throws IOException, InterruptedException {
			StringTokenizer _value = new StringTokenizer(value.toString()
					.trim());
			while (_value.hasMoreTokens()) {
				_key.set(_value.nextToken().trim());
				context.write(_key, value_);
			}
		}
	}

	public static class WordCountReduce extends
			Reducer<Text, IntWritable, Text, IntWritable> {
		private static IntWritable _sum = new IntWritable();

		public void reduce(Text key, Iterable<IntWritable> values,
				Context context) throws IOException, InterruptedException {
			int sum = 0;
			for (IntWritable value : values) {
				sum += value.get();
			}
			_sum.set(sum);
			context.write(key, _sum);
		}
	}

	public static void main(String[] args) throws Exception {
		Configuration _conf = new Configuration();
		//压缩
		// _conf.setBoolean("mapred.output.compress",true);
		// _conf.setClass("mapred.output.compression.codec",GzipCodec.class,CompressionCodec.class);
		//设置reduce个数
		// job.setNumReduceTasks(5);
		 
		Job job = new Job(_conf, "MyHadoopJob");
		job.setJarByClass(WordCount.class);//这个类必须为当前所在类
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);
		job.setMapperClass(WordCountMap.class);
		job.setReducerClass(WordCountReduce.class);
		FileInputFormat.addInputPath(job, new Path(args[0]));// 输入路径
		FileOutputFormat.setOutputPath(job, new Path(args[1]));// 输出路径
		System.exit(job.waitForCompletion(true) ? 0 : 1);
	}

}