package HDFSDemo.API;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class DeleteFile {
 
    public static void main(String[] args) throws Exception {
    	 
        Configuration conf=new Configuration();
        FileSystem hdfs=FileSystem.get(conf);
        Path delef=new Path("/user/file.txt");
        //删除一个文件（不能有子文件）
        //boolean isDeleted=hdfs.delete(delef,false);
        //递归删除
        boolean isDeleted=hdfs.delete(delef,true);
        System.out.println("Delete?"+isDeleted);
        
    
    }
}
 