package cn.com.mmsweb.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.GroupsDAO;
import cn.com.mmsweb.service.GroupsService;
import cn.com.mmsweb.vo.GroupsVo;

import com.unicom.mms.entity.TbGroups;
@Service("groupsServicel")
public class GroupsServiceImpl extends CommonServiceImpl<TbGroups> implements GroupsService{
	private static Logger log = Logger.getLogger(GroupsServiceImpl.class);
	@Autowired(required = true)
	private GroupsDAO groupsDAO;
	public GroupsDAO getGroupsDAO() {
		return groupsDAO;
	}
	public void setGroupsDAO(GroupsDAO groupsDAO) {
		this.groupsDAO = groupsDAO;
	}
	public String groupsName(String groupsId)
	{
		int g=0;
		if(groupsId!=null)
		{
		 g=Integer.parseInt(groupsId);
		}
		return groupsDAO.groupsName(g);
		
	}
	@Override
	 public List<TbGroups> findAll () {
	  return groupsDAO.findAll();
	 }
	@Override
	public List<GroupsVo> findAllGroups(){
		return groupsDAO.findAllGroups();
	}
	@Override
	public CommonDAO<TbGroups> getBindDao() {
		return groupsDAO;
	}
 
}
