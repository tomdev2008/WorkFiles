package com.easyhadoop.join;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Partitioner;

public class KeyPartition extends Partitioner<TextPair, Text>{

	public int getPartition(TextPair key, Text value ,int numPartitions){		
		return (key.getText().hashCode()& Integer.MAX_VALUE) % numPartitions;    	
	}	
}
