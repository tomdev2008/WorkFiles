/*
 * 
 * 演示操作HDFS的java接口
 * 
 * */import org.apache.hadoop.conf.*;
 import org.apache.hadoop.fs.*;
 import org.apache.hadoop.hdfs.*;
 import org.apache.hadoop.hdfs.protocol.*;
 import java.util.Date;


 public class DFSOperater {

	 /**
	  * @param args
	  */
	 public static void main(String[] args) {

		 Configuration conf = new Configuration();

		 try {
			 // Get a list of all the nodes host names in the HDFS cluster

			 FileSystem fs = FileSystem.get(conf);
			 DistributedFileSystem hdfs = (DistributedFileSystem)fs;
			 DatanodeInfo[] dataNodeStats = hdfs.getDataNodeStats();
			 String[] names = new String[dataNodeStats.length];
			 System.out.println("list of all the nodes in HDFS cluster:"); //print info

			 for(int i=0; i < dataNodeStats.length; i++){
				 names[i] = dataNodeStats[i].getHostName();
				 System.out.println(names[i]); //print info

			 }
			 Path f = new Path("/user/cluster/dfs.txt");

			 //check if a file exists in HDFS

			 boolean isExists = fs.exists(f);
			 System.out.println("The file exists? [" + isExists + "]");

			 //if the file exist, delete it

			 if(isExists){
				 boolean isDeleted = hdfs.delete(f, false);//fase : not recursive

				 if(isDeleted)System.out.println("now delete " + f.getName());                 
			 }

			 //create and write

			 System.out.println("create and write [" + f.getName() + "] to hdfs:");
			 FSDataOutputStream os = fs.create(f, true, 0);
			 for(int i=0; i<10; i++){
				 os.writeChars("test hdfs ");
			 }
			 os.writeChars("\n");
			 os.close();

			 //get the locations of a file in HDFS

			 System.out.println("locations of file in HDFS:");
			 FileStatus filestatus = fs.getFileStatus(f);
			 BlockLocation[] blkLocations = fs.getFileBlockLocations(filestatus, 0,filestatus.getLen());
			 int blkCount = blkLocations.length;
			 for(int i=0; i < blkCount; i++){
				 String[] hosts = blkLocations[i].getHosts();
				 //Do sth with the block hosts

				 System.out.println(hosts);
			 }

			 //get HDFS file last modification time

			 long modificationTime = filestatus.getModificationTime(); // measured in milliseconds since the epoch

			 Date d = new Date(modificationTime);
			 System.out.println(d);
			 //reading from HDFS

			 System.out.println("read [" + f.getName() + "] from hdfs:");
			 FSDataInputStream dis = fs.open(f);
			 System.out.println(dis.readUTF());
			 dis.close();

		 } catch (Exception e) {
			 e.printStackTrace();
		 }

	 }

 }


