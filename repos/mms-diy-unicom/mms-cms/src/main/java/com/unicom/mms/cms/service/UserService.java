package com.unicom.mms.cms.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.unicom.mms.cms.entity.TbCmsUser;
import com.unicom.mms.cms.entity.TbRole;
import com.unicom.mms.cms.vo.MenuEntity;
import com.unicom.mms.cms.vo.RightEntity;

/**
 * 
* 功能描述: 系统用户管理业务逻辑处理接口
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
public interface UserService extends CommonService<TbCmsUser> {

	/**
	 * 
	 * 旧密验证
	 * 
	 * @param consumerID
	 * @param oldPasswd
	 * @return true 旧密码验证成功，false旧密码验证失败
	 * @author chenliang 新增日期2013-1-14
	 * @since mms-cms-unicom
	 */
	public boolean checkPasswd(Long userID, String oldPasswd);

	/**
	 * 
	 * 修改用户密码(含验证旧密码)
	 * 
	 * @param consumerID
	 * @param oldPasswd
	 * @param newPasswd
	 * @return
	 * @author chenliang 新增日期2013-1-14
	 * @since mms-cms-unicom
	 */
	public void updatePasswd(Long userId, String newPasswd);

	/**
	 * 
	 * 初始化用户密码,初始值为123456
	 * 
	 * @param consumerID
	 * @author chenliang 新增日期2013-1-14
	 * @since mms-cms-unicom
	 */
	public void initPasswd(Long userID);

	/**
	 * 
	 * 检查帐号是否被使用
	 * 
	 * @param account
	 * @return false 该账号不存在
	 * 		   true 账号已经存在
	 * @author chenliang 新增日期2013-1-14
	 * @since mms-cms-unicom
	 */
	public boolean checkAccount(String account);

	/**
	 *检查登陆
	 * @param account
	 * @return
	 */
	public TbCmsUser checkLogin(String account) ;


	/**
	 * 
	 * 获取用户角色列表
	 * 
	 * @param consumerId
	 * @return
	 * @author chenliang 新增日期2013-1-14
	 * @since mms-cms-unicom
	 */
	public TbRole queryConsumerRole(Long consumerId) ;

	/**
	 * 根据角色id查找对应的权限与角色的关系
	 * @param roleId
	 * @return
	 */
	public List<RightEntity> queryRoleRightListByRoleId(Long roleId) ;
	
	/**
	 * 根据角色id查找对应的权限菜单
	 * @param roleId
	 * @return
	 */
	public List<MenuEntity> queryMenuEntityByRoleId(Long roleId);
	
	/**
	 * 
	* 方法用途和描述: 从用户登录session中获取用户账号信息
	* @param session
	* @return
	 * @author chenliang 新增日期2013-1-14
	 * @since mms-cms-unicom
	 */
	public TbCmsUser queryConsumerEntityFromSession(HttpSession session);
}
