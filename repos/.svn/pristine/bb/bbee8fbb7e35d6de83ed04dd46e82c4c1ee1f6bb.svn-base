package com.unicom.mms.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import magick.ImageInfo;
import magick.MagickImage;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.unicom.mms.base.constants.FilePathConstants;
import com.unicom.mms.draw.MagickDraw;
import com.unicom.mms.resources.drawinfo.BaseInfo;
import com.unicom.mms.resources.drawinfo.DiymmsInfo;
import com.unicom.mms.resources.drawinfo.PicturesInfo;
import com.unicom.mms.resources.drawinfo.TextInfo;
import com.unicom.mms.resources.drawinfo.UserPhoto;

public class DiyMmsServlet extends HttpServlet {
	private static final long serialVersionUID = 3971436771777948375L;
	public DiymmsInfo initData(){
		//底图
		String underImage ="systemData/Background/beijing_01.png,0,0,615,460";
		//用户的照片
		String userPhotoPath = "userData/002.jpg,40,0,500,696";
		//相框
		String photoFrame ="systemData/PhotoFrame/biankuang_02.png,0,0,615,460";
		//任意的图片
		String images = "systemData/Accessories/katongxingxiang_03.png,10,400,117,165,10#systemData/Accessories/wenzi_01.png,100,450,200,100,40";
		//文字
		String text ="啊~~说来话长...那是一个风和日丽的下午，那里茫茫的大草原上有着可爱的生病的小鹿，天空中飘着白色的云彩，一会变成牛，一会变成羊.那天一只奶牛点燃了我心中的怒火,10,80,300,400,30,systemData/fonts/STCAIYUN.TTF,blue";
		List<UserPhoto> userList=new ArrayList<UserPhoto>();
		UserPhoto u = new UserPhoto(userPhotoPath);
		userList.add(u);
		
		String[] material =  images.split("#");
		List<PicturesInfo> list=new ArrayList<PicturesInfo>();
		for(int i=0;i<material.length;i++){
			String tmp = material[i];
			PicturesInfo p = new PicturesInfo(tmp);
			if(p!=null){
				list.add(p);
			}
		}
		
		TextInfo textInfo = new TextInfo(text);
		
		DiymmsInfo diymmsInfo = new DiymmsInfo();
		BaseInfo underImageInfo = new BaseInfo(underImage);
		diymmsInfo.setUnderImage(underImageInfo);
		diymmsInfo.setUserPhoto(userList);
		BaseInfo photoFrameInfo = new BaseInfo(photoFrame);
		diymmsInfo.setPhotoFrame(photoFrameInfo);
		diymmsInfo.setImages(list);
		diymmsInfo.setText(textInfo);
		return diymmsInfo;
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MagickImage image = null;
		ServletOutputStream out = response.getOutputStream();
		try {
			//------------------------------------------输入参数----------------------------------------//
			// 对象
			String json =request.getParameter("json");
			Gson gson = new Gson();
			DiymmsInfo uu = gson.fromJson(json, new TypeToken<DiymmsInfo>() {}.getType());

			
			if(json==null||"".equals(json)){
				uu = initData();
			}
			//输出的图片,设置绝对目录
			String toImg = FilePathConstants.TempDataFilePath + System.currentTimeMillis()+".png";
			DiymmsInfo diymmsInfo = new DiymmsInfo();
			
			
			if(uu.getUnderImage()!=null ){
				BaseInfo underImage = uu.getUnderImage();
				if(underImage.getPath()!=null&&!"".equals(underImage.getPath())){
					underImage.setPath(FilePathConstants.absoluteAddress(underImage.getPath()));
					diymmsInfo.setUnderImage(underImage);
				}
			}
			
			List<UserPhoto> userList=uu.getUserPhoto();
			if(userList!=null){
				List<UserPhoto> newUserList = new ArrayList<UserPhoto>();
				for(UserPhoto userPhoto : userList){
					if(null==userPhoto.getPath() || "".equals(userPhoto.getPath().trim())){
						continue;
					}
					userPhoto.setPath(FilePathConstants.absoluteAddress(userPhoto.getPath()));
					newUserList.add(userPhoto);
				}
				diymmsInfo.setUserPhoto(newUserList);
			}
			if(uu.getPhotoFrame()!=null ){
				BaseInfo photoFrame = uu.getPhotoFrame();
				if(photoFrame.getPath()!=null&&!"".equals(photoFrame.getPath())){
					photoFrame.setPath(FilePathConstants.absoluteAddress(photoFrame.getPath()));
					diymmsInfo.setPhotoFrame(photoFrame);
				}			
			}
			if(uu.getImages()!=null){
				List<PicturesInfo> picturesInfolist= new ArrayList<PicturesInfo>();
				for(PicturesInfo picturesInfo : uu.getImages()){
					if(null==picturesInfo.getPath() || "".equals(picturesInfo.getPath().trim())){
						continue;
					}
					picturesInfo.setPath(FilePathConstants.absoluteAddress(picturesInfo.getPath()));
					picturesInfolist.add(picturesInfo);
				}
				diymmsInfo.setImages(picturesInfolist);
			}
			
			if(uu.getText()!=null){
				TextInfo textInfo = uu.getText();
				String tmp = FilePathConstants.absoluteAddress(textInfo.getFontsTTF());
				textInfo.setFontsTTF(tmp);
				diymmsInfo.setText(textInfo);
				System.out.println("----------------------------------华丽的文字------------------------------------");
				System.out.println(textInfo.toString());
			}
			
			image = MagickDraw.diyMms(diymmsInfo , toImg);
			System.out.println("out:"+toImg);
			byte data[] = image.imageToBlob(new ImageInfo());
			out.write(data);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			try{
				image = new MagickImage(new ImageInfo(FilePathConstants.absoluteAddress("systemData/error.jpg")));
				byte data[] = image.imageToBlob(new ImageInfo());
				out.write(data);
				out.flush();
				out.close();
			
			}catch(Exception e1){
				e1.printStackTrace();
			}
		}
	}
}
