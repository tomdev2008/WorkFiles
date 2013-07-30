package com.kxcomm.client;

import java.io.IOException;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.thrift.generated.Hbase;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Mapper.Context;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import com.kxcomm.hadoop.util.FileSystemUtil;
import com.kxcomm.hadoop.util.HbaseUtil;
import com.kxcomm.hadoop.util.LogBean;
import com.kxcomm.hadoop.util.LogUtil;


public class Client {
	private static final Log LOG = LogFactory.getLog(Client.class);
	private  static String hbase_table="kxcomm_gj";
	private static String hbase_clumnfamily="info";
	
	
	public static void main(String[] args) throws IOException {
		Configuration configuration=FileSystemUtil.configuration;
//		
//		if(args.length<2){
//			throw new Error("params is invalid");
//		}		
//		String src=args[0];      //存发在本地文件系统的文件
//		String dest=args[1];     //存发在HDFS文件系统的文件.
//	
		String src="E:/haha.txt";
		String dest="hdfs://192.168.1.101:8020/zbdtest/haha.txt";
		try {
			FileSystemUtil.copyLocalToHadoop(src, dest);//把网关日志传hdfs文件系统上面去。
		} catch (IOException e) {
			LOG.error("上传文件到hdfs文件系统上面");
			e.printStackTrace();
		} 
		
		
		
		if(!acquireLock()){
			throw new Error("can't get a lock on the hfds");
		}
		
		
		
		
		HbaseUtil hbaseUtil=new HbaseUtil();
		try {
			hbaseUtil.createTable(hbase_table, hbase_clumnfamily);
		} catch (IOException e1) {
			LOG.error("create tabls is bad");
			e1.printStackTrace();
		}
		
		
		Job job=null;
		try {
			job = new Job(configuration, "kxcomm_gj");
		} catch (IOException e) {
			LOG.error("生成mapreuce任务时候出错");
			e.printStackTrace();
		}
		FileSystem fs= FileSystem.get(FileSystemUtil.configuration);
		job.setNumReduceTasks(0);
		job.setJarByClass(Client.class);      
		job.setMapperClass(DataLoadMapper.class);
		job.setOutputKeyClass(NullWritable.class);
		job.setOutputValueClass(NullWritable.class);
		try {
			FileInputFormat.addInputPath(job, new Path(dest));
			Path out=new Path("output");
			if(fs.exists(out)){      //如果输出目录存在则删除
				fs.delete(out,true);			
			}
			FileOutputFormat.setOutputPath(job, out);
		} catch (IOException e) {
			LOG.error("设置map的输入路径时候出错");
			e.printStackTrace();
		}
		try {
			job.waitForCompletion(true);
		} catch (Exception e) {
			LOG.error("提交任务完成");
			e.printStackTrace();
		}	
		releaseLock();
	}
	
	private static boolean acquireLock() {
		try
		{  
			LOG.info("Trying to acquire jobclient lock...");
			Configuration configuration=FileSystemUtil.configuration;
			Path lockFile = new Path(configuration.get("hadoop.tmp.dir","/temp"),"kxcomm_gj.lck");
			FileSystem fs = FileSystemUtil.getHDFSsystem();
			fs.create(lockFile, false).close();
		}
		catch (IOException e)
		{
			LOG.error("创建文件锁出错");
			return false;
		}
		LOG.info("创建文件锁成功");
		return true;
	}

	private static boolean releaseLock() {
		try
		{
			LOG.info("Trying to release jobclient lock...");
			Configuration configuration=FileSystemUtil.configuration;
			Path lockFile = new Path(configuration.get("hadoop.tmp.dir","/temp"),"kxcomm_gj.lck");
			FileSystem fs = FileSystemUtil.getHDFSsystem();
		
			if(fs.delete(lockFile, false)) {
				LOG.info("删除文件锁成功");
				return true;
			}
			LOG.info("删除文件锁成功");
			return false;
		}
		catch (IOException e)
		{	
			LOG.info("删除文件锁成功");
			return false;
		}
		
	}
	
	 static class DataLoadMapper extends Mapper<LongWritable,Text, NullWritable, NullWritable> {
		private HbaseUtil hbaseUtil;
		private LogUtil logUtil;
		@Override
		protected void setup(Context context) throws IOException,
				InterruptedException {
			// TODO Auto-generated method stub
			super.setup(context);
			hbaseUtil=new HbaseUtil();
			logUtil=new LogUtil();
		}

		@Override
		protected void map(LongWritable key, Text value,Context context)
				throws IOException, InterruptedException {
			super.map(key, value, context);
			if(value==null)  return;
			
			String line=value.toString();
			System.out.println(line);
			String[] info=line.split(",");
			List<LogBean> lists=logUtil.parseLog(hbase_clumnfamily, line); //代码这里写死了了 需要重构
			
			if(lists==null) return ;
			
			byte[] rowkey=hbaseUtil.getRowkey(info[0], info[1]);
			
			Put put=new Put(rowkey);
			
			for(int i=0;i<lists.size();i++){
				put.add(Bytes.toBytes(lists.get(i).getFamily()),Bytes.toBytes(lists.get(i).getColumn()),
						Bytes.toBytes(lists.get(i).getValue()));
			}
			
			hbaseUtil.put(hbase_table, put);
			
		}
	}

}
