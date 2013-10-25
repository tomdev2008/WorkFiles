package com.unicom.mms.objectSocket;

import java.io.File;
import java.io.Serializable;

public class Customer implements Serializable {  
  
    private static final long serialVersionUID = 1L;  
    public String name;  
    public int age;  
    public File photo;
  
    public String getName() {  
        return name;  
    }  
  
    public void setName(String name) {  
        this.name = name;  
    }  
  
    public int getAge() {  
        return age;  
    }  
  
    public void setAge(int age) {  
        this.age = age;  
    }

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "Customer [name=" + name + ", age=" + age + ", photo=" + photo
				+ "]";
	}  
}
