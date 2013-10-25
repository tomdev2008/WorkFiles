package com.unicom.mms.mcp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbStamp;
import com.unicom.mms.mcp.dao.StampDAO;

@Service("stampService")
public class StampService {
	@Autowired(required = true)
	private StampDAO stampDAO;
	
	public void saveOrUpdate(List<TbStamp> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.stampDAO.getHibernateTemplate().saveOrUpdateAll(list);
		}
	}
	
	public void delete(List<TbStamp> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.stampDAO.deleteAll(list);
		}
	}
}
