package com.unicom.mms.cms.action.web.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;


import org.apache.log4j.Logger;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;

import com.googlecode.jsonplugin.annotations.JSON;
import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.entity.TbCmsUser;
import com.unicom.mms.cms.entity.TbRole;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.cms.service.RightService;
import com.unicom.mms.cms.service.RoleService;
import com.unicom.mms.cms.service.UserService;
import com.unicom.mms.cms.vo.MenuEntity;
import com.unicom.mms.cms.vo.RightEntity;
import com.unicom.mms.common.BlankUtil;

public class RoleAction extends BaseAction<TbRole,String> {
	private static final long serialVersionUID = 1L;
	public static Logger log = Logger.getLogger(RightAction.class);

	@Autowired(required = true)
	private RoleService roleService;

	@Autowired(required = true)
	private RightService rightService;

	@Autowired(required=true)
	private UserService userService;

	public Long[] rightIds; //权限集合
	private List<Map<String, Object>> root = new ArrayList<Map<String, Object>>(); //存储菜单列表

	public List<Map<String, Object>> getRoot() {
		return root;
	}

	public void setRoot(List<Map<String, Object>> root) {
		this.root = root;
	}

	public Long[] getRightIds() {
		return rightIds;
	}

	public void setRightIds(Long[] rightIds) {
		this.rightIds = rightIds;
	}

	/**
	 * 保存角色
	 */
	public String saveRoleRight() {
		//保存角色
		roleService.save(this.model);
		Long roleId = this.model.getId();
		if(!BlankUtil.isBlank(rightIds) && rightIds.length>0){
			log.debug("rightIds:"+this.rightIds);
			roleService.insertRoleRight(roleId, rightIds);
		}
		return successInfo(null);
	}

	/**
	 * 修改角色
	 */
	public String updateRoleRight()	{
		//保存角色
		roleService.update(this.model);
		Long roleId = this.model.getId();
		if(!BlankUtil.isBlank(rightIds) && rightIds.length>0){
			log.debug("rightIds:"+this.rightIds);
			roleService.updateRoleRight(roleId, rightIds);
		}
		return successInfo(null);
	}

	/**
	 * 修改角色查询
	 * @return
	 */
	public String selectRole() {
		List<MenuEntity> menuList = rightService.queryMenu();  //查询菜单
		List<RightEntity> rightList = null;
		if(getModel().getId()!=null){
			Long roleId = getModel().getId();
			rightList = userService.queryRoleRightListByRoleId(roleId);
			log.info("select ringPolicy Entity id:" + roleId);
		}
		for (int i = 0; i < menuList.size(); i++) {  //遍历菜单，给该角色已有的权限赋�1�7�1�7
			MenuEntity me = menuList.get(i);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("text", getText(me.getMenuName()));
			map.put("expanded", true);
			map.put("id", me.getMenuId());
			map.put("leaf", false);
			if(null!=rightList){
				for (RightEntity rightEntity : rightList) {
					if(rightEntity.getRightId().intValue()==me.getMenuId().intValue()){
						map.put("checked", true);
						break;
					}else{
						map.put("checked", false);
					}
				}
				if (rightList.size() < 1) {
					map.put("checked", false);
				}
			}else{
				map.put("checked", false);
			}

			List<Hashtable<String, Object>> l = new ArrayList<Hashtable<String, Object>>();
			if (me.getList().size() > 0) {
				for (int j = 0; j < me.getList().size(); j++) {
					RightEntity re = me.getList().get(j);
					Hashtable<String, Object> h = new Hashtable<String, Object>();
					h.put("text", getText(re.getRightName()));
					h.put("leaf", true);
					h.put("expanded", false);

					//新增时得不到角色ID的修改为丄1�7
					if(null!=rightList){
						for (RightEntity rightEntity : rightList) {
							if(rightEntity.getRightId().intValue()==re.getRightId().intValue()){
								h.put("checked", true);
								break;
							}else{
								h.put("checked", false);
							}
						}
						if (rightList.size() < 1) {
							h.put("checked", false);
						}
					}else{
						h.put("checked", false);
					}
					//新增时得不到角色ID的修改为丄1�7

					h.put("id", re.getRightId());

					l.add(h);
					map.put("children", l);
				}
			}
			root.add(map);
		}
		return "menu";
	}

	/**
	 * 
	 * 方法用�1�7�和描述: 根据主键查找对象
	 * @return
	 * @author chenl 新增日期＄1�712-8-8
	 * @since ipmi_web
	 */
	public String findById(){
		log.debug("model:"+getModel().toString());
		model = roleService.getByPk(getModel().getId());
		return successInfo(null);
	}


	/**
	 * 重写使之有用户使用该角色时不让期删除
	 */
	public String delete() throws Exception {
		String msg="";
		String[] idss=(String[])getIds();
		List idsList = new ArrayList();
		int a=0;
		for(String id:idss){
			//获取角色对应的用戄1�7
			TbCmsUser user = userService.findByField("tbRole.id", Long.parseLong(idss[a]));
			a++;
			if(user==null){
				idsList.add(id);
			}
		}
		if(idsList.size()==0)		return successInfo("还存在该角色的用戄1�7,无法删除");
		if(idss.length>idsList.size())msg=",有用户占用的角色保留睄1�7";
		Long[] idslong = new Long[idsList.size()];
		for(int i=0;i<idsList.size();i++){
			idslong[i]=Long.parseLong(idsList.get(i).toString());
		}
		getCommonService().deleteAllByPks(idslong);
		return successInfo("删除成功"+msg);
	}


	@Override
	@JSON(serialize=false)
	public CommonService getCommonService() {
		return roleService;
	}

	@Override
	public TbRole getModel() {
		if(null == this.model){
			this.model = new TbRole();
		}
		return this.model;
	}

	@Override
	public void setModel(TbRole model) {
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
}
