package cn.com.mmsweb.service;

import java.util.List;


import cn.com.mmsweb.vo.GroupsVo;

import com.unicom.mms.entity.TbGroups;

public interface GroupsService extends CommonService<TbGroups>{

	/**
	 * 查询分组
	 * @return
	 */
	public List<TbGroups> findAll();
	
	/**
	 * 查询分组下的联系人
	 * @return
	 */
	public List<GroupsVo> findAllGroups();
	
	public String groupsName(String groupsId);
}
