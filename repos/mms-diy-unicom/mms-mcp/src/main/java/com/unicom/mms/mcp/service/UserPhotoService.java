package com.unicom.mms.mcp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbUserPhoto;
import com.unicom.mms.mcp.dao.UserPhotoDAO;
@Service("userPhotoService")
public class UserPhotoService {
	@Autowired(required = true)
	private UserPhotoDAO userPhotoDAO;
	
	public void saveOrUpdate(TbUserPhoto entity)throws RuntimeException{
		if(entity!=null){
			this.userPhotoDAO.getHibernateTemplate().saveOrUpdate(entity);
		}
	}
	
	public void delete(TbUserPhoto entity)throws RuntimeException{
		if(entity!=null){
			this.userPhotoDAO.delete(entity);
		}
	}
}
