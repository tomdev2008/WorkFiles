package com.unicom.mms.resources.drawinfo;

/**
 * 
 * 用户照片
 * 
 * @author zhangjh 新增日期：2013-5-9
 * @since mms-resources
 */
public class UserPhoto extends BaseInfo{
	
	public UserPhoto (){
		
	}
	/**
	 * 初始化用户照片<br/>
	 * 格式：userData/IMG_0040.JPG,113,136,378,478
	 * @param arg
	 */
	public UserPhoto (String arg){
		if(arg==null||"".equals(arg.trim())){
			return ;
		}
		String[] tmp = arg.split(",");
		if(tmp.length<5){
			return ;
		}
		this.setPath(tmp[0]) ;
		this.setxPos(Integer.parseInt(tmp[1]));
		this.setyPos(Integer.parseInt(tmp[2]));
		this.setWidth(Integer.parseInt(tmp[3]));
		this.setHeight(Integer.parseInt(tmp[4]));
	}
}
