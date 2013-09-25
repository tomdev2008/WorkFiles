package cn.com.kxcomm.selfservice.action.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.kxcomm.base.action.BaseAction;
import cn.com.kxcomm.entity.RightEntity;
import cn.com.kxcomm.entity.RoleEntity;
import cn.com.kxcomm.entity.RoleRinghtEntity;
import cn.com.kxcomm.selfservice.service.RightService;
import cn.com.kxcomm.selfservice.service.RoleService;
import cn.com.kxcomm.selfservice.vo.MenuEntity;

/**
 * 
* 功能描述:角色控制层
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-10
* @author chenliang 修改日期：2013-9-10
* @since system_center_cms
 */
public class RoleAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	public static Logger log = Logger.getLogger(RightAction.class);
	@Autowired(required = true)
	private RoleService roleService;
	@Autowired(required = true)
	private RightService rightService;
	@Autowired(required = true)
	private RoleEntity roleEntity;
	private RoleRinghtEntity ringhtEntity;
	private List<RoleEntity> list;
	private List<RoleRinghtEntity> rightList;
	private ArrayList<MenuEntity> menuList;
	private String msg;
	private String success;
	private String id;
	private String city;
	private boolean saveTag;
	/**
	 * 总记录数
	 */
	private long totalCount;
	private int start;
	private int limit;

	public ArrayList<MenuEntity> getMenuList() {
		return menuList;
	}

	public void setMenuList(ArrayList<MenuEntity> menuList) {
		this.menuList = menuList;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public RoleEntity getRoleEntity() {
		return roleEntity;
	}

	public void setRoleEntity(RoleEntity roleEntity) {
		this.roleEntity = roleEntity;
	}

	public List<RoleEntity> getList() {
		return list;
	}

	public void setList(List<RoleEntity> list) {
		this.list = list;
	}

	public List<RoleRinghtEntity> getRightList() {
		return rightList;
	}

	public void setRightList(List<RoleRinghtEntity> rightList) {
		this.rightList = rightList;
	}

	public String getMsg() {
		return msg;
	}

	public RoleRinghtEntity getRinghtEntity() {
		return ringhtEntity;
	}

	public void setRinghtEntity(RoleRinghtEntity ringhtEntity) {
		this.ringhtEntity = ringhtEntity;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isSaveTag() {
		return saveTag;
	}

	public void setSaveTag(boolean saveTag) {
		this.saveTag = saveTag;
	}


	public String save() {
		if (roleEntity.getRoleId() == null) {
//			int roleId = this.roleService.save(roleEntity);
//			roleService.insertRoleRight(roleId, id);
//			roleService.insertRoleCity(roleId, city);
//			log.debug(roleEntity.toString());
//			msg = "ok";
//			try {
//				SystemLog sysLog = new SystemLog();
//				sysLog.setUserAccount(ConsumerService
//						.queryConsumerEntityFromSession(getHttpSession())
//						.getAccount()); // 用户账号
//				sysLog.setOperType(2); // 操作类型： 1、用户登录2、添加数据3、删除数据4、修改数据5、批量删除数据
//				sysLog.setOperName("syslog_role_save");// 操作名称,需要做国际化，统一以syslog_
//														// + action名称+方法名 的规范来写
//				sysLog.setOperResult(0); // 操作结果: 0表示成功，1失败
//				sysLog.setParameter(roleEntity.getRoleName()); // 操作参数说明:一般为操作记录的key
//				sysLog.setMemo("role_save"); // 备注:一般为添加的数据项名称 save role
//				LogService logService = LogService.getSingletonInstance();
//				logService.writerLog(sysLog);
//			} catch (Exception ex) {
//				log.error("syslogError:", ex);
//			}
		} else {
//			this.roleService.update(roleEntity);
//			roleService.updateRoleRight(roleEntity.getRoleId(), id);
//			msg = "ok";
//			log.debug(roleEntity.toString());
//			try {
//				SystemLog sysLog = new SystemLog();
//				sysLog.setUserAccount(ConsumerService
//						.queryConsumerEntityFromSession(getHttpSession())
//						.getAccount()); // 用户账号
//				sysLog.setOperType(4); // 操作类型： 1、用户登录2、添加数据3、删除数据4、修改数据5、批量删除数据
//				sysLog.setOperName("syslog_role_update");//操作名称,需要做国际化，统一以syslog_
//															// + action名称+方法名
//															// 的规范来写
//				sysLog.setOperResult(0); // 操作结果: 0表示成功，1失败
//				sysLog.setParameter(roleEntity.getRoleId().toString()+"|"+roleEntity.getRoleName()); //操作参数说明:
//																		// 一般为操作记录的key
//				sysLog.setMemo("role_update"); // 备注:一般为添加的数据项名称 update role
//				LogService logService = LogService.getSingletonInstance();
//				logService.writerLog(sysLog);
//			} catch (Exception ex) {
//				log.error("syslogError:", ex);
//			}
		}
		success = "true";
		this.setSaveTag(true);
		return SUCCESS;
	}

	private List<Map<String, Object>> editRightList = new ArrayList<Map<String, Object>>();

	public List<Map<String, Object>> getEditRightList() {
		return editRightList;
	}

	public void setEditRightList(List<Map<String, Object>> editRightList) {
		this.editRightList = editRightList;
	}

	public String selectRole() {
		log.debug("select ringPolicy Entity id:" + id);
		this.roleEntity = roleService.selectRole(id);
		this.rightList = roleService.selectRoleRinght(id);
		this.menuList = rightService.queryMenu();
		for (int i = 0; i < menuList.size(); i++) {
			MenuEntity me = menuList.get(i);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("text", getText(me.getMenuName()));
			map.put("cls", "folder");
			List<Hashtable<String, Object>> l = new ArrayList<Hashtable<String, Object>>();
			if (me.getList().size() > 0) {
				for (int j = 0; j < me.getList().size(); j++) {
					RightEntity re = me.getList().get(j);
					Hashtable<String, Object> h = new Hashtable<String, Object>();
					h.put("text", getText(re.getRightName()));
					h.put("leaf", true);

					for (int k = 0; k < rightList.size(); k++) {
						RoleRinghtEntity rre = rightList.get(k);
						if (rre.getRightId().intValue() == re.getRightId()
								.intValue()) {
							h.put("checked", true);
							break;
						} else {
							h.put("checked", false);
						}
					}
					if (rightList.size() < 1) {
						h.put("checked", false);
					}
					h.put("id", re.getRightId());

					l.add(h);
					map.put("children", l);
				}
			}
			editRightList.add(map);
		}

		msg = "ok";
		success = "true";
		return SUCCESS;
	}

	public String deleteRole() {
		roleService.deleteRole(id);
		msg = "ok";
		success = "true";

		try {
//			SystemLog sysLog = new SystemLog();
//			sysLog.setUserAccount(ConsumerService
//					.queryConsumerEntityFromSession(getHttpSession())
//					.getAccount()); // 用户账号
//			sysLog.setOperType(3); // 操作类型： 1、用户登录2、添加数据3、删除数据4、修改数据5、批量删除数据
//			sysLog.setOperName("syslog_role_delete");// 操作名称,需要做国际化，统一以syslog_ +
//														// action名称+方法名 的规范来写
//			sysLog.setOperResult(0); // 操作结果: 0表示成功，1失败
//			sysLog.setParameter(id); // 操作参数说明:一般为操作记录的key
//			sysLog.setMemo("role_delete"); // 备注:一般为添加的数据项名称 delete role
//			LogService logService = LogService.getSingletonInstance();
//			logService.writerLog(sysLog);
		} catch (Exception ex) {
			log.error("syslogError:", ex);
		}
		return SUCCESS;
	}

	public String deleteRoleByList() {
		roleService.deleteRoleRightByList(id);
		roleService.deleteRoleByList(id);
		msg = "ok";
		success = "true";

		try {
//			SystemLog sysLog = new SystemLog();
//			sysLog.setUserAccount(ConsumerService
//					.queryConsumerEntityFromSession(getHttpSession())
//					.getAccount()); // 用户账号
//			sysLog.setOperType(5); // 操作类型： 1、用户登录2、添加数据3、删除数据4、修改数据5、批量删除数据
//			sysLog.setOperName("syslog_role_batch_delete");// 操作名称,需要做国际化，
//															// 统一以syslog_ +
//															// action名称+方法名
//															// 的规范来写
//			sysLog.setOperResult(0); // 操作结果: 0表示成功，1失败
//			sysLog.setParameter(id); // 操作参数说明:一般为操作记录的key
//			sysLog.setMemo("role_batch_delete"); // 备注:一般为添加的数据项名称 delete role
//			LogService logService = LogService.getSingletonInstance();
//			logService.writerLog(sysLog);
		} catch (Exception ex) {
			log.error("syslogError:", ex);
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String list() throws Exception {
//		Page page = new Page(this.getHttpRequest());
//		RoleQueryVO tempVO = null;
//		if (BlankUtil.isBlank(this.getQueryVO())) {
//			tempVO = new RoleQueryVO();
//		} else {
//			tempVO = this.getQueryVO();
//		}
//		Page resultPage = roleService.queryRole(tempVO, page);
//		this.setList(resultPage.getResult());
//		this.totalCount = resultPage.getTotalCount();
		return SUCCESS;
	}

	public String listAll() throws Exception {
		this.list = roleService.queryAll();
		return SUCCESS;
	}


	public String deleteRoleRight() {
		roleService.deleteRoleRight(ringhtEntity);
		msg = "ok";
		success = "true";

		try {
//			SystemLog sysLog = new SystemLog();
//			sysLog.setUserAccount(ConsumerService
//					.queryConsumerEntityFromSession(getHttpSession())
//					.getAccount()); // 用户账号
//			sysLog.setOperType(5); // 操作类型： 1、用户登录2、添加数据3、删除数据4、修改数据5、批量删除数据
//			sysLog.setOperName("syslog_role_right_delete");// 操作名称,需要做国际化，
//															// 统一以syslog_ +
//															// action名称+方法名
//															// 的规范来写
//			sysLog.setOperResult(0); // 操作结果: 0表示成功，1失败
//			sysLog.setParameter(ringhtEntity.getRightId().toString()); //操作参数说明:
//																		// 一般为操作记录的key
//			sysLog.setMemo("role_right_delete"); // 备注:一般为添加的数据项名称 delete role_right
//			LogService logService = LogService.getSingletonInstance();
//			logService.writerLog(sysLog);
		} catch (Exception ex) {
			log.error("syslogError:", ex);
		}
		return SUCCESS;
	}

}
