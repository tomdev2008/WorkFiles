package SUMM;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mrunit.mapreduce.MapDriver;
import org.apache.hadoop.mrunit.mapreduce.MapReduceDriver;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class DriverTest {
	private Mapper map;
	private Reducer reduce;
	private MapReduceDriver mrdriver;
	
	@Before
	public void aa()
	{
		map=new SumMaps();
		reduce=new SumReduce();
		mrdriver=new MapReduceDriver(map,reduce);
	}
	@Test
	public void Text() throws IOException
	{
		String str="1 2";
		
		mrdriver.withInput("0",new Text(str))
		.withOutput(new Text("0"),new IntWritable(3))
		.runTest();
	}
}

