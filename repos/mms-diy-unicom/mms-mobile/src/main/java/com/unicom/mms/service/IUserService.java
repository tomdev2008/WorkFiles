package com.unicom.mms.service;

import java.util.List;

import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.entity.TbUsers;
import com.unicom.mms.util.PageInfo;

/**
 * 
* 功能描述: 用户管理
* @author lizl 新增日期：2013-7-12
* @since mms-cms-unicom
 */
public interface IUserService extends ICommonService<TbUsers> {

	/**
	 * 
	 * 根据用户号码查询用户，若不存在则创建新用户
	 * 
	 * @return
	 * @author lizl 新增日期：2013-7-12
	 * @since mms-mobile
	 */
	public TbUsers queryUserByNumber(String phoneNum);
}
