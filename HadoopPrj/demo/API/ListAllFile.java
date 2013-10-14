package HDFSDemo.API;

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
 
    }
}