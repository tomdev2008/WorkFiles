package com.kxcomm.hadoop.util;

public class LogBean {
	private String family;
	private String column;
	private String value;
	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public LogBean(String family, String column, String value) {
		super();
		this.family = family;
		this.column = column;
		this.value = value;
	}
	public String getFamily() {
		return family;
	}
	public void setFamily(String family) {
		this.family = family;
	}
	
	
}
