package com.unicom.test.dao;

import java.util.List;

import org.hibernate.criterion.Example;
import org.testng.annotations.Test;

import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.util.PageInfo;
import com.unicom.test.BaseTest;

public class TemplateCardDAOTest extends BaseTest{
	
	public void list(){
		List<TbTemplateCard> list = this.templateCardDAO.findAll();
		for(TbTemplateCard card : list){
			System.out.println(card.toString());
		}
	}
	
	//@Test
	public void page(){
		PageInfo<TbTemplateCard> pageInfo = new PageInfo<TbTemplateCard>();
		pageInfo.setCurrentPage(0);
		pageInfo.setPageSize(5);
		pageInfo =  this.templateCardDAO.findByPage(pageInfo);
		
		for(TbTemplateCard card : pageInfo.getRows()){
			System.out.println(card.toString());
		}
	}
	
	@Test
	public void pageEx(){
		PageInfo<TbTemplateCard> pageInfo = new PageInfo<TbTemplateCard>();
		pageInfo.setCurrentPage(0);
		pageInfo.setPageSize(5);
		TbTemplateCard ex = new TbTemplateCard();
		Example e  = Example.create(ex);
		pageInfo =  this.templateCardDAO.findByPage(e,pageInfo);
		
		for(TbTemplateCard card : pageInfo.getRows()){
			System.out.println(card.toString());
		}
	}
}
