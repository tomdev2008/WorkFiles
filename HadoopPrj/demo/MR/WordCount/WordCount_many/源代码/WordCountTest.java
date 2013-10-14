package MRDemo.WordCount_many;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mrunit.mapreduce.MapReduceDriver;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class WordCountTest {

		private Mapper map;
		private Reducer reduce;
		private MapReduceDriver mapreduce;
		
		@Before
		public void init()
		{
			map=new WordCountMap();
			reduce=new WordCountReduce();
			mapreduce=new MapReduceDriver(map,reduce);
		}
		
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
