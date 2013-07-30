package HDFSDemo.API;

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
	 
       String uri="/user/xinxi.txt";//args[0];
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

       
 }
}