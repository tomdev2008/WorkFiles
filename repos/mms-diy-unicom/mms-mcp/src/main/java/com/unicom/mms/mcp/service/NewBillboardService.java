package com.unicom.mms.mcp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbNewBillboard;
import com.unicom.mms.mcp.dao.NewBillboardDAO;

@Service("newBillboardService")
public class NewBillboardService {
	@Autowired(required = true)
	private NewBillboardDAO newBillboardDAO;
	
	public void saveOrUpdate(TbNewBillboard entity)throws RuntimeException{
		if(entity!=null){
			this.newBillboardDAO.getHibernateTemplate().saveOrUpdate(entity);
		}
	}
	
}
