package cn.com.mmsweb.service;

import java.util.List;

import com.unicom.mms.entity.TbContacts;
import com.unicom.mms.entity.TbGroupContacts;

import cn.com.mmsweb.vo.ContractsVo;
import cn.com.mmsweb.vo.GroupContactsVo;

public interface ContactService extends CommonService<TbContacts>{
	/**
	 * 根据ID查询联系人信息
	 * @return
	 */
	public GroupContactsVo findContactById(Integer id);
	
	
	 public List<GroupContactsVo> queryByPage (int pageSize, int pageNow,String groupsId,Long userId);
	 
	
	 public int maxPage(int pageSize, int pageNow,String groupsId,Long userId);
	 
	 public List<TbGroupContacts> getContactsByGroupId(String groupId);
	 
	  public List<ContractsVo> getContactsByNotGroups();

}
