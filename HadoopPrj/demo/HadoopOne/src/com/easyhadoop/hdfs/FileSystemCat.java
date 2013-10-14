package com.easyhadoop.hdfs;

import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;

public class FileSystemCat {
 /**
  * @param args
  */
 /**
  * @param args
  * @throws Exception
  */
 public static void main(String[] args) throws Exception {
  // TODO Auto-generated method stub
	 
       String uri="/user/hadoop/input/xinxi.txt";//args[0];
       Configuration conf=new Configuration();
       FileSystem fs=FileSystem.get(URI.create(uri),conf);
       FSDataInputStream in=null;
       try{
        in=fs.open(new Path(uri));
        System.out.println("the first print:");
        IOUtils.copyBytes(in,System.out, 4096, false);
        in.seek(0);//可以重新定位文件的pos，因为是读取，但是如果写DFS上的文件的时候只能读取pos，不能更改Pos，因为hadoop只运行顺序的追加数据。
        System.out.println("the second print:");
        IOUtils.copyBytes(in,System.out,4096,false);
       }finally{
        IOUtils.closeStream(in);
       }
      /*
       String ui="/TestDir/haha";
       Configuration conf1=new Configuration();
       FileSystem system=FileSystem.get(URI.create(ui), conf1);
       FSDataInputStream inputstream=null;
       try
       {
    	   inputstream=system.open(new Path(ui));
    	   IOUtils.copyBytes(inputstream, System.out,4096,false);
    	   inputstream.seek(2);
    	   IOUtils.copyBytes(inputstream, System.out,4096,false);
       }
       finally
       {
    	   IOUtils.closeStream(inputstream);
       }
        
       String url="/TestDir/haha";
       Configuration conf2=new Configuration();
       FileSystem system2=FileSystem.get(URI.create(url), conf2);
       FSDataInputStream InputStream=null;
       try
       {
    	   InputStream=system2.open(new Path(url));
    	   IOUtils.copyBytes(InputStream, System.out, 4096, false);
    	   InputStream.seek(0);
    	   IOUtils.copyBytes(InputStream, System.out, 4096, true);
       }
       finally
       {}
       
       String url3="/TestDir/haha";
       Path path3=new Path("/TestDir/ko");
       Configuration conf3=new Configuration();
       FileSystem system3=FileSystem.get(URI.create(url3), conf3);
       FSDataInputStream InputStream=null;
       try
       {
    	   InputStream=system3.open(path3);
    	   InputStream=system3.open(new Path(url3));
    	   IOUtils.copyBytes(InputStream, System.out, 4096, false);
       }
       finally
       {
    	   IOUtils.closeStream(InputStream);
       }
       
       
       String path4="/TestFile/ko";
       Configuration conf4=new Configuration();
       FileSystem system4=FileSystem.get(URI.create(path4), conf4);
       FSDataInputStream InputStream4=null;
       try
       {
    	   InputStream4=system4.open(new Path(path4));
    	   IOUtils.copyBytes(InputStream4, System.out, 4096, false);
       }
       finally
       {
    	   IOUtils.closeStream(InputStream4);
       }
       */
       
       
       
       
       
       
       
       
 }
}