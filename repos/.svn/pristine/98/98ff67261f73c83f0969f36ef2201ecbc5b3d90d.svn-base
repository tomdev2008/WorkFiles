package com.unicom.mms.mcp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbBgMusic;
import com.unicom.mms.mcp.dao.BgMusicDAO;

@Service("bgMusicService")
public class BgMusicService {
	@Autowired(required = true)
	private BgMusicDAO bgMusicDAO;
	
	public void saveOrUpdate(List<TbBgMusic> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.bgMusicDAO.getHibernateTemplate().saveOrUpdateAll(list);
		}
	}
	
	public void delete(List<TbBgMusic> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.bgMusicDAO.deleteAll(list);
		}
	}
}
