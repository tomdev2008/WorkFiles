package com.unicom.mms.GraphicsMagick;

import java.io.File;

import magick.MagickException;

import org.testng.annotations.Test;

import com.unicom.mms.draw.MagickDraw;

public class CreateThumbnail {
	@Test
	public void test() throws MagickException{
		MagickDraw magickDraw = new MagickDraw();
		String path = "D:\\images\\last_postcard\\ee\\";
		String toPath = "D:\\images\\last_postcard\\ee\\";
//		magickDraw.createThumbnail(path+"117.jpg",path+ "test.jpg",137,98);
		
		File pathfile = new File(path);
		if(pathfile.isDirectory()){
			String[] wishFile = pathfile.list(); 
			for (int j = 0; j < wishFile.length; j++) {
				File files = new File(wishFile[j]);
				System.out.println("files.getAbsolutePath():"+path+files.getName());
				
				System.out.println(toPath+ "small_"+files.getName());
				magickDraw.createThumbnail(path+files.getName(),toPath+ "small_"+files.getName(),137,98);
			}
		}
	}
}
