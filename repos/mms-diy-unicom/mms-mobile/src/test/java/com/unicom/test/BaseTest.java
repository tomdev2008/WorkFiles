package com.unicom.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.unicom.mms.dao.TemplateCardDAO;
import com.unicom.mms.service.impl.TemlateCardService;

public class BaseTest {
	private ApplicationContext ctx;
	public TemplateCardDAO templateCardDAO;
	public TemlateCardService temlateCardService;
	
	public BaseTest(){
		ctx = new ClassPathXmlApplicationContext("modules/applicationContext.xml");
		if (ctx != null)
			System.out.println("success spring");
		
		templateCardDAO = (TemplateCardDAO) ctx.getBean("templateCardDAO");
		temlateCardService = (TemlateCardService) ctx.getBean("temlateCardService");
	}
}
