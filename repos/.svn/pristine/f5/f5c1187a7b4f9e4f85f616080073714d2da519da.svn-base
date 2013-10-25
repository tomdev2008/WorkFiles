package com.unicom.mms.GraphicsMagick;

import java.io.IOException;

import org.im4java.core.ConvertCmd;
import org.im4java.core.IM4JavaException;
import org.im4java.core.IMOperation;
import org.im4java.core.Info;
import org.im4java.core.InfoException;
import org.testng.annotations.Test;

public class ConvertCmdTest {

	public void convert() throws IOException, InterruptedException,
			IM4JavaException {
		// create command
		ConvertCmd cmd = new ConvertCmd();
		// create the operation, add images and operators/options
		IMOperation op = new IMOperation();
		op.addImage("D:\\15817130480.jpg");
		// op.resize(800,600);
		op.addImage("D:\\myimage_small.jpg");
		// execute the operation
		cmd.run(op);
	}

	@Test
	public void imageInfo() throws Exception {
		Info imageInfo = new Info("D://images//test.jpg", true);
		System.out.println("Format: " + imageInfo.getImageFormat());
		System.out.println("Width: " + imageInfo.getImageWidth());
		System.out.println("Height: " + imageInfo.getImageHeight());
		System.out.println("Geometry: " + imageInfo.getImageGeometry());
		System.out.println("Depth: " + imageInfo.getImageDepth());
		System.out.println("Class: " + imageInfo.getImageClass());
		cutImage("D://images//test.jpg","D://images//test22.jpg",20,20,50,50);

	}

	public  void cutImage(String srcPath, String newPath, int x, int y,
			int x1, int y1)

	throws Exception {

		int width = x1 - x;
		int height = y1 - y;

		IMOperation op = new IMOperation();

		op.addImage(srcPath);

		/**
		 * 
		 * width：裁剪的宽度
		 * 
		 * height：裁剪的高度
		 * 
		 * x：裁剪的横坐标
		 * 
		 * y：裁剪的挫坐标
		 */

		op.crop(width, height, x, y);

		op.addImage(newPath);

		ConvertCmd convert = new ConvertCmd(true);

		// linux下不要设置此值，不然会报错

		// convert.setSearchPath(imageMagickPath);

		convert.run(op);

	}

}
