package com.easyhadoop.hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class GetLTime {
 
    public static void main(String[] args) throws Exception {
    	
        Configuration conf=new Configuration();
        FileSystem hdfs=FileSystem.get(conf);
        Path fpath =new Path("/TestDir/ko");
        FileStatus fileStatus=hdfs.getFileStatus(fpath);
        long modiTime=fileStatus.getModificationTime();
        System.out.println("file1.txt的修改时间是"+modiTime);
        /*
        Configuration conf1=new Configuration();
        FileSystem system=FileSystem.get(conf1);
        Path path=new Path("/TestDir/test");
        FileStatus status=system.getFileStatus(path);
        long moditime=status.getModificationTime();
        System.out.print("qweqwqweqweq"+moditime);
        
    	
    	Configuration conf2=new Configuration();
    	FileSystem system2=FileSystem.get(conf2);
    	Path path2=new Path("/TestDir/haha");
    	FileStatus filestatus=system2.getFileStatus(path2);
    	long moditime2=filestatus.getModificationTime();
    	System.out.print("haha    "+moditime2);
    	
        Configuration conf4=new Configuration();
    	FileSystem system4=FileSystem.get(conf4);
    	Path path4=new Path("/TestFile/haha");
    	FileStatus filestatus4=system4.getFileStatus(path4);
    	long moditime4=filestatus4.getModificationTime();
    	System.out.print("haha    "+moditime4);
    	*/
    }
}