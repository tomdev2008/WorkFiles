package com.unicom.mms;

import java.util.ArrayList;
import java.util.List;

import org.testng.annotations.Test;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.unicom.mms.base.constants.FilePathConstants;
import com.unicom.mms.resources.drawinfo.BaseInfo;
import com.unicom.mms.resources.drawinfo.DiymmsInfo;
import com.unicom.mms.resources.drawinfo.PicturesInfo;
import com.unicom.mms.resources.drawinfo.TemplateMmsInfo;
import com.unicom.mms.resources.drawinfo.TextInfo;
import com.unicom.mms.resources.drawinfo.UserPhoto;

public class TestText {
	
//	@Test
	public void templateMmsInfo(){
		TemplateMmsInfo info = new TemplateMmsInfo();
		info.setPostcard("systemData/templateCardPath/09.jpg");
		//文字
		String text ="啊~~说来话长...那是一个风和日丽的下午，那里茫茫的大草原上有着可爱的生病的小鹿，天空中飘着白色的云彩，一会变成牛，一会变成羊.那天一只奶牛点燃了我心中的怒火,380,100,150,327,20,systemData/fonts/STCAIYUN.TTF,red";
		TextInfo textInfo = new TextInfo(text);
		if(textInfo!=null){
			String tmp = textInfo.getFontsTTF();
			textInfo.setFontsTTF(tmp);
		}
		info.setText(textInfo);
		info.setUserId("11");
		Gson gson = new Gson();
		String jsonStr = gson.toJson(info);
		System.out.println(jsonStr);
	}
	
	@Test
	public void text(){
		StringBuffer aa = new StringBuffer("你hao啊");
		System.out.println(aa.substring(1, 2));
		Gson gson = new Gson();
		//底图
				String underImage =FilePathConstants.absoluteAddress("systemData/Background/beijing_01.png,0,0,615,460");
				//用户的照片
				String userPhotoPath = "userData/002.jpg,40,0,500,696";
				//相框
				String photoFrame =FilePathConstants.absoluteAddress("systemData/PhotoFrame/biankuang_02.png,0,0,615,460");
				//任意的图片
				String images = "systemData/Accessories/katongxingxiang_03.png,10,400,117,165#systemData/Accessories/wenzi_01.png,100,450,200,100";
				//文字
				String text ="啊~~说来话长...那是一个风和日丽的下午，那里茫茫的大草原上有着可爱的生病的小鹿，天空中飘着白色的云彩，一会变成牛，一会变成羊.那天一只奶牛点燃了我心中的怒火,10,80,300,400,30,systemData/fonts/STCAIYUN.TTF,red";
		
		
		List<UserPhoto> userList=new ArrayList<UserPhoto>();
		UserPhoto u = new UserPhoto(userPhotoPath);
		userList.add(u);
		String jsonStr = gson.toJson(u);
		System.out.println(jsonStr);
		
		String[] material =  images.split("#");
		List<PicturesInfo> list=new ArrayList<PicturesInfo>();
		for(int i=0;i<material.length;i++){
			String tmp = material[i];
			PicturesInfo p = new PicturesInfo(tmp);
			if(p!=null){
				String tmpAA = FilePathConstants.absoluteAddress(p.getPath());
				p.setPath(tmpAA);
				list.add(p);
			}
		}
		jsonStr = gson.toJson(list);
		System.out.println(jsonStr);
		
		TextInfo textInfo = new TextInfo(text);
		if(textInfo!=null){
			String tmp = FilePathConstants.absoluteAddress(textInfo.getFontsTTF());
			textInfo.setFontsTTF(tmp);
		}
		jsonStr = gson.toJson(textInfo);
		System.out.println(jsonStr);
		
		DiymmsInfo diymmsInfo = new DiymmsInfo();
		diymmsInfo.setImages(list);
		BaseInfo photoFrameInfo = new BaseInfo(photoFrame);
		diymmsInfo.setPhotoFrame(photoFrameInfo);
		diymmsInfo.setText(textInfo);
		BaseInfo underImageInfo = new BaseInfo(underImage);
		diymmsInfo.setUnderImage(underImageInfo);
		diymmsInfo.setUserPhoto(userList);
		System.out.println("---------------------------------------------------------------------------------------------------------------------");
		jsonStr = gson.toJson(diymmsInfo);
		System.out.println("DiymmsInfo aa:"+jsonStr);
		
		System.out.println("------------------------------------------------------aaaa--------------------------------------------------------------");
		DiymmsInfo uu = gson.fromJson(jsonStr, new TypeToken<DiymmsInfo>() {}.getType());
		System.out.println("DiymmsInfo uu:"+uu.toString());
	}
	
	@Test
	public void hi(){
		Gson gson = new Gson();
		StringBuffer hey = new StringBuffer();
		hey.append("{");
//		hey.append("'underImage':'systemData/Background/5.jpg'");
//		hey.append(",'userPhoto':[{'path':'systemData/PhotoFrame/brithday-wish-1.png','xPos':37,'yPos':29,'width':555,'height':400}]");
//		hey.append(",'text':{'text':'留下你祝福的话语:','xPos':366,'yPos':17,'width':220,'height':120,'fontSize':13,'fontsTTF':'systemData/fonts/BAUHS93.TTF','fontsColor':'red'}");
		hey.append(",'images':[");
		//'images':[{'path':'systemData/Accessories/katongxingxiang_03.png','xPos':10,'yPos':400,'width':117,'height':165},{'path':'systemData/Accessories/wenzi_01.png','xPos':100,'yPos':450,'width':200,'height':100}]
		hey.append("{'path':'systemData/Accessories/katongxingxiang_03.png','xPos':10,'yPos':400,'width':117,'height':165}");
		hey.append("]");
		hey.append("}");
		
		System.out.println("DiymmsInfo bb:"+hey.toString());
		DiymmsInfo uu = gson.fromJson(hey.toString(), new TypeToken<DiymmsInfo>() {}.getType());
		System.out.println(uu.toString());
	}
	
//	@Test
	public void tesaat(){
		String  aa = "aaacross.png";
		if(aa.indexOf("cross")!=-1){
			System.out.println("有");
		}else{
			System.out.println("无");
		}
	}
}
