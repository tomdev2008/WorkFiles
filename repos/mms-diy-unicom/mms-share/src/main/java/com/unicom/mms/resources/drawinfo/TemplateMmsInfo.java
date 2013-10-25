package com.unicom.mms.resources.drawinfo;

/**
 * 
 * 模版明信片
 * 
 * @author zhangjh 新增日期：2013-5-11
 * @since mms-share
 */
public class TemplateMmsInfo {
	private String userId;
	/**
	 * 模版明信片地址
	 */
	private String postcard;
	// 文字
	private TextInfo text;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPostcard() {
		return postcard;
	}

	public void setPostcard(String postcard) {
		this.postcard = postcard;
	}

	public TextInfo getText() {
		return text;
	}

	public void setText(TextInfo text) {
		this.text = text;
	}

}
