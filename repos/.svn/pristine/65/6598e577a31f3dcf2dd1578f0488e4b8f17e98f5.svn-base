package com.unicom.mms.mcp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbPostMark;
import com.unicom.mms.mcp.dao.PostMarkDAO;

@Service("postMarkService")
public class PostMarkService {
	@Autowired(required = true)
	private PostMarkDAO postMarkDAO;
	
	public void saveOrUpdate(List<TbPostMark> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.postMarkDAO.getHibernateTemplate().saveOrUpdateAll(list);
		}
	}
	
	public void delete(List<TbPostMark> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.postMarkDAO.deleteAll(list);
		}
	}
}
