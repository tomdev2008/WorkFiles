package cn.com.kxcomm.selfservice.service;

import java.util.ArrayList;
import java.util.List;

import cn.com.kxcomm.entity.RightEntity;
import cn.com.kxcomm.entity.RoleEntity;
import cn.com.kxcomm.selfservice.vo.MenuEntity;

public interface RightService extends CommonService<RightEntity> {
	
	public void save(RightEntity entity) ;

	/**
	 * 
	 * 通过ID获得权限信息
	 * 
	 * @param id
	 * @return
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public RightEntity selectRight(String id) ;

	/**
	 * 
	 * 更新权限信息
	 * 
	 * @param entity
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void update(RightEntity entity);

	/**
	 * 
	 * 删除权限
	 * 
	 * @param id
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void deleteRight(String id);

	/**
	 * 
	 * 批量删除权限
	 * 
	 * @param id
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void deleteRightByList(String id);

	/**
	 * 
	 * 返回所有的权限列表
	 * 
	 * @return
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public ArrayList<RightEntity> queryAll() ;
	/**
	 * 
	 * 返回菜单对象
	 * 
	 * @return
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public ArrayList<MenuEntity> queryMenu() ;
	
	/**
	 * 
	* 方法用途和描述: 返回用户角色对应的菜单对象
	* @param roleId
	* @return
	* @author chenhui 新增日期：2010-6-23
	* @author 你的姓名 修改日期：2010-6-23
	* @since zte_crbt_bi
	 */
	public ArrayList<MenuEntity> queryMenu(Integer roleId) ;

}
