package com.easyhadoop.hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class ListAllFile {
	//读取HDFS某个目录下的所有文件
    public static void main(String[] args) throws Exception {
    	 
        Configuration conf=new Configuration();
        FileSystem hdfs=FileSystem.get(conf);
        Path listf =new Path("/user");
        FileStatus stats[]=hdfs.listStatus(listf);
        for(int i = 0; i < stats.length; ++i)
            System.out.println(stats[i].getPath().toString());
        hdfs.close();
      /*
        Configuration conf1=new Configuration();
        FileSystem system=FileSystem.get(conf1);
        Path path =new Path("/user/hadoop");
        FileStatus filestatus[]=system.listStatus(path);
        for(int i = 0; i < filestatus.length; ++i)
            System.out.println(filestatus[i].getPath().toString());
        system.close();
        
        
        Configuration conf3=new Configuration();
        FileSystem system3=FileSystem.get(conf3);
        Path path3 =new Path("/user/hadoop");
        FileStatus filestatus[]=system3.listStatus(path3);
        for(FileStatus status:filestatus)
            System.out.println(status.toString());
        system3.close();
         
    	Configuration conf4=new Configuration();
        FileSystem system4=FileSystem.get(conf4);
        Path path4 =new Path("/user/hadoop");
        FileStatus list4[]=system4.listStatus(path4);
        for(FileStatus one: list4)
        	System.out.println(one.toString());
        system4.close();
        */
    }
}