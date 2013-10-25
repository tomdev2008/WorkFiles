package cn.com.mmsweb.service;

import com.unicom.mms.entity.TbUsers;

/**
 * 
* 功能描述: 系统用户管理业务逻辑处理接口
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
public interface UserService extends CommonService<TbUsers> {

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
	 *检查登陆
	 * @param account
	 * @return
	 */
	public TbUsers checkLogin(String account) throws Exception  ;

	/**
	 *修改密码
	 * @param account
	 * @return
	 */
	public void updatePWD(TbUsers users);

	/**
	 *根据用户号码查询
	 * @param account
	 * @return
	 */
	public TbUsers findByMsn(String msn);
}
