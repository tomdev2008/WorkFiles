package com.easyhadoop.join;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;

public class PreMapper extends Mapper<Object, Text, TextPair, Text> {

	public void map(Object key, Text value, Context context)
			throws IOException, InterruptedException {

		FileSplit fileSplit = (FileSplit) context.getInputSplit();
		String path = fileSplit.getPath().toString();
		
		String[] line = value.toString().split("\"");
		if (line.length < 2) {
			// skip bad value return;
			return;
		}
		TextPair kr = new TextPair();
		String productID = line[0];
		kr.setText(productID);
		// set product ID;
		Text kv = new Text();
		if (path.indexOf("action") >= 0) {
			// trade table
			kr.setID(0);
			// 用于TextPair的排序
			String tradeID = line[1];
			kv.set(tradeID);
			// value is tradeID
		} else if (path.indexOf("alipay") >= 0) {
			// pay table 
			kr.setID(1);
			// 用于TextPair的排序
			String payID = line[1];
			kv.set(payID);
			// value is payID }
		}
		context.write(kr, kv);
	}
}
