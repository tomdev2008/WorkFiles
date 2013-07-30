package com.gaoxing.bean;

public class UserInfo {
	private String telphone;
	private String datetime;
	private String  url;
	private String type;
	private String imei;
	private String charset;
	private String code;
	private String flowsize;
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getImei() {
		return imei;
	}
	public void setImei(String imei) {
		this.imei = imei;
	}
	public String getCharset() {
		return charset;
	}
	public void setCharset(String charset) {
		this.charset = charset;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getFlowsize() {
		return flowsize;
	}
	public void setFlowsize(String flowsize) {
		this.flowsize = flowsize;
	}
	public UserInfo(String telphone, String datetime, String url, String type,
			String imei, String charset, String code, String flowsize) {
		super();
		this.telphone = telphone;
		this.datetime = datetime;
		this.url = url;
		this.type = type;
		this.imei = imei;
		this.charset = charset;
		this.code = code;
		this.flowsize = flowsize;
	}
	public UserInfo() {
		// TODO Auto-generated constructor stub
	}
	
}
