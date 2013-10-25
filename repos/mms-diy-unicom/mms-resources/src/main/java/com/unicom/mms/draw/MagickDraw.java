package com.unicom.mms.draw;

import java.awt.Dimension;
import java.awt.Rectangle;
import java.util.List;

import magick.CompositeOperator;
import magick.CompressionType;
import magick.DrawInfo;
import magick.ImageInfo;
import magick.MagickException;
import magick.MagickImage;
import magick.PixelPacket;
import magick.PreviewType;

import com.unicom.mms.base.constants.FilePathConstants;
import com.unicom.mms.resources.drawinfo.BaseInfo;
import com.unicom.mms.resources.drawinfo.DiymmsInfo;
import com.unicom.mms.resources.drawinfo.PicturesInfo;
import com.unicom.mms.resources.drawinfo.TemplateMmsInfo;
import com.unicom.mms.resources.drawinfo.TextInfo;
import com.unicom.mms.resources.drawinfo.UserPhoto;

public class MagickDraw {
	 static{  
         //不能漏掉这个，不然jmagick.jar的路径找不到  
         System.setProperty("jmagick.systemclassloader","no");  
         System.out.println(System.getProperty("java.library.path"));
     }  
       
     /** 
      * 压缩图片 
      * @param filePath 源文件路径 
      * @param toPath   缩略图路径 
      */  
     public static void createThumbnail(String filePath, String toPath,int wideth,int height) throws MagickException{  
         ImageInfo info = null;  
         MagickImage image = null;  
         Dimension imageDim = null;  
         MagickImage scaled = null;  
         try{  
             info = new ImageInfo(filePath);  
             image = new MagickImage(info);  
             imageDim = image.getDimension();  
//             int wideth = imageDim.width;  
//             int height = imageDim.height;  
//             if (wideth > height) {  
//                 height = 660 * height / wideth;  
//                 wideth = 660;  
//             }   
             System.out.println("wideth:"+wideth+", height:"+ height);
             scaled = image.scaleImage(wideth, height);//小图片文件的大小.  
             scaled.setFileName(toPath);  
             scaled.writeImage(info);  
         }finally{  
             if(scaled != null){  
                 scaled.destroyImages();  
             }  
         }    
     }  
       
     /** 
      * 水印(图片logo) 
      * @param filePath  源文件路径 
      * @param toImg     修改图路径 
      * @param logoPath  logo图路径 
      * @throws MagickException 
      */  
     public static MagickImage initLogoImg(String filePath, String toImg, String logoPath) throws MagickException {  
         ImageInfo info = new ImageInfo();  
         MagickImage fImage = null;  
         MagickImage sImage = null;  
         MagickImage fLogo = null;  
         MagickImage sLogo = null;  
         Dimension imageDim = null;  
         Dimension logoDim = null;  
         try {  
             fImage = new MagickImage(new ImageInfo(filePath));  
             imageDim = fImage.getDimension();  
             int width = imageDim.width;  
             int height = imageDim.height;  
             if (width > 660) {  
                 height = 660 * height / width;  
                 width = 660;  
             }  
             sImage = fImage.scaleImage(width, height);  
               
             fLogo = new MagickImage(new ImageInfo(logoPath));  
             logoDim = fLogo.getDimension();  
             int lw = width / 8;  
             int lh = logoDim.height * lw / logoDim.width;  
             sLogo = fLogo.scaleImage(lw, lh);  
   
             sImage.compositeImage(CompositeOperator.AtopCompositeOp, sLogo,  width-(lw + lh/10), height-(lh + lh/10));  
             sImage.setFileName(toImg);  
             sImage.writeImage(info);  
         } 
         finally {  
//             if(sImage != null){  
//                 sImage.destroyImages();  
//             }  
         }  
         return sImage;
     }  
       
