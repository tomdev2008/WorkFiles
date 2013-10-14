package com.easyhadoop.hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class DeleteFile {
 
    public static void main(String[] args) throws Exception {
    	 
        Configuration conf=new Configuration();
        FileSystem hdfs=FileSystem.get(conf);
        Path delef=new Path("/user/hadoop/outputsum");
        //删除一个文件（不能有子文件）
        //boolean isDeleted=hdfs.delete(delef,false);
        //递归删除
        boolean isDeleted=hdfs.delete(delef,true);
        System.out.println("Delete?"+isDeleted);
        
       /*
         //练习一
        Configuration conf1=new Configuration();
        FileSystem system=FileSystem.get(conf1);
        Path path=new Path("/user/hadoop/output7");
        boolean bool= system.delete(path,true);
        if (bool)
        {
        	System.out.print("删除成功！");
        }
        else
        {
        	System.out.print("删除失败！");
        }
        //练习二
    	Configuration conf2=new Configuration();
    	FileSystem system2=FileSystem.get(conf2);
    	Path path2=new Path("/user/hadoop/input/load");
    	//默认为true
    	boolean bool2=system2.delete(path2);
    	if (bool2)
        {
        	System.out.print("删除成功！");
        }
        else
        {
        	System.out.print("删除失败！");
        }
         //练习三
        Configuration conf3=new Configuration();
    	FileSystem system3=FileSystem.get(conf3);
    	Path path3=new Path("/user/hadoop/input/load/aa");
    	//默认为true
    	boolean bool3=system3.delete(path3,true);
    	if (bool3)
        {
        	System.out.print("删除成功！");
        }
        else
        {
        	System.out.print("删除失败！");
        }
       
        Configuration conf4=new Configuration();
    	FileSystem system4=FileSystem.get(conf4);
    	Path path4=new Path("/TestDir");
    	//默认为true
    	boolean bool4=system4.delete(path4);
    	if (bool4)
        {
        	System.out.print("删除成功！");
        }
        else
        {
        	System.out.print("删除失败！");
        }*/
    }
}
 