package com.easyhadoop.hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.BlockLocation;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class FileLoc {
	//查找某个文件在HDFS集群的位置
    public static void main(String[] args) throws Exception {
    	
        Configuration conf=new Configuration();
        FileSystem hdfs=FileSystem.get(conf);
        Path fpath=new Path("/user/hadoop");
        FileStatus filestatus = hdfs.getFileStatus(fpath);
        BlockLocation[] blkLocations = hdfs.getFileBlockLocations(filestatus, 0, filestatus.getLen());
        int blockLen = blkLocations.length;
        for(int i=0;i<blockLen;i++){
            String[] hosts = blkLocations[i].getHosts();
            System.out.println("block_"+i+"_location:"+hosts[0]);
        }
        
        /*
        Configuration conf1=new Configuration();
        FileSystem system=FileSystem.get(conf1);
        Path path=new Path("/user/hadoop/input/wordcount/a.txt");
        FileStatus filestatue=system.getFileStatus(path);
        BlockLocation[] blklc=system.getFileBlockLocations(filestatue, 0, filestatue.getLen());
        int intt=blklc.length;
        for(int i=0;i<intt;i++)
        {
        	String[] hosts=blklc[i].getHosts();
        	System.out.println("block_"+i+"_location:"+hosts[0]);
        }
        
        Configuration conf2=new Configuration();
        FileSystem system2=FileSystem.get(conf2);
        Path path2=new Path("/user/hadoop/input/wordcount/a.txt");
        FileStatus filestatue2=system2.getFileStatus(path2);
        BlockLocation[] blklc2=system2.getFileBlockLocations(filestatue2, 0, filestatue2.getLen());
        int intt=blklc2.length;
        for(int i=0;i<intt;i++)
        {
        	String[] hosts=blklc2[i].getHosts();
        	System.out.println("block_"+i+"_location:"+hosts[0]);
        }
        
        
    	 Configuration conf4=new Configuration();
         FileSystem system4=FileSystem.get(conf4);
         Path path4=new Path("/user/hadoop/input/wordcount/a.txt");
         FileStatus filestatue4=system4.getFileStatus(path4);
         BlockLocation[] blklc4=system4.getFileBlockLocations(filestatue4, 0, filestatue4.getLen());
         int intt=blklc4.length;
         for(int i=0;i<intt;i++)
         {
         	String[] hosts=blklc4[i].getHosts();
         	System.out.println("block_"+i+"_location:"+hosts[0]);
         	System.out.print(filestatue4);
         }
        */
    }
}