     /** 
      * 水印(文字) 
         * @param filePath 源文件路径 
      * @param toImg    修改图路径 
      * @param text     名字(文字内容自己随意) 
      * @throws MagickException 
      */  
     public static MagickImage initTextToImg(String filePath, String toImg,  String text) throws MagickException{  
    	 MagickImage scaled =null;
    	 try{
    		 ImageInfo info = new ImageInfo(filePath);  
             if (filePath.toUpperCase().endsWith("JPG") || filePath.toUpperCase().endsWith("JPEG")) {  
                 info.setCompression(CompressionType.JPEGCompression); //压缩类别为JPEG格式  
                 info.setPreviewType(PreviewType.JPEGPreview); //预览格式为JPEG格式  
                 info.setQuality(95);  
             }  
             MagickImage aImage = new MagickImage(info);  
             Dimension imageDim = aImage.getDimension();  
             int wideth = imageDim.width;  
             int height = imageDim.height;  
             if (wideth > 660) {  
                 height = 660 * height / wideth;  
                 wideth = 660;  
             }  
             int a = 0;  
             int b = 0;  
             String[] as = text.split("");  
             for (String string : as) {  
                 if(string.matches("[\u4E00-\u9FA5]")){  
                     a++;  
                 }  
                 if(string.matches("[a-zA-Z0-9]")){  
                     b++;  
                 }  
             }  
             int tl = a*12 + b*6 + 300;  
             scaled = aImage.scaleImage(wideth, height);  
             if(wideth > tl && height > 5){  
                 DrawInfo aInfo = new DrawInfo(info);  
                 aInfo.setFill(PixelPacket.queryColorDatabase("white"));  
                 //aInfo.setUnderColor(new PixelPacket(0,0,0,100));  
                 aInfo.setPointsize(50);  
                 //解决中文乱码问题,自己可以去随意定义个自己喜欢字体，我在这用的微软雅黑  
               
                 String fontPath =   FilePathConstants.FontsPath + "STCAIYUN.TTF";
 //              String fontPath = "/usr/maindata/MSYH.TTF";  
                 aInfo.setFont(fontPath);  
                 aInfo.setTextAntialias(true);  
                 aInfo.setOpacity(0);  
                 aInfo.setText(text);  
                 aInfo.setGeometry("+" + (wideth-tl) + "+" + (height-5));  
                 scaled.annotateImage(aInfo);  
             }  
             scaled.setFileName(toImg);  
             scaled.writeImage(info);  
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }
//    	 finally{
//    		 if(scaled!=null)
//    			 scaled.destroyImages();  
//    	 }
//            
         return scaled;
     }  
       
       
     /** 
      * 切图 
      * @param imgPath 源图路径 
      * @param toPath  修改图路径 
      * @param w        
      * @param h        
      * @param x        
      * @param y 
      * @throws MagickException 
      */  
     public static void cutImg(String imgPath, String toPath, int w, int h, int x, int y) throws MagickException {  
         ImageInfo infoS = null;  
         MagickImage image = null;  
         MagickImage cropped = null;  
         Rectangle rect = null;  
         try {  
             infoS = new ImageInfo(imgPath);  
             image = new MagickImage(infoS);  
             rect = new Rectangle(x, y, w, h);  
             cropped = image.cropImage(rect);  
             cropped.setFileName(toPath);  
             cropped.writeImage(infoS);  
               
         } finally {  
             if (cropped != null) {  
                 cropped.destroyImages();  
             }  
         }  
     }  
     
