package HDFSDemo.API;

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
       
  
        
        
    }
}