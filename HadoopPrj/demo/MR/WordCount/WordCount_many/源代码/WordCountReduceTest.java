package MRDemo.WordCount_many;

import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mrunit.mapreduce.ReduceDriver;
import org.junit.Before;
import org.junit.Test;


@SuppressWarnings("all")
public class WordCountReduceTest {

		private Reducer reduce;
		private ReduceDriver driver;
		
		@Before
		public void init()
		{
			reduce=new WordCountReduce();
			driver =new ReduceDriver(reduce);
		}
		@Test
		public void test()
		{
			String han="handu";
			List name=new ArrayList();
			name.add(new IntWritable(1));
			name.add(new IntWritable(2));
			name.add(new IntWritable(3));
			name.add(new IntWritable(4));
			driver.withInput(new Text(han),name)
				.withOutput(new Text("handu"),new IntWritable(10))
				.runTest();
		}
		
}
