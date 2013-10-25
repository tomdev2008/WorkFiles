package com.unicom.mms.mcp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbBgMusic;
import com.unicom.mms.entity.TbBgPic;
import com.unicom.mms.mcp.dao.BgMusicDAO;
import com.unicom.mms.mcp.dao.BgPicDAO;

@Service("bgPicService")
public class BgPicService {

	@Autowired(required = true)
	private BgPicDAO bgPicDAO;
	
	public void saveOrUpdate(List<TbBgPic> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.bgPicDAO.getHibernateTemplate().saveOrUpdateAll(list);
		}
	}
	
	public void delete(List<TbBgPic> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.bgPicDAO.deleteAll(list);
		}
	}
}
