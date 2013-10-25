package cn.com.mmsweb.service;

import java.util.List;

import cn.com.mmsweb.vo.GroupContactsVo;
import cn.com.mmsweb.vo.GroupsVo;

import com.unicom.mms.entity.TbGroupContacts;

public interface GroupContactsService extends CommonService<TbGroupContacts>{

	/**
	 * 分页查询我的联系人
	 * @return
	 */
	public List<GroupContactsVo> queryByPage (int pageSize, int pageNow,String groupsId);
	/**
	 * 总页数
	 * @return
	 */
	public int maxPage(int pageSize, int pageNow,String groupsId);

}
