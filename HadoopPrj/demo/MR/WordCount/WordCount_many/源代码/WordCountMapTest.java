package MRDemo.WordCount_many;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mrunit.mapreduce.MapDriver;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class WordCountMapTest {

	private Mapper map;
	private MapDriver driver;
	@Before
	public void init(){
		map=new WordCountMap();
		driver=new MapDriver(map);
	}
	@Test
	public void test() throws IOException {
		String text="my name is han xiao jiao ";
		driver.withInput(null,new Text(text))
			.withOutput(new Text("my"),new IntWritable(1))
			.withOutput(new Text("name"),new IntWritable(1))
			.withOutput(new Text("is"),new IntWritable(1))
			.withOutput(new Text("han"),new IntWritable(1))
			.withOutput(new Text("xiao"),new IntWritable(1))
			.withOutput(new Text("jiao"),new IntWritable(1))
			.runTest();
			
		
	}
}
