package cn.com.kxcomm.selfservice.service.impl;

import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.kxcomm.base.dao.CommonDAO;
import cn.com.kxcomm.entity.RightEntity;
import cn.com.kxcomm.entity.RoleEntity;
import cn.com.kxcomm.selfservice.dao.RightDAO;
import cn.com.kxcomm.selfservice.service.RightService;
import cn.com.kxcomm.selfservice.vo.MenuEntity;


@Service("RightService")
public class RightServiceImpl extends CommonServiceImpl<RightEntity> implements RightService {
	public static Logger log = Logger.getLogger(RightServiceImpl.class);
	@Autowired(required = true)
	private RightDAO rightDAO;

	/**
	 * 
	 * 新增权限
	 * 
	 * @param entity
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void save(RightEntity entity) {
		rightDAO.save(entity);
	}

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
	public RightEntity selectRight(String id) {
		return rightDAO.get(RightEntity.class, id);
	}

	/**
	 * 
	 * 更新权限信息
	 * 
	 * @param entity
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void update(RightEntity entity) {
		rightDAO.update(entity);
	}

	/**
	 * 
	 * 删除权限
	 * 
	 * @param id
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void deleteRight(String id) {
		rightDAO.delete(RightEntity.class, id);
	}

	/**
	 * 
	 * 批量删除权限
	 * 
	 * @param id
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void deleteRightByList(String id) {
		String[] ids = id.split(",");
		rightDAO.delete(RightEntity.class, ids);
	}

	/**
	 * 
	 * 返回所有的权限列表
	 * 
	 * @return
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public ArrayList<RightEntity> queryAll() {
		return (ArrayList<RightEntity>) rightDAO.listAll(RoleEntity.class);
	}

	/**
	 * 
	 * 返回菜单对象
	 * 
	 * @return
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public ArrayList<MenuEntity> queryMenu() {
		return rightDAO.queryMenu();
	}
	
	/**
	 * 
	* 方法用途和描述: 返回用户角色对应的菜单对象
	* @param roleId
	* @return
	* @author chenhui 新增日期：2010-6-23
	* @author 你的姓名 修改日期：2010-6-23
	* @since zte_crbt_bi
	 */
	public ArrayList<MenuEntity> queryMenu(Integer roleId) {
		return rightDAO.queryMenu(roleId);
	}

	@Override
	public CommonDAO<RightEntity> getBindDao() {
		return rightDAO;
	}
}
