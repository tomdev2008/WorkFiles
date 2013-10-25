package cn.com.mmsweb.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mmsweb.dao.CollectDAO;
import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.service.CollectService;
import cn.com.mmsweb.vo.CollectVo;

import com.unicom.mms.entity.TbCollect;

@Service("collectService")
public class CollectServiceImpl extends CommonServiceImpl<TbCollect> implements CollectService{
	private static Logger log = Logger.getLogger(CollectServiceImpl.class);
	
	@Autowired(required = true)
	private CollectDAO collectDAO;
	
	@Override
	public CommonDAO<TbCollect> getBindDao() {
		return collectDAO;
	}
	
	@Override
	 public List<CollectVo> queryByPage (int pageSize, int pageNow,Long userId) {
	  return collectDAO.queryByPage(pageSize, pageNow,userId);
	 }
	
	@Override
	 public int maxPage(int pageSize, int pageNow,Long userId)
	 {
		 return collectDAO.maxPage(pageSize, pageNow,userId);
	 }
}