	/**
	 * 
	 * 制作图片(相框是必选)
	 * 
	 * @param filePath
	 * @param toImg
	 * @param text
	 * @return
	 * @throws MagickException
	 * @author zhangjh 新增日期：2013-5-9
	 * @since mms-resources
	 */
     public static MagickImage diyMms(DiymmsInfo mms, String toImg) throws MagickException{
    	 if(mms==null){
        	 return null;
         }
    	 ImageInfo info = new ImageInfo();  
    	 MagickImage uImage = null; 
         MagickImage sImage = null;  
         MagickImage sLogo = null;  
         BaseInfo photoFrame = mms.getPhotoFrame();
         BaseInfo underImage= mms.getUnderImage();
         List<UserPhoto> userPhotoList = mms.getUserPhoto();
         List<PicturesInfo> list = mms.getImages();
         TextInfo textInfo = mms.getText();
         try {  
        	 int CompositeType= CompositeOperator.OverCompositeOp;
        	 //-----------------第一层：底图,当没有底图则使用相框的大小
        	 if(underImage==null ){
        		 underImage = photoFrame;
        	 }
        	 if(underImage!=null){
        		 MagickImage backgroundImage = new MagickImage(new ImageInfo(underImage.getPath()));
      			Dimension backgroundDim = backgroundImage.getDimension();
      			int backgroundW = backgroundDim.width;
      			int backgroundH = backgroundDim.height;
      			sImage = backgroundImage.scaleImage(underImage.getWidth(), underImage.getHeight());
      			System.out.println("添加背景:"+underImage);
        	 }
 			
 			
			// ----------------第二层：用户照片
 			if(userPhotoList!=null){
 				for(UserPhoto userPhoto :userPhotoList){
 	 				MagickImage userPhotoImage = new MagickImage(new ImageInfo(userPhoto.getPath()));
 	 				uImage = userPhotoImage.scaleImage(userPhoto.getWidth(),userPhoto.getHeight());
 	 				sImage.compositeImage(CompositeType, uImage, userPhoto.getxPos(), userPhoto.getyPos());
 	 				System.out.println("添加用户照片:"+userPhoto.getPath());
 	 			}
 			}
 			
        	 //-----------------第三层：相框
 			if(photoFrame!=null){
 				MagickImage photoFrameImage = new MagickImage(new ImageInfo(photoFrame.getPath()));
 				Dimension photoFrameDim = photoFrameImage.getDimension();
 				int photoFrameW = photoFrameDim.width;
 				int photoFrameH = photoFrameDim.height;
 				sLogo = photoFrameImage.scaleImage(photoFrame.getWidth(), photoFrame.getHeight());
 				sImage.compositeImage(CompositeType, sLogo,0, 0);
 				System.out.println("添加相框:"+photoFrame);
 			}
			

			//-----------------第三层：各种素材
 			if(list!=null){
 				for(PicturesInfo p :list){
 					MagickImage materialImage = new MagickImage(new ImageInfo(p.getPath()));
 					MagickImage addImage = materialImage.scaleImage(p.getWidth(), p.getHeight());
 					addImage.setBackgroundColor(new PixelPacket(65535, 65535, 65535, 65535));
 					addImage = addImage.rotateImage(p.getRotate());
 					sImage.compositeImage(CompositeType, addImage, p.getxPos(), p.getyPos());
 					System.out.println("添加素材:"+p.getPath());
 				}
 			}
			
			
			//-----------------第四层：文字
			if(textInfo!=null){
				DrawInfo aInfo = new DrawInfo(info); 
				aInfo.setFill(PixelPacket.queryColorDatabase(textInfo.getFontsColor()));
				aInfo.setPointsize(textInfo.getFontSize());
				// 解决中文乱码问题,自己可以去随意定义个自己喜欢字体，我在这用的微软雅黑
				String fontPath = textInfo.getFontsTTF();
	            aInfo.setUnderColor(new PixelPacket(65535, 65535, 65535, 65535));//设置为透明颜色  
	            aInfo.setFont(fontPath);  
	            aInfo.setTextAntialias(true);  
	            aInfo.setOpacity(0);//透明度  
	            aInfo.setTextAntialias(true);
	          
	            //求一行可容纳多少个字、一共可容纳多少行
	            int textNum = textInfo.getWidth() / textInfo.getFontSize();
	            int textline = textInfo.getHeight() / textInfo.getFontSize();
	            StringBuffer text = new StringBuffer(textInfo.getText());
	            int index = 0;
	            int yIndex = textInfo.getyPos();
	            int wTextLength = 0;
	            for(int i = 1;i<textline;i++){
	            	if(wTextLength>=text.length())
	            		break;
	            	
	            	int end = index+textNum;
	            	if(end >= text.length()){
	            		end = text.length();
	            	}
					String tmpText = text.substring(index, end);
					aInfo.setText(tmpText);
					System.out.println("分割的文字：" + tmpText + ",x:"+ textInfo.getxPos() + ",y:" + yIndex);
					aInfo.setGeometry("+" + textInfo.getxPos() + "+" + yIndex);
					sImage.annotateImage(aInfo);
					index += textNum;
					yIndex += textInfo.getFontSize();
					wTextLength +=tmpText.length();
	            }
			}
            
            //写入到磁盘照片
			sImage.setFileName(toImg);
			sImage.writeImage(info);  
         } 
         finally {  
         }  
         return sImage;
     }
     
