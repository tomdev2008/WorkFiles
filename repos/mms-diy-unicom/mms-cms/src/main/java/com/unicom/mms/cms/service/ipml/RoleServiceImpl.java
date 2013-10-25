package com.unicom.mms.cms.service.ipml;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.RoleDAO;
import com.unicom.mms.cms.entity.TbRightRole;
import com.unicom.mms.cms.entity.TbRightRoleId;
import com.unicom.mms.cms.entity.TbRole;
import com.unicom.mms.cms.service.RoleService;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.common.Page;

/**
 * 
* 功能描述:角色管理业务逻辑处理类
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Service("roleService")
public class RoleServiceImpl extends CommonServiceImpl<TbRole> implements RoleService {
	
	public static Logger log = Logger.getLogger(RightServiceImpl.class);
	
	@Autowired(required = true)
	private RoleDAO roleDAO;
	
	@Override
	public CommonDAO<TbRole> getBindDao() {
		return roleDAO;
	}
	
	
	/**
	 * 重写分页方法
	 */
	@Override
	public Page<TbRole> findByPage(TbRole entity, Page<TbRole> pageInfo) {
		StringBuffer hql = new StringBuffer(" from TbRole tr where 1=1 ");
		if(!BlankUtil.isBlank(entity)){
			if(!BlankUtil.isBlank(entity.getRolename())){
				hql.append(" and tr.rolename like ? ");
				entity.setRolename("%"+entity.getRolename()+"%");
			}
			return roleDAO.findByPage(pageInfo, hql.toString(), entity.getRolename());
		}else{
			return roleDAO.findByPage(pageInfo, hql.toString());
		}
	}



	/**
	 * 插入角色与权限的关系
	 */
	@Override
	public void insertRoleRight(Long roleId, Long[] rightIds) {
		log.debug("insert roleRight ,rightIds:"+rightIds.toString());
		if(!BlankUtil.isBlank(rightIds)){
			for (int i = 0; i < rightIds.length; i++) {
				TbRightRoleId rightRole = new TbRightRoleId();
				rightRole.setRoleId(roleId);
				rightRole.setRightId(rightIds[i]);
				TbRightRole rightRole2 = new TbRightRole();
				rightRole2.setId(rightRole);
				roleDAO.insertRoleRight(rightRole2);
				log.debug("insert roleRight successful.");
			}
		}else{
			log.debug("rightIds is null ,insert fail.");
			return;
		}
	}
	
	/**
	 * 更新角色和权附1�7
	 */
	@Override
	public void updateRoleRight(Long roleId, Long[] rightIds) {
		log.debug("update roleRight ,rightIds:"+rightIds.toString());
		if(!BlankUtil.isBlank(rightIds)){
			String hql = "delete TbRightRole tr where tr.id.roleId=? ";
			//删除该角色之前的扄1�7有权附1�7
			int result = roleDAO.executeByHQL(hql, roleId);
			if(result>0){
				log.debug("delete tbRightRole by roleId success.insert rightRole.");
				//更新新的全新id
				for (int i = 0; i < rightIds.length; i++) {
					TbRightRoleId rightRole = new TbRightRoleId();
					rightRole.setRoleId(roleId);
					rightRole.setRightId(rightIds[i]);
					TbRightRole rightRole2 = new TbRightRole();
					rightRole2.setId(rightRole);
					roleDAO.updateRoleRight(rightRole2);
					log.debug("update roleRight successful.");
				}
			}else{
				log.debug("delete tbRightRole by roleId fail.");
				return;
			}
		}else{
			String hql = "delete TbRightRole tr where tr.id.roleId=? ";
			//权限id为空，删除该角色之前的所有权附1�7
			int result = roleDAO.executeByHQL(hql, roleId);
			if(result>0){
				log.debug("update tbRightRole by roleId success.");
			}else{
				log.debug("update tbRightRole by roleId fail.");
			}
		}
	}
	
}
