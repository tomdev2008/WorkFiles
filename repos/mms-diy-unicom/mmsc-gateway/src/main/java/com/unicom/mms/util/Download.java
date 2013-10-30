package com.unicom.mms.util;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;

// This class downloads a file from a URL.
public class Download  {
    
    public String down( String imgUrl) {
    	String localPath = "";
    	String curDir = System.getProperty("user.dir");
    	SimpleDateFormat df=new SimpleDateFormat("yyyy-MM");
		String date  = df.format(new Date());
		String filePath = curDir+"/data"+"/"+date;
		File fdir = new File(filePath);
		if(!fdir.exists()){
			fdir.mkdirs();
		}
		String fileName = imgUrl.substring(imgUrl.lastIndexOf("/"), imgUrl.length());
		localPath = filePath+fileName;
		File f = new File(filePath+fileName);
//    	File f;
        byte[] buffer = new byte[8 * 1024];
        URL u;
        URLConnection connection = null;
        try {
                u = new URL(imgUrl);
                connection = u.openConnection();
        } catch (Exception e) {
                System.out.println("ERR:" + imgUrl);
                return null;
        }
        connection.setReadTimeout(100000);
        InputStream is = null;
        FileOutputStream fos = null;
        try {
                f.createNewFile();
                is = connection.getInputStream();
                fos = new FileOutputStream(f);
                int len = 0;
                while ((len = is.read(buffer)) != -1) {
                        fos.write(buffer, 0, len);
                }

        } catch (Exception e) {
                f.delete();
        } finally {
                if (fos != null) {
                        try {
                                fos.close();
                        } catch (IOException e) {
                        }
                }
                if (is != null) {
                        try {
                                is.close();
                        } catch (IOException e) {
                        }
                }
        }
        buffer = null;
        // System.gc();
        return localPath;
}

    public static void main(String args[]){
    	try {
		Download d = new Download();
		String localPath =d.down("http://211.91.224.244/resources/userData/2013-10/1382776415776.png");
		System.out.println(localPath);
		String receiver ="11";
		String[] a = receiver.split(",");
		System.out.println(a[0]);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    }
}