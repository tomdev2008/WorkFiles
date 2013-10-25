package com.unicom.mms.mcp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbContacts;
import com.unicom.mms.entity.TbGroupContacts;
import com.unicom.mms.entity.TbGroups;
import com.unicom.mms.mcp.dao.ContactsDAO;
import com.unicom.mms.mcp.dao.GroupContactsDAO;
import com.unicom.mms.mcp.dao.GroupsDAO;

@Service("groupsService")
public class GroupsService {
	@Autowired(required = true)
	private GroupsDAO groupsDAO;
	@Autowired(required = true)
	private GroupContactsDAO groupContactsDAO;
	@Autowired(required = true)
	private ContactsDAO contactsDAO;
	public void saveOrUpdate(TbGroups entity,List<TbContacts> list) throws RuntimeException{
		if(entity!=null){
			this.groupsDAO.getHibernateTemplate().saveOrUpdate(entity);
		}
		if(null!=list){
			if(!list.isEmpty()){
				for(int i = 0 ; i < list.size() ; i++){
					TbContacts tc = list.get(i);
					TbGroupContacts tgc = new TbGroupContacts();
					tgc.setContacts(tc);
					tgc.setGroups(entity);
					groupContactsDAO.getHibernateTemplate().saveOrUpdate(tgc);
				}
			}
		}
	}
	
	
	public void delete(TbGroups entity){
		this.groupContactsDAO.executeByHQL("delete TbGroupContacts tc where tc.groups.id = ?", new Object[]{entity.getId()});
		this.groupsDAO.delete(entity);
	}
}
