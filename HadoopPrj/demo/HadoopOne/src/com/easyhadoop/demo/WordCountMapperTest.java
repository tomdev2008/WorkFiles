package com.easyhadoop.demo;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mrunit.mapreduce.MapDriver;
import org.junit.Before;
import org.junit.Test;

@SuppressWarnings("all")
public class WordCountMapperTest {

	private Mapper mapper;
	private MapDriver driver;

	@Before
	public void init() {
		mapper = new Wordcount.TokenizerMapper();
		driver = new MapDriver(mapper);
	}

	@Test
	
	public void test() throws IOException {
		String line = "renren is a great website of SNS";
		driver.withInput(null, new Text(line))
		        .withOutput(new Text("renren"), new IntWritable(1))
				.withOutput(new Text("is"), new IntWritable(1))
		        .withOutput(new Text("a"), new IntWritable(1))
				.withOutput(new Text("great"), new IntWritable(1))
				.withOutput(new Text("website"), new IntWritable(1))
				.withOutput(new Text("of"), new IntWritable(1))
				.withOutput(new Text("SNS"), new IntWritable(1))
				.runTest();
	}
}