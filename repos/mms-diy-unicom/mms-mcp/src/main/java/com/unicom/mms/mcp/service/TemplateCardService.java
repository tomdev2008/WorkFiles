package com.unicom.mms.mcp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.mcp.dao.TemplateCardDAO;

@Service("templateCardService")
public class TemplateCardService {
	@Autowired(required = true)
	private TemplateCardDAO templateCardDAO;
	
	public void saveOrUpdate(List<TbTemplateCard> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.templateCardDAO.getHibernateTemplate().saveOrUpdateAll(list);
		}
	}
	
	public void delete(List<TbTemplateCard> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.templateCardDAO.deleteAll(list);
		}
	}
}
