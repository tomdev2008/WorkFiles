package com.etrack.base;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {
	private static SqlSessionFactory factory = null;  
    
    private static void initialFactory() {  
        String resource = "mybatis-config.xml";  
        try {  
            InputStream in = Resources.getResourceAsStream(resource);  
            factory = new SqlSessionFactoryBuilder().build(in);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
          
    }  
      
    public static SqlSession getSession() {  
        if(factory == null) {  
            initialFactory();  
        }  
          
        return factory.openSession();  
    }  
    
    public static void main(String[] args){
    	SqlSession session = MyBatisUtil.getSession();
    	if(session !=null){
    		System.out.println("ok");
    		session.getConnection();
    	}else{
    		System.out.println("error");
    	}
    }
}
