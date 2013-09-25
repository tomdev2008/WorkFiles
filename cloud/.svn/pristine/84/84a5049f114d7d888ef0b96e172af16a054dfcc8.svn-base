package cn.com.kxcomm.selfservice.service.impl;

import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.kxcomm.base.dao.CommonDAO;
import cn.com.kxcomm.entity.RoleEntity;
import cn.com.kxcomm.entity.RoleRinghtEntity;
import cn.com.kxcomm.selfservice.dao.RoleDAO;
import cn.com.kxcomm.selfservice.service.RoleService;


@Service("RoleService")
public class RoleServiceImpl extends CommonServiceImpl<RoleEntity> implements RoleService {
	public static Logger log = Logger.getLogger(RightServiceImpl.class);
	@Autowired(required = true)
	private RoleDAO roleDAO;

	/**
	 * 
	 * 返回所有角色列表
	 * 
	 * @return
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public ArrayList<RoleEntity> queryAll() {
		return (ArrayList<RoleEntity>) roleDAO.listAll(RoleEntity.class);
	}

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
	public RoleEntity selectRole(String id) {
		return roleDAO.get(RoleEntity.class, id);
	}

	/**
	 * 
	 * 更新角色信息
	 * 
	 * @param entity
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void update(RoleEntity entity) {
		roleDAO.update(entity);
	}

	/**
	 * 
	 * 删除角色
	 * 
	 * @param id
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void deleteRole(String id) {
		roleDAO.delete(RoleEntity.class, id);
	}

	/**
	 * 
	 * 批量删除角色信息
	 * 
	 * @param id
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void deleteRoleByList(String id) {
		String[] ids = id.split(",");
		roleDAO.delete(RoleEntity.class, ids);
	}
	


	/**
	 * 
	 * 删除角色与权限的关联
	 * 
	 * @param entity
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void deleteRoleRight(RoleRinghtEntity entity) {
		roleDAO.deleteRoleRight(entity);
	}
	public void deleteRoleRightByList(String id) {
		
		String[] ids = id.split(",");
		for(int i = 0;i < ids.length; i++) {
			
			RoleRinghtEntity ringhtEntity = new RoleRinghtEntity();
			ringhtEntity.setRoleId(Integer.parseInt(ids[i]));
			deleteRoleRight(ringhtEntity);
		}
	}

	/**
	 * 
	 * 新增角色与权限的关联
	 * 
	 * @param entity
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void insertRoleRight(int roleId,String rightIds) {
		if(!rightIds.equals("")){
			String[] ids = rightIds.split(",");
			RoleRinghtEntity entity = new RoleRinghtEntity();
			entity.setRoleId(roleId);
			for(int i=0;i<ids.length;i++){
				entity.setRightId(Integer.parseInt(ids[i]));
				roleDAO.insertRoleRight(entity);
			}
		}
	}

	/**
	 * 
	 * 更新角色与权限的关联
	 * 
	 * @param entity
	 * @author zhangjh 新增日期：2010-6-21
	 * @author 你的姓名 修改日期：2010-6-21
	 * @since zte_crbt_bi
	 */
	public void updateRoleRight(int roleId,String rightIds) {
		if(!rightIds.equals("")){
			RoleRinghtEntity entity = new RoleRinghtEntity();
			entity.setRoleId(roleId);
			roleDAO.deleteRoleRight(entity);
			log.debug("删除角色的所有权限.");
			insertRoleRight(roleId,rightIds);
			log.debug("建立新的角色权限关系.");
		}else{
            RoleRinghtEntity entity = new RoleRinghtEntity();
			entity.setRoleId(roleId);
			roleDAO.deleteRoleRight(entity);
			log.debug("删除角色的所有权限.");
                }
	}

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
	public ArrayList<RoleRinghtEntity> selectRoleRinght(String id) {
		return roleDAO.selectRoleRinght(id);
	}

	@Override
	public CommonDAO<RoleEntity> getBindDao() {
		return roleDAO;
	}
}
