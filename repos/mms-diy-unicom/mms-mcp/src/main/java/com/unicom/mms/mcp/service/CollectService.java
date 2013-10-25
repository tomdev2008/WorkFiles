package com.unicom.mms.mcp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbCollect;
import com.unicom.mms.mcp.dao.CollectDAO;
@Service("collectService")
public class CollectService {
	@Autowired(required = true)
	private CollectDAO collectDAO;
	
	public void saveOrUpdate(List<TbCollect> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.collectDAO.getHibernateTemplate().saveOrUpdateAll(list);
		}
	}
	
	public void delete(List<TbCollect> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.collectDAO.deleteAll(list);
		}
	}
}
