package cn.com.kxcomm.common;

public class LoginWorkingThread extends Thread{
	@Override
	public void run() {
		InitDatabase aa = InitDatabase.getSingleInstance();
		
		try {
//			aa.writeData();
//			aa.initUser(); //初始化登陆用户
//		    aa.initGroupsContacts();//初始化分组联系人
//			boolean InitImages = AppConfig.getInstance().getBoolean("InitImages");
//			if(!InitImages){
//				return ;
//			}
//			aa.initPhotoFrame();//初始化相框
//			aa.initPostMark(); //初始化邮戳
//			aa.initStamp(); //初始化邮票
//			aa.initDecoration(); //初始化饰品
//			aa.initTemplateCard(); //初始化模板明信片
//		    aa.initBgMusic();  //初始化背景音乐
//		    aa.initBgPic();  //初始化背景图片
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
