

import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

/**
 * Hello world!
 *
 */
public class App 
{
	public void createFile() throws Exception{
		 Configuration conf=new Configuration();

	        FileSystem hdfs=FileSystem.get(conf);
	        byte[] buff="hello hadoop world!\n".getBytes();	       
	        Path dfs=new Path("/zhangjh");	       
	        FSDataOutputStream outputStream=hdfs.create(dfs);
	        outputStream.write(buff,0,buff.length);
	}
	public String copyFile(){
		System.out.println("copyFile......");
		try{
			Configuration conf=new Configuration();
	        FileSystem hdfs=FileSystem.get(conf);
	        Path src =new Path("/root/zhangjh/file/aa.txt");
	        Path dst =new Path("/user/cluster/aa.txt");
	        hdfs.copyFromLocalFile(src, dst);
	        System.out.println("Upload to"+conf.get("fs.default.name"));
	        FileStatus files[]=hdfs.listStatus(dst);
	        for(FileStatus file:files){
	            System.out.println(file.getPath());
	        }
		}catch(Exception e){
			e.printStackTrace();
		}
		
        return "";
	}
	
    public static void main( String[] args ) throws Exception
    {
        System.out.println( "Hello World!" );
        App a = new App();
//        a.copyFile();
        System.out.println("create file~~");
        a.createFile();
    }
}
