package com.unicom.test.service;

import org.testng.annotations.Test;

import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.util.PageInfo;
import com.unicom.test.BaseTest;

public class TemlateCardServiceTest extends BaseTest{
	@Test
	public void page(){
		PageInfo<TbTemplateCard> pageInfo = new PageInfo<TbTemplateCard>();
		pageInfo.setCurrentPage(0);
		pageInfo.setPageSize(5);
		TbTemplateCard ex = null;
		
		pageInfo =  this.temlateCardService.findByPage(ex, pageInfo);
		
		for(TbTemplateCard card : pageInfo.getRows()){
			System.out.println(card.toString());
		}
	}
}
