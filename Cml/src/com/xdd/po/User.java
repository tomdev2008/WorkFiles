package com.xdd.po;
import java.io.Serializable;

public class User implements Serializable {
	
	public User(){}
	//ÃÜÂë
	private String passWord;
	//ĞÕÃû
	private String name;
	private Integer Id;
	
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}


}
