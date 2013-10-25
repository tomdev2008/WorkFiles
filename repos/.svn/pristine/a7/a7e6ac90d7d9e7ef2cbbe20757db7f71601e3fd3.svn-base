package com.unicom.mms.mcp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbPhotoFrame;
import com.unicom.mms.mcp.dao.PhotoFrameDAO;

@Service("photoFrameService")
public class PhotoFrameService {
	@Autowired(required = true)
	private PhotoFrameDAO photoFrameDAO;
	
	public void saveOrUpdate(List<TbPhotoFrame> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.photoFrameDAO.getHibernateTemplate().saveOrUpdateAll(list);
		}
	}
	
	public void delete(List<TbPhotoFrame> list)throws RuntimeException{
		
		if(list!=null&&!list.isEmpty()){
			this.photoFrameDAO.deleteAll(list);
		}
	}
}
