package com.easyhadoop.hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class Rename{
    public static void main(String[] args) throws Exception {
    	
        Configuration conf=new Configuration();
        FileSystem hdfs=FileSystem.get(conf);
        Path frpaht=new Path("/TestDir");    //旧的文件名
        Path topath=new Path("/Test");    //新的文件名
        boolean isRename=hdfs.rename(frpaht, topath);
        String result=isRename?"成功":"失败";
        System.out.println("文件重命名结果为："+result);
       
    	/*
    	Configuration conf1=new Configuration();
    	FileSystem system=FileSystem.get(conf1);
    	Path Bpath=new Path("/Test");
    	Path Apath=new Path("/TestFile");
    	boolean bool=system.rename(Bpath, Apath);
    	if (bool)
    	{
    		System.out.print("从命名成功！");
    	}
    	else
    	{
    		System.out.print("从命名失败！");
    	}
    	
        Configuration conf3=new Configuration();
    	FileSystem system3=FileSystem.get(conf3);
    	Path Bpath3=new Path("/Test");
    	Path Apath3=new Path("/TestFile");
    	boolean bool3=system3.rename(Bpath3, Apath3);
    	if (bool3)
    	{
    		System.out.print("从命名成功！");
    	}
    	else
    	{
    		System.out.print("从命名失败！");
    	}
        */
        
        
        
    }
}