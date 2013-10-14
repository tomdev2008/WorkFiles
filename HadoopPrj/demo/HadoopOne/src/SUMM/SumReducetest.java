package SUMM;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mrunit.mapreduce.MapDriver;
import org.apache.hadoop.mrunit.mapreduce.ReduceDriver;
import org.hsqldb.lib.MD5;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class SumReducetest {
	private Reducer reduce;
	private ReduceDriver rdriver;
	
	@Before
	public void aa()
	{
		reduce=new SumReduce();
		rdriver=new ReduceDriver(reduce);
	}
	@Test
	public void Text() throws IOException
	{
		List list=new ArrayList();
		list.add(new IntWritable(10));
		list.add(new IntWritable(10));
		rdriver.withInput(new Text("0"), list)
			.withOutput(new Text("0"),new IntWritable(20))
			.runTest();
		
	}
}
