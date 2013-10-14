package acs;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Partitioner;

public class AscPartition extends Partitioner<IntWritable,IntWritable>{


	@Override
	public int getPartition(IntWritable key, IntWritable value, int arg2) {
		int max=100;
		int keys=key.get();
		int fen=max/arg2+1;
		for(int i=0;i<arg2;i++){
			if(keys<fen*i && keys>=fen*(i-1)){
				return i-1;
			}
		}
		return -1;
	}	
}
