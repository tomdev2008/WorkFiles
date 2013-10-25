package cn.com.mmsweb.action.web;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.mmsweb.service.CommonService;
import cn.com.mmsweb.service.GroupContactsService;
import cn.com.mmsweb.service.GroupsService;
import cn.com.mmsweb.vo.GroupContactsVo;

import com.unicom.mms.entity.TbGroupContacts;
import com.unicom.mms.entity.TbGroups;

public class GroupContactsAction extends BaseAction<TbGroupContacts, String>{
	private static Logger log = Logger.getLogger(GroupContactsAction.class);
	@Autowired(required = true)
	private GroupContactsService groupContactsService;
	@Autowired(required = true)
	private GroupsService groupsService;
	private int pageNow=1;
	private int pageSize=10;
	private String groupsId;
	private List<GroupContactsVo> listContacts;
	private int maxPage;   //最大页数
	private List<TbGroups> listGroups;
	
	
	
	public String getGroupsId() {
		return groupsId;
	}

	public void setGroupsId(String groupsId) {
		this.groupsId = groupsId;
	}

	public GroupsService getGroupsService() {
		return groupsService;
	}

	public void setGroupsService(GroupsService groupsService) {
		this.groupsService = groupsService;
	}


	public List<TbGroups> getListGroups() {
		return listGroups;
	}

	public void setListGroups(List<TbGroups> listGroups) {
		this.listGroups = listGroups;
	}



	public GroupContactsService getGroupContactsService() {
		return groupContactsService;
	}

	public void setGroupContactsService(GroupContactsService groupContactsService) {
		this.groupContactsService = groupContactsService;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<GroupContactsVo> getListContacts() {
		return listContacts;
	}

	public void setListContacts(List<GroupContactsVo> listContacts) {
		this.listContacts = listContacts;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	  /*
     * 分页查询我的联系人
     */
	 public String listContract()
	 {
		 this.listContacts=groupContactsService.queryByPage(pageSize, pageNow,null);
		 maxPage=groupContactsService.maxPage(pageSize, pageNow,groupsId);
		 listGroups=groupsService.findAll();
		 return SUCCESS;
	 }
	
	 public String contractByGroupsId()
	 {
		 this.listContacts=groupContactsService.queryByPage(pageSize, pageNow,groupsId);
		 maxPage=groupContactsService.maxPage(pageSize, pageNow,groupsId);
		 listGroups=groupsService.findAll();
		 return SUCCESS;
	 }
	
	@Override
	public CommonService getCommonService() {
		return groupContactsService;
	}

	@Override
	public TbGroupContacts getModel() {
		if(null==this.model){
			this.model = new TbGroupContacts();
		}
		return this.model;
	}

	@Override
	public void setModel(TbGroupContacts model) {
		this.model = model;
	}

	@Override
	public String[] getIds() {
		return this.ids;
	}

	@Override
	public void setIds(String[] ids) {
		this.ids = ids;
	}

}
