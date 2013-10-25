package cn.com.mmsweb.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sun.security.krb5.internal.TGSRep;

import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.service.GroupContactsService;
import cn.com.mmsweb.vo.GroupContactsVo;
import cn.com.mmsweb.dao.GroupContactsDAO;

import com.unicom.mms.entity.TbGroupContacts;
@Service("groupContactsService")
public class GroupContactsServiceImpl extends CommonServiceImpl<TbGroupContacts> implements GroupContactsService{
	private static Logger log = Logger.getLogger(GroupContactsServiceImpl.class);
	@Autowired(required = true)
	private GroupContactsDAO groupContactsDAO;
	

	

	public GroupContactsDAO getGroupContactsDAO() {
		return groupContactsDAO;
	}

	public void setGroupContactsDAO(GroupContactsDAO groupContactsDAO) {
		this.groupContactsDAO = groupContactsDAO;
	}

	 public TbGroupContacts findByContactsId(int userId,int contactsId){
		 TbGroupContacts groupContacts=new TbGroupContacts();
		 StringBuffer sb=new StringBuffer();
		   sb.append(" select a.name,a.mdn,a.birthday,a.id,tt.name tname,a.email,,tt.cid from tb_contacts a left join ");
		   sb.append(" (select c.id cid,b.contacts_id bid,c.name,b.groups_id bgid from tb_group_contacts b,tb_groups c where b.groups_id = c.id) tt ");
		   sb.append(" ON a.id=tt.bid where 1=1 ");
		   sb.append(" and a.id=? ");
		   sb.append(" and a.user_id="+userId+" order by a.id");
		   List list=groupContactsDAO.findByContactsId(sb.toString(), contactsId);
		   Object[] obj = new Object[list.size()];
		   for(int i = 0; i < list.size(); i++){
			   obj = (Object[])list.get(i);
		   }
		   return groupContacts;
	 }

	@Override
	 public List<GroupContactsVo> queryByPage (int pageSize, int pageNow,String groupsId) {
	  return groupContactsDAO.queryByPage(pageSize, pageNow, groupsId);
	 }
	
	@Override
	 public int maxPage(int pageSize, int pageNow,String groupsId)
	 {
		 return groupContactsDAO.maxPage(pageSize, pageNow,groupsId);
	 }

	@Override
	public CommonDAO<TbGroupContacts> getBindDao() {
		return groupContactsDAO;
	}
}
