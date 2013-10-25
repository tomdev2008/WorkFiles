package cn.com.mmsweb.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.mmsweb.vo.ContractsVo;
import cn.com.mmsweb.vo.GroupContactsVo;
import cn.com.mmsweb.vo.GroupsVo;
import cn.com.mmsweb.vo.TemplateCardtVo;

import com.unicom.mms.entity.TbGroupContacts;
import com.unicom.mms.entity.TbGroups;

public class GroupsDAO extends CommonDAO<TbGroups> {
	private static Logger log = Logger.getLogger(GroupsDAO.class);
	@Autowired(required = true)
	private GroupContactsDAO groupContactsDAO;

	public GroupContactsDAO getGroupContactsDAO() {
		return groupContactsDAO;
	}

	public void setGroupContactsDAO(GroupContactsDAO groupContactsDAO) {
		this.groupContactsDAO = groupContactsDAO;
	}

	public List<GroupsVo> findAllGroups() {
		String hql = " from TbGroupContacts c where c.groups.id=? ";
		List<GroupsVo> groupsVos = new ArrayList<GroupsVo>();
		List<TbGroups> list = this.findAll();
		for (int i = 0; i < list.size(); i++) {
			GroupsVo groupsVo = new GroupsVo();

			TbGroups groups = list.get(i);
			groupsVo.setId("" + groups.getId()); //设置组id
			groupsVo.setName(groups.getName());  //设置组名

			List<TbGroupContacts> contactsList = groupContactsDAO.find(hql,groups.getId());
			List<ContractsVo> volist = new ArrayList<ContractsVo>();
			for (int j = 0; j < contactsList.size(); j++) {
				ContractsVo vo = new ContractsVo();
				vo.setId(""+contactsList.get(j).getContacts().getId());
				vo.setName(contactsList.get(j).getContacts().getName());
				vo.setMdn(contactsList.get(j).getContacts().getMdn());
				volist.add(vo);
			}
			groupsVo.setContactslist(volist);
			groupsVos.add(groupsVo);
		}
		return groupsVos;
	}
	
	 public String groupsName(int groupsId)
	 {
	
		 String sql=" from TbGroups g where g.id=?";
		   TbGroups groups=(TbGroups) this.findUnique(sql, groupsId);
      return groups.getName();
	 }
}
