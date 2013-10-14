package HDFSDemo.API;

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
      
    }
}