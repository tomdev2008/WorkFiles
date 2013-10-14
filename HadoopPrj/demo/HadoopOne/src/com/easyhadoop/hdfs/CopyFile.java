package com.easyhadoop.hdfs;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class CopyFile {
    public static void main(String[] args) throws Exception {
        Configuration conf=new Configuration();
        FileSystem hdfs=FileSystem.get(conf);
        //本地文件
        Path src =new Path("D:\file");
        //HDFS为止
        Path dst =new Path("/");
        hdfs.copyFromLocalFile(src, dst);
        System.out.println("Upload to"+conf.get("fs.default.name"));
        FileStatus files[]=hdfs.listStatus(dst);
        for(FileStatus file:files){
            System.out.println(file.getPath());
        }
        /*
         //练习一
        Configuration conf1=new Configuration();
        FileSystem system=FileSystem.get(conf1);
        Path pathy=new Path("D:\\asd");
        Path pathm=new Path("/");
        system.copyToLocalFile(pathy, pathm);
        System.out.println("Upload to "+conf1.get("fs.default.name"));
        FileStatus Listfile[]=system.listStatus(pathm);
        for(FileStatus file:Listfile)
        {
        	System.out.println(file.getPath());
        }
        //练习二   
        Configuration conf2=new Configuration();
        FileSystem system2=FileSystem.get(conf2);
        //本地文件目录
        Path pathyuan=new Path("D:\\qweqwe");
        //目标路径
        Path pathmu=new Path("/");
        system2.copyToLocalFile(pathyuan, pathmu);
        System.out.println("Upload to "+conf2.get("fs.default.name"));
        FileStatus listfile2[]=system2.listStatus(pathmu);
        for(FileStatus file:listfile2)
        {
        	System.out.println(file.getPath());
        }
        
        //练习三
        Configuration conf3=new Configuration();
        FileSystem system3=FileSystem.get(conf3);
        Path path1=new Path("/user/hadoop");
        Path path2=new Path("/");
        system3.copyFromLocalFile(path1, path2);
        FileStatus status[]=system3.listStatus(path2);
        for(FileStatus statu :status)
        {
        	System.out.print(statu.getPath());
        }
        
        Configuration conf4=new Configuration();
        FileSystem hdfs4=FileSystem.get(conf4);
        //本地文件
        Path src4=new Path("D:\file");
        //HDFS为止
        Path dst4 =new Path("/");
        hdfs4.copyFromLocalFile(src4, dst4);
        FileStatus files4[]=hdfs4.listStatus(dst4);
        for(FileStatus file:files4){
            System.out.println(file.getPath());
        }
        
        */
    }
}