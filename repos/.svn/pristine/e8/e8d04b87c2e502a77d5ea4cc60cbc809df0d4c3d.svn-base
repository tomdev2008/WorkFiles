package cn.com.mmsweb.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.ContactDAO;
import cn.com.mmsweb.service.ContactService;
import cn.com.mmsweb.vo.ContractsVo;
import cn.com.mmsweb.vo.GroupContactsVo;

import com.unicom.mms.entity.TbContacts;
import com.unicom.mms.entity.TbGroupContacts;
@Service("contactService")
public class ContactServiceImpl extends CommonServiceImpl<TbContacts> implements ContactService{
	private static Logger log = Logger.getLogger(ContactServiceImpl.class);
	@Autowired(required = true)
	private ContactDAO contactDAO;
	
	public ContactDAO getContactDAO() {
		return contactDAO;
	}
	public void setContactDAO(ContactDAO contactDAO) {
		this.contactDAO = contactDAO;
	}
	 public List<TbGroupContacts> getContactsByGroupId(String groupId)
	 {
		 int id=0;
		 if(groupId!=null)
		 {
			 id=Integer.parseInt(groupId);
		 }
		 return contactDAO.getContactsByGroupId(id);
	 }
	
	  public List<ContractsVo> getContactsByNotGroups()
	  {
		  return contactDAO.getContactsByNotGroups();
	  }
	@Override
	 public List<GroupContactsVo> queryByPage (int pageSize, int pageNow,String groupsId,Long userId) {
	  return contactDAO.queryByPage(pageSize, pageNow,groupsId,userId);
	 }
	
	@Override
	 public int maxPage(int pageSize, int pageNow,String groupsId,Long userId)
	 {
		 return contactDAO.maxPage(pageSize, pageNow,groupsId,userId);
	 }
	
	@Override
	public GroupContactsVo findContactById(Integer id)
	{
		return contactDAO.findContactById(id);
	}
	@Override
	public CommonDAO<TbContacts> getBindDao() {
		return contactDAO;
	}
	
}
