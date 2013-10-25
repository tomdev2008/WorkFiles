package com.unicom.mms.mcp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbHotBillboard;
import com.unicom.mms.mcp.dao.HotBillboardDAO;
@Service("hotBillboardService")
public class HotBillboardService {
	@Autowired(required = true)
	private HotBillboardDAO hotBillboardDAO;
	
	public void saveOrUpdate(TbHotBillboard entity)throws RuntimeException{
		if(entity!=null){
			this.hotBillboardDAO.getHibernateTemplate().saveOrUpdate(entity);
		}
	}
}
