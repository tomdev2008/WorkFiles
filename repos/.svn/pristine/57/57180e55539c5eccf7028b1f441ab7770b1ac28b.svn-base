package com.unicom.mms.resources.drawinfo;

import java.util.List;

/**
 * 
 * diy明信片
 * 
 * @author zhangjh 新增日期：2013-5-11
 * @since mms-resources
 */
public class DiymmsInfo {
	// 底图
	private BaseInfo underImage;
	// 用户的照片
	private List<UserPhoto> userPhoto;
	// 相框
	private BaseInfo photoFrame;
	// 任意的图片
	private List<PicturesInfo> images;
	// 文字
	private TextInfo text;

	public BaseInfo getUnderImage() {
		return underImage;
	}

	public void setUnderImage(BaseInfo underImage) {
		this.underImage = underImage;
	}

	public BaseInfo getPhotoFrame() {
		return photoFrame;
	}

	public void setPhotoFrame(BaseInfo photoFrame) {
		this.photoFrame = photoFrame;
	}

	public List<UserPhoto> getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(List<UserPhoto> userPhoto) {
		this.userPhoto = userPhoto;
	}

	

	public List<PicturesInfo> getImages() {
		return images;
	}

	public void setImages(List<PicturesInfo> images) {
		this.images = images;
	}

	public TextInfo getText() {
		return text;
	}

	public void setText(TextInfo text) {
		this.text = text;
	}

	@Override
	public String toString() {
		if(images!=null){
			for(PicturesInfo p : images){
				System.out.println(p.toString());
			}
		}
		
		
		return "DiymmsInfo [underImage=" + underImage + ", photoFrame=" + photoFrame + "]";
	}

}
