package com.unicom.mms.mcp.common;

import java.util.List;

public class Response {

	

	public static final int SUCCESS = 0;
	public static final int FAIL = 1;
	private String msg ;
	private int resultCode;
	private List<Object> entity;

	public List<Object> getEntity() {
		return entity;
	}
	public void setEntity(List<Object> entity) {
		this.entity = entity;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getResultCode() {
		return resultCode;
	}
	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}

	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Response [msg=");
		builder.append(msg);
		builder.append(", resultCode=");
		builder.append(resultCode);
		builder.append("]");
		return builder.toString();
	}
}
