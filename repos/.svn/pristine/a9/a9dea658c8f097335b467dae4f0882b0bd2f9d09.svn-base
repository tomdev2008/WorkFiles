package cn.com.mmsweb.action.web;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.mmsweb.service.CommonService;
import cn.com.mmsweb.service.GroupsService;
import cn.com.mmsweb.vo.GroupsVo;

import com.unicom.mms.entity.TbGroups;

public class GroupsAction extends BaseAction<TbGroups, String>{
	private static Logger log = Logger.getLogger(GroupsAction.class);
	@Autowired(required = true)
	private GroupsService groupsService;
	private List<TbGroups> list;
	private List<GroupsVo> groupList;
	
	
	public List<GroupsVo> getGroupList() {
		return groupList;
	}

	public void setGroupList(List<GroupsVo> groupList) {
		this.groupList = groupList;
	}

	public GroupsService getGroupsService() {
		return groupsService;
	}

	public void setGroupsService(GroupsService groupsService) {
		this.groupsService = groupsService;
	}

	public List<TbGroups> getList() {
		return list;
	}

	public void setList(List<TbGroups> list) {
		this.list = list;
	}

	public String findAll(){
		list=groupsService.findAll();
		return SUCCESS;
	}
	
	/**
	 * 
	* 方法用途和描述: 查询分组联系人
	* @return
	* @author chenliang 新增日期：2013-4-23
	* @since mms-web
	 */
	public String findGroups()
	{
		groupList=this.groupsService.findAllGroups();
		log.debug("list:"+groupList);
		return successInfo("ok");
	}
	@Override
	public CommonService getCommonService() {
		return groupsService;
	}

	@Override
	public TbGroups getModel() {
		if(null==this.model){
			this.model = new TbGroups();
		}
		return this.model;
	}

	@Override
	public void setModel(TbGroups model) {
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
