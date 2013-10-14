package com.easyhadoop.hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class CreateDir {
 
    public static void main(String[] args) throws Exception{
        Configuration conf=new Configuration();
        FileSystem hdfs=FileSystem.get(conf);
        Path dfs=new Path("/TestDir");
        boolean bool2=hdfs.mkdirs(dfs);
        if (bool2)
        {
        	System.out.println("创建成功！");
        }
        else
        {
        	System.out.println("创建失败！");
        }
        /*
        Configuration conf1=new Configuration();
        FileSystem system=FileSystem.get(conf1);
        Path path=new Path("/new path");
        boolean bool= system.mkdirs(path);
        System.out.println("是否创建成功"+bool);
        
        Configuration conf2=new Configuration();
        FileSystem system2=FileSystem.get(conf2);
        Path path2=new Path("/love");
        boolean bool2 =system2.mkdirs(path2);
          
        Configuration conf3=new Configuration();
        FileSystem system3=FileSystem.get(conf3);
        Path path3=new Path("/newpath");
        boolean bool= system3.mkdirs(path3);
      
        Configuration conf4=new Configuration();
        FileSystem system4=FileSystem.get(conf4);
        Path path4=new Path("/handu");
        boolean bool4=system4.mkdirs(path4);
        if (bool4)
        {
        	System.out.print("创建成功");
        }
        else
        {
        	System.out.print("创建失败");
        }*/
    }
}