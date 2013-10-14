package SUMM;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mrunit.mapreduce.MapDriver;
import org.junit.Before;
import org.junit.Test;


@SuppressWarnings("all")
public class SumMapTest {
	private Mapper map;
	private MapDriver mdriver;
	
	@Before
	public void aa()
	{
		map=new SumMaps();
		mdriver=new MapDriver(map);
	}
	@Test
	public void Text() throws IOException
	{
		String str="1 2 3 4 5 6";
		
		mdriver.withInput(" ",new Text(str))
		.withOutput(new Text(" "),new IntWritable(1))
		.withOutput(new Text(" "),new IntWritable(2))
		.withOutput(new Text(" "),new IntWritable(3))
		.withOutput(new Text(" "),new IntWritable(4))
		.withOutput(new Text(" "),new IntWritable(5))
		.withOutput(new Text(" "),new IntWritable(6))
		.runTest();
	}
}

