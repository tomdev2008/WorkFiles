package cn.com.kxcomm.selfservice.service;

import java.util.ArrayList;

import cn.com.kxcomm.entity.RoleEntity;
import cn.com.kxcomm.entity.RoleRinghtEntity;

/**
 * 
* 功能描述: 角色业务逻辑处理接口
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
public interface RoleService extends CommonService<RoleEntity> {



	/**
	 * 
	 * 返回所有角色列表
	 * 
	 * @return
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public ArrayList<RoleEntity> queryAll();

	/**
	 * 
	 * 通过ID返回角色信息
	 * 
	 * @param id
	 * @return
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public RoleEntity selectRole(String id) ;

	/**
	 * 
	 * 更新角色信息
	 * 
	 * @param entity
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void update(RoleEntity entity) ;

	/**
	 * 
	 * 删除角色
	 * 
	 * @param id
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void deleteRole(String id) ;

	/**
	 * 
	 * 批量删除角色信息
	 * 
	 * @param id
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void deleteRoleByList(String id) ;
	


	/**
	 * 
	 * 删除角色与权限的关联
	 * 
	 * @param entity
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void deleteRoleRight(RoleRinghtEntity entity) ;
	
	public void deleteRoleRightByList(String id) ;

	/**
	 * 
	 * 新增角色与权限的关联
	 * 
	 * @param entity
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void insertRoleRight(int roleId,String rightIds);

	/**
	 * 
	 * 更新角色与权限的关联
	 * 
	 * @param entity
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void updateRoleRight(int roleId,String rightIds);

	/**
	 * 
	 * 返回角色与权限的所有关联
	 * 
	 * @param id
	 * @return
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public ArrayList<RoleRinghtEntity> selectRoleRinght(String id);

}
