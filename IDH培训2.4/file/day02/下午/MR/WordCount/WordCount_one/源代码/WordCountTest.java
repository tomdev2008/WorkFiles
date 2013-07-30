package MRDemo.WordCount_one;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mrunit.mapreduce.MapReduceDriver;
import org.aspectj.lang.annotation.Before;
import org.junit.Test;

import MRDemo.WordCount_one.WordCount.WordCountMap;
import MRDemo.WordCount_one.WordCount.WordCountReduce;

@SuppressWarnings("all")
public class WordCountTest {

		private Mapper map;
		private Reducer reduce;
		private MapReduceDriver mapreduce;
		
      
		@Test
		public void text()
		{
			map=new WordCountMap();
			reduce=new WordCountReduce();
			mapreduce=new MapReduceDriver(map,reduce);
			
			String name="aa bb cc dd ee ff ff";
			mapreduce.withInput("", new Text(name))
				.withOutput(new Text("aa"), new IntWritable(1))
				.withOutput(new Text("bb"), new IntWritable(1))
				.withOutput(new Text("cc"), new IntWritable(1))
				.withOutput(new Text("dd"), new IntWritable(1))
				.withOutput(new Text("ee"), new IntWritable(1))
				.withOutput(new Text("ff"), new IntWritable(2))
				.runTest();
		}
}