	/**
	 * 
	 * 模版明信片
	 * 
	 * @param mms
	 * @param toImg
	 * @return
	 * @author zhangjh 新增日期：2013-5-21
	 * @since mms-resources
	 */
     public static MagickImage templateMms(TemplateMmsInfo mms,String toImg){
    	 if(mms==null||mms.getPostcard()==null){
        	 return null;
         }
    	 MagickImage sImage = null;  
    	
    	 TextInfo textInfo = mms.getText();
		try {
			ImageInfo info = new ImageInfo();
			int CompositeType = CompositeOperator.OverCompositeOp;
			// -----------------第一层：明信片
			MagickImage backgroundImage = new MagickImage(new ImageInfo(
					mms.getPostcard()));
			Dimension backgroundDim = backgroundImage.getDimension();
			int backgroundW = backgroundDim.width;
			int backgroundH = backgroundDim.height;
			sImage = backgroundImage.scaleImage(backgroundW, backgroundH);
			System.out.println("添加明信片:" + mms.getPostcard());

			// -----------------第二层：文字
			if (textInfo != null) {
				DrawInfo aInfo = new DrawInfo(info);
				aInfo.setFill(PixelPacket.queryColorDatabase(textInfo.getFontsColor()));
				aInfo.setPointsize(textInfo.getFontSize());
				// 解决中文乱码问题,自己可以去随意定义个自己喜欢字体，我在这用的微软雅黑
				String fontPath = textInfo.getFontsTTF();
				aInfo.setUnderColor(new PixelPacket(65535, 65535, 65535, 65535));// 设置为透明颜色
				aInfo.setFont(fontPath);
				aInfo.setTextAntialias(true);
				aInfo.setOpacity(0);// 透明度
				aInfo.setTextAntialias(true);

				// 求一行可容纳多少个字、一共可容纳多少行
				int textNum = textInfo.getWidth() / textInfo.getFontSize();
				int textline = textInfo.getHeight() / textInfo.getFontSize();
				StringBuffer text = new StringBuffer(textInfo.getText());
				int index = 0;
				int yIndex = textInfo.getyPos();
				int wTextLength = 0;
				for (int i = 1; i < textline; i++) {
					if (wTextLength >= text.length())
						break;

					int end = index + textNum;
					if (end >= text.length()) {
						end = text.length();
					}
					String tmpText = text.substring(index, end);
					aInfo.setText(tmpText);
					System.out.println("分割的文字：" + tmpText + ",x:"
							+ textInfo.getxPos() + ",y:" + yIndex);
					aInfo.setGeometry("+" + textInfo.getxPos() + "+" + yIndex);
					sImage.annotateImage(aInfo);
					index += textNum;
					yIndex += textInfo.getFontSize();
					wTextLength += tmpText.length();
				}
			}
			sImage.setFileName(toImg);
			sImage.writeImage(info);
		}catch(Exception e){
    		 e.printStackTrace();
    	 }
    	 return sImage;
     }
	
}
