package cn.com.kxcomm.selfservice.action.system;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;

import com.googlecode.jsonplugin.annotations.JSON;

import cn.com.kxcomm.common.MD5;
import cn.com.kxcomm.selfservice.action.BaseAction;
import cn.com.kxcomm.selfservice.action.util.SessionUtils;
import cn.com.kxcomm.selfservice.entity.TbCmsUser;
import cn.com.kxcomm.selfservice.entity.TbRightRole;
import cn.com.kxcomm.selfservice.entity.TbRole;
import cn.com.kxcomm.selfservice.service.CmsUserService;
import cn.com.kxcomm.selfservice.service.CommonService;
import cn.com.kxcomm.selfservice.service.impl.CmsUserServiceImpl;
import cn.com.kxcomm.selfservice.vo.MenuEntity;
import cn.com.kxcomm.selfservice.vo.RightEntity;
import cn.com.kxcomm.selfservice.vo.UserRightEntity;


public class CmsUserAction extends BaseAction<TbCmsUser, String> {

	private static final long serialVersionUID = 1L;
	private String roleid;
	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	@Autowired(required=true)
	public CmsUserService cmsUserService = new CmsUserServiceImpl();


	public TbRole roleEntity; //角色实体
	public List<TbRightRole> rightRoleList; //权限列表
	public String verificationCode;  //验证砄1�7
	public UserRightEntity userRightEntity; //用户权限信息（访问控制用＄1�7
	public List<Hashtable<String, String>> listMenu; //前台菜单数据结构
	
	public List<Hashtable<String, String>> getListMenu() {
		return listMenu;
	}

	public void setListMenu(List<Hashtable<String, String>> listMenu) {
		this.listMenu = listMenu;
	}

	public UserRightEntity getUserRightEntity() {
		return userRightEntity;
	}

