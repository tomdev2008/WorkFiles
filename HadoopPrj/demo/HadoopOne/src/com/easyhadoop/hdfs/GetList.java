package com.easyhadoop.hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.hdfs.DistributedFileSystem;
import org.apache.hadoop.hdfs.protocol.DatanodeInfo;

public class GetList {
 
	   //获取HDFS集群上所有节点名称信息
    public static void main(String[] args) throws Exception {
    	 
        Configuration conf=new Configuration();
        FileSystem fs=FileSystem.get(conf);
        DistributedFileSystem hdfs = (DistributedFileSystem)fs;
        DatanodeInfo[] dataNodeStats = hdfs.getDataNodeStats();
        for(int i=0;i<dataNodeStats.length;i++){
            System.out.println("DataNode_"+i+"_Name:"+dataNodeStats[i].getHostName());
        }
        
    	/*
    	Configuration conf1=new Configuration();
    	FileSystem system=FileSystem.get(conf1);
    	DistributedFileSystem hdfs=(DistributedFileSystem)system;
    	DatanodeInfo[] dataNodeStats=hdfs.getDataNodeStats();
    	 for(int i=0;i<dataNodeStats.length;i++){
             System.out.println("DataNode_"+i+"_Name:"+dataNodeStats[i].getHostName());
         }
    	
        Configuration conf3=new Configuration();
    	FileSystem system3=FileSystem.get(conf3);
    	DistributedFileSystem hdfse=(DistributedFileSystem)system3;
    	DatanodeInfo[] aa=hdfse.getDataNodeStats();
        for(DatanodeInfo aaa:aa)
        {
        	System.out.println(aaa.getHostName());
        }
        */
    }
}