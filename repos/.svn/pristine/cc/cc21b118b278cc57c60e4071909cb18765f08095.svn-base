package com.unicom.mms.mcp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbDecoration;
import com.unicom.mms.mcp.dao.DecorationDAO;

@Service("decorationService")
public class DecorationService {
	@Autowired(required = true)
	private DecorationDAO decorationDAO;
	
	public void saveOrUpdate(List<TbDecoration> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.decorationDAO.getHibernateTemplate().saveOrUpdateAll(list);
		}
	}
	
	public void delete(List<TbDecoration> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.decorationDAO.deleteAll(list);
		}
	}
}
