package com.unicom.mms.web.action;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.googlecode.jsonplugin.annotations.JSON;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.entity.TbUsers;
import com.unicom.mms.service.ICommonService;
import com.unicom.mms.service.impl.TemlateCardService;
import com.unicom.mms.service.impl.UserService;
import com.unicom.mms.util.PageInfo;
import com.unicom.mms.web.BaseAction;

/**
 * 用户管理
 * @author lizl
 *
 */
public class UserAction extends BaseAction<TbUsers, String> {
	private static final long serialVersionUID = -3967668845332516363L;

	private static final Logger LOGGER = Logger.getLogger(UserAction.class);

	@Autowired(required=true)
	private UserService userService;

	@JSON(serialize=false)
	@Override
	public ICommonService getCommonService() {
		return userService;
	}
	
	@Override
	public TbUsers getModel() {
		if(null == this.model){
			this.model = new TbUsers();
		}
		return this.model;
	}

	@Override
	public void setModel(TbUsers model) {
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
	
	@Override
	public PageInfo<TbUsers> getPageList() {
		if(null == this.pageList){
			this.pageList = new PageInfo<TbUsers>();
		}
		return this.pageList;
	}

	@Override
	public void setPageList(PageInfo<TbUsers> pageList) {
		this.pageList = pageList;
		
	}
	
	public String id;
	
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 
	 * 根据用户号码查询用户，若不存在则创建新用户
	 * 
	 * @return
	 * @author lizl 新增日期：2013-7-12
	 * @since mms-mobile
	 */
	public String queryUserByNumber() {
		if(null == this.id || "".equals(this.id)){
			return ERROR;
		}
		TbUsers tbUsers = this.userService.queryUserByNumber(this.id);
		if(null == tbUsers){
			return ERROR;
		} else {
			this.setModel(tbUsers);
			HttpSession session = this.getHttpSession();
			session.setAttribute("userId",tbUsers.getId());
		}
		return SUCCESS;
	}
}
