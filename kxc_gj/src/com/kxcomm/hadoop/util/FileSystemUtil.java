package com.kxcomm.hadoop.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.mapred.FileInputFormat;

public class FileSystemUtil {
	public static Configuration configuration=new Configuration();
	
	
	public static void copyLocalToHadoop(String local,String hdfs) throws IOException{
		InputStream in=new BufferedInputStream(new FileInputStream(local));		
		FileSystem fs=FileSystem.get(URI.create(hdfs),configuration);
		OutputStream out=fs.create(new Path(hdfs));
		IOUtils.copyBytes(in, out, 4096,true);	
		
	}
	
	public static void copyHadoopToLocal(String hdfs,String local) throws IOException{
		FileSystem fs=FileSystem.get(URI.create(hdfs),configuration);
		OutputStream out=new BufferedOutputStream(new FileOutputStream(local));	
		InputStream in=null;
		try {
			in=fs.open(new Path(hdfs));
			IOUtils.copyBytes(in, out, 4096,false);
		} catch (Exception e) {
			IOUtils.closeStream(in);
			e.printStackTrace();
			
		}
	}
	
	public static void copyBytesToHadoop(byte[] bytes,String hdfs) throws IOException{
		FileSystem fs=FileSystem.get(URI.create(hdfs),configuration);
		OutputStream out=fs.create(new Path(hdfs));
		out.write(bytes);
		out.close();
	}
	
	public static FileSystem getHDFSsystem() throws IOException{
		return FileSystem.get(configuration);
	}
}	