	public void setUserRightEntity(UserRightEntity userRightEntity) {
		this.userRightEntity = userRightEntity;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	public TbRole getRoleEntity() {
		return roleEntity;
	}

	public void setRoleEntity(TbRole roleEntity) {
		this.roleEntity = roleEntity;
	}

	public List<TbRightRole> getRightRoleList() {
		return rightRoleList;
	}

	public void setRightRoleList(List<TbRightRole> rightRoleList) {
		this.rightRoleList = rightRoleList;
	}

	
	/**
	 * 
	 * 方法用�1�7�和描述: 获取用户登录后的菜单信息
	 * @return
	 * @author chenhui 新增日期＄1�710-6-23
	 * @author 你的姓名 修改日期＄1�710-6-23
	 * @since zte_ipmi_bi
	 */
	public String queryMenuById() {
		HttpSession session = getHttpSession();
		UserRightEntity ueInSession = (UserRightEntity) session.getAttribute(SessionUtils.USER);
		
		if(ueInSession==null){
			return successInfo("error");
		}else{
			model = ueInSession.getUserEntity();
			String path = getHttpRequest().getContextPath(); //Struts2Util.getHttpRequest().getContextPath();

			listMenu = new ArrayList<Hashtable<String,String>>();
			List<MenuEntity> menuList = ueInSession.getMenuList();
			StringBuffer sb = new StringBuffer();
			for(int i = 0 ; i < menuList.size() ; i++){
				MenuEntity me = menuList.get(i);
				if(me.getList().size()>0){
					Hashtable<String,String> h = new Hashtable<String,String>();
					h.put("title","<b>"+getText(me.getMenuName())+"</b>");
					h.put("collapsed","true");
					h.put("autoScroll","true");
					//sb.append("<div style='height:320px;overflow-y:auto;'>");
					for(int j = 0 ; j < me.getList().size() ; j++){
						RightEntity re = me.getList().get(j);
						sb.append("<div class=changPage style=\"background-color:#9EBFEA;padding:4px;margin:0px 0px -13px 0px\"><a href=\"javascript:goPage('"+re.getRightId()+"','"+getText(re.getRightName())+"','"+path+re.getUrl()+"')\">"+getText(re.getRightName())+"</a></div></br>");
					}	
					//sb.append("</div>");
					h.put("html", sb.toString());

					sb.delete(0, sb.toString().length());
					listMenu.add(h);
				}
			}
		}
		this.success = true;		
		this.msg = "操作成功";
		return "menu";
	}
	/**
	 * 
	 * 方法用�1�7�和描述: 获取用户登录后的用户信息
	 * @return
	 * @author chenliang 新增日期＄1�710-6-24
	 * @author 你的姓名 修改日期＄1�710-6-24
	 * @since zte_ipmi_bi
	 */
	public String queryConsumerEntity() {
		UserRightEntity userInSession = (UserRightEntity) getHttpSession().getAttribute(SessionUtils.USER);//SessionUtils.getUser();

		if(userInSession==null){
			return successInfo("error");
		}else{
			model = userInSession.getUserEntity();	
		}
		return successInfo("ok");
	}


	/**
	 * 
	 * 方法用�1�7�和描述: 用户登录
	 * @return
	 * @author chenhui 新增日期＄1�710-6-22
	 * @author 你的姓名 修改日期＄1�710-6-22
	 * @throws SQLException 
	 * @throws IOException 
	 * @throws ServletException 
	 * @since zte_ipmi_bi
	 */
	public String login() throws SQLException, ServletException, IOException {
		this.success = true;
		HttpSession session = getHttpSession();
		log.debug("session verificationCode:"+session.getAttribute(SessionUtils.VERIFICATION_CODE));
		if (null == getModel().getAccouont() || null == getModel().getPassword()) {
			log.debug("输入的账号，密码为空，登录失贄1�7...");
			//			msg="error";
			return successInfo("error");
		} else if (!verificationCode.equals(session.getAttribute(SessionUtils.VERIFICATION_CODE))) {
			log.debug("输入的验证码错误，登录失贄1�7...");
			//			this.success = true;
			//			msg="verificationCodeError";
			return successInfo("verificationCodeError");
		}
		String passwd = MD5.toMD5(getModel().getPassword());
		log.debug("[after MD5,account,passwd]:" +  getModel().getAccouont()+","+getModel().getPassword());
		TbCmsUser ce = null;
		try {
			log.debug("[=============cmsUserService=============]"+cmsUserService);
			ce = cmsUserService.checkLogin(getModel().getAccouont());
		} catch (Exception ex) {
			log.error("checkLogin() Error:", ex);
		}
		log.debug("[in method login(),ce]:" + ce);
		if (null == ce) {
			log.debug("用户名不存在,登陆失败...");
			return successInfo("usererror");
			//			return failInfo("error");
		}
		if(ce.getPassword().equals(passwd)){
			userRightEntity = new UserRightEntity();
			userRightEntity.setUserEntity(ce);
			//将用户id信息放入session
			//			SessionUtils.setUserId(ce.getId());
			session.setAttribute(SessionUtils.USER_ID, ce.getId());
			// 1〄1�7 根据用户登录账号，查询用户角艄1�7
			TbRole roleEntity = cmsUserService.queryConsumerRole(ce.getId());
			log.debug("[用户角色列表roleEntity]:" + roleEntity);
			// 用户具有角色信息
			if (roleEntity != null) {				
				Long roleId = roleEntity.getId();
				//将用户角色id信息放入session
				//				SessionUtils.setUserRoleId(roleId);
				session.setAttribute(SessionUtils.USER_ROLE_ID, roleId);
				log.debug("[用户具有角色信息roleId]:" + roleId);

				//2、根据角色ID，获取角色具有的访问权限信息（功能level丄1�7�1�7�和3的）
				List<RightEntity> rightList = cmsUserService.queryRoleRightListByRoleId(roleId);
				//				SessionUtils.setUserRights(rightList);
				session.setAttribute(SessionUtils.USER_RIGHTS, rightList);
				log.debug("[用户具有的角色访问权限信恄1�7****rightList size****]"+rightList.size()+"[rightlist]"+Json.toJson(rightList));

				//3〄1�7 根据角色ID，获取角色具有的访问权限信息（菜单）
				List<MenuEntity> menuList =cmsUserService.queryMenuEntityByRoleId(roleId);
				log.debug("[具有权限访问的菜单列衄1�7****menuList size****]"+menuList.size()+"[menulist]"+Json.toJson(menuList));

				userRightEntity.setUserRightList(rightList);
				userRightEntity.setMenuList(menuList);

			} else { // 用户不具有任何角艄1�7
				log.debug("不具备任何角艄1�7" + roleEntity);
			}
			// 4〄1�7 将用户授权信息放入session
			log.debug("将用户授权信息放入session,userRightEntity:"+userRightEntity);
			session.setAttribute(SessionUtils.USER,userRightEntity);
			return successInfo("ok");
		} else {
			return successInfo("passworderror");
		}
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	/**
	 * 
	 * 方法用�1�7�和描述: 用户注销
	 * @return
	 * @author chenhui 新增日期＄1�710-6-23
	 * @author 你的姓名 修改日期＄1�710-6-23
	 * @throws IOException 
	 * @throws ServletException 
	 * @since zte_ipmi_bi
	 */
	public String loginOut() throws IOException, ServletException {
		HttpSession session = getHttpSession();
		UserRightEntity ceInSession = (UserRightEntity) session.getAttribute(SessionUtils.USER);
		if (null != ceInSession) {
			String account = ceInSession.getUserEntity().getAccouont();
			session.removeAttribute(SessionUtils.USER);
			ceInSession = null;
			log.debug("用户" + account + "成功逄1�7出系组1�7");
		}
		HttpServletRequest request = getHttpRequest();// Struts2Util.getHttpRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path;
		getHttpResponse().sendRedirect(basePath);
		return NONE;
	}

	/**
	 * 旧密码验评1�7
	 * @return
	 */
	public String checkPasswd(){
		String str = "ok";
		try{		
			HttpSession session = getHttpSession();
			UserRightEntity entity = (UserRightEntity) session.getAttribute(SessionUtils.USER);
			Long userId = entity.getUserEntity().getId();
			String oldPasswd = getModel().getPassword();
			boolean flag = cmsUserService.checkPasswd(userId, oldPasswd);
			if(flag){
				str = "ok";
			}else{
				str = "no";
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return successInfo(str);
	}

	/**
	 * 修改密码
	 * @return
	 */
	public String updatePasswd(){
		HttpSession session = getHttpSession();
		UserRightEntity entity = (UserRightEntity) session.getAttribute(SessionUtils.USER);
		Long userId = entity.getUserEntity().getId();
		log.debug("userId:"+userId+"  getPassword"+getModel().getPassword());
		cmsUserService.updatePasswd(userId,getModel().getPassword());
		return successInfo("ok");
	}

	/**
	 * 密码初始匄1�7
	 * @return
	 */
	public String initPasswd(){
		Long userId = getModel().getId();
		log.debug("initPasswd id:"+userId);
		cmsUserService.initPasswd(userId);
		return successInfo("ok");
	}

	public String delete(){
		log.debug("delete id:" + ids);
		String idstr="";
		int i=0;
		Long[] idslong=new Long[ids.length];
		for(String id:ids){
			TbCmsUser user = cmsUserService.getByPk(Long.parseLong(id));
			if(i>0)
				idstr+=",";
		    idslong[i]=Long.parseLong(ids[i]);
			i++;
			if(user.getAccouont().equals("admin"))
				return successInfo("系统默认管理员不允许删除,操作回滚!"); 
			idstr+=id;
		}
		cmsUserService.deleteAllByPks(idslong);
		return successInfo("操作成功");
	}



	/**
	 * 棄1�7查账户名是否存在
	 * @return
	 */
	public String checkAccount() {
		String str = "ok";
		String accouont = getModel().getAccouont();
		boolean temp = cmsUserService.checkAccount(accouont);
		if (!temp) {
			str = "ok";
		} else {
			str = "no";
		}
		return successInfo(str);
	}

	/**
	 * 根据用户id查找对应的角艄1�7
	 * @return
	 * @throws Exception
	 */
	public String queryConsumerRole() throws Exception {
		log.debug("getModel.id:"+getModel().getId());
		this.roleEntity = cmsUserService.queryConsumerRole(getModel().getId());
		return successInfo(null);
	}

	/**
	 * 
	 * 方法用�1�7�和描述:根据主键查询对象
	 * @return
	 * @author chenl 新增日期＄1�712-8-8
	 * @since ipmi_web
	 */
	public String findById(){
		log.debug("model:"+getModel().toString());
		model = cmsUserService.getByPk(getModel().getId());
		return successInfo(null);
	}

	/**
	 * Action通用函数,新增Entity,保存.参数为model
	 */
	public String saveUser() throws Exception {
		log.debug("saveUser model:"+getModel().toString());
		MD5.toMD5(getModel().getPassword());
		TbCmsUser tbUser=new TbCmsUser();
		tbUser.setPassword(MD5.toMD5(model.getPassword()));
		tbUser.setPhoneNumber(model.getPhoneNumber());
		tbUser.setEmail(model.getEmail());
		tbUser.setUserName(model.getUserName());
		tbUser.setAccouont(model.getAccouont());
		TbRole t=new TbRole();
		t.setId(Long.parseLong(roleid));
		tbUser.setTbRole(t);
		cmsUserService.save(tbUser);
		return successInfo(null);
	}

	public String updateUser(){
		log.debug("updateUser model:"+getModel());
		TbCmsUser tbUser=this.cmsUserService.getByPk(model.getId());
		tbUser.setPhoneNumber(model.getPhoneNumber());
		tbUser.setEmail(model.getEmail());
		tbUser.setUserName(model.getUserName());
		tbUser.setAccouont(model.getAccouont());
		TbRole t=new TbRole();
		t.setId(Long.parseLong(roleid));
		tbUser.setTbRole(t);
		cmsUserService.update(tbUser);
		return successInfo(null);
	}
	@Override
	@JSON(serialize=false)
	public CommonService getCommonService() {
		return cmsUserService;
	}

	@Override
	public TbCmsUser getModel() {
		if(null==this.model){
			this.model = new TbCmsUser();
		}
		return this.model;
	}

	@Override
	public void setModel(TbCmsUser model) {
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
