package cn.com.kxcomm.common;

import java.util.List;
import java.util.Map;


/**
 * 
 * 功能描述:登录验证util类
 * <p>
 * 版权所有：康讯通讯
 * <p>
 * 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-07-14
 * @author 你的姓名 修改日期：2008-11-14
 * @since wapportal_manager version(2.0)
 */
public class AuthenticationUtil {
	static final public String ACCOUNT_SESSION_KEY = "currentUserAccount";

	static final public String VALIDATE_CODE_KEY = "validateCode";

	static final public String NAME_SESSION_KEY = "currentUserName";

	static final public String ID_SESSION_KEY = "currentUserId";

	static final public String AUTHENTICATION_URL = "authenticationUrl";
	static final public String STUDENT_SESSION_KEY = "student";
	static final public String TEACHER_SESSION_KEY = "teacher";
	static final public String TEACHER_REGISTER_SESSION_KEY = "teacherRegister";
	static final public String STUDENT_REGISTER_SESSION_KEY = "studentRegister";
	/**
	 * 0:CMS管理员用户;1:EC/SI定位企业
	 */
	static final public String GROUP_USER_FLAG = "groupUserFlag";

	@SuppressWarnings("unchecked")
	static public String getGroupUserFlag(Map session) {
		return (String) session.get(GROUP_USER_FLAG);

	}

	@SuppressWarnings("unchecked")
	static public void setGroupUserFlag(Map session, String account) {
		session.put(GROUP_USER_FLAG, account);

	}



	@SuppressWarnings("unchecked")
	static public String getCurrentUserAccount(Map session) {
		return (String) session.get(ACCOUNT_SESSION_KEY);

	}
//	@SuppressWarnings("unchecked")
//	static public void setCurrentStudent(Map session, TbStudent student) {
//		session.put(STUDENT_SESSION_KEY, student);
//	}
//	@SuppressWarnings("unchecked")
//	static public TbStudent getCurrentStudent(Map session) {
//		return (TbStudent) session.get(STUDENT_SESSION_KEY);
//	}
//	@SuppressWarnings("unchecked")
//	static public void setStudentRegister(Map session, TbStudent student) {
//		session.put(STUDENT_REGISTER_SESSION_KEY, student);
//	}
//	@SuppressWarnings("unchecked")
//	static public TbStudent getStudentRegister(Map session) {
//		return (TbStudent) session.get(STUDENT_REGISTER_SESSION_KEY);
//	}
//	@SuppressWarnings("unchecked")
//	static public void setCurrentTeacher(Map session, TbTeacher teacher) {
//		session.put(TEACHER_SESSION_KEY, teacher);
//	}
//	@SuppressWarnings("unchecked")
//	static public TbTeacher getCurrentTeacher(Map session) {
//		return (TbTeacher) session.get(TEACHER_SESSION_KEY);
//	}


//	@SuppressWarnings("unchecked")
//	static public void setTeacherRegister(Map session, TbTeacher teacher) {
//		session.put(TEACHER_REGISTER_SESSION_KEY, teacher);
//	}
//	@SuppressWarnings("unchecked")
//	static public TbTeacher getTeacherRegister(Map session) {
//		return (TbTeacher) session.get(TEACHER_REGISTER_SESSION_KEY);
//	}
	@SuppressWarnings("unchecked")
	static public void setCurrentUserAccount(Map session, String account) {
		session.put(ACCOUNT_SESSION_KEY, account);

	}

	@SuppressWarnings("unchecked")
	static public String getCurrentUserId(Map session) {
		return (String) session.get(ID_SESSION_KEY);

	}

	@SuppressWarnings("unchecked")
	static public void setCurrentUserId(Map session, String id) {
		session.put(ID_SESSION_KEY, id);

	}

	@SuppressWarnings("unchecked")
	static public String getCurrentUserName(Map session) {
		return (String) session.get(NAME_SESSION_KEY);

	}

	@SuppressWarnings("unchecked")
	static public void setCurrentUserName(Map session, String name) {
		session.put(NAME_SESSION_KEY, name);

	}

	@SuppressWarnings("unchecked")
	static public boolean isSessionActivated(Map session) {
		return !BlankUtil.isBlank(session.get(STUDENT_SESSION_KEY));
	}
	
	@SuppressWarnings("unchecked")
	static public boolean isSessionActivatedTeacher(Map session) {
		return !BlankUtil.isBlank(session.get(TEACHER_SESSION_KEY));
	}

	@SuppressWarnings("unchecked")
	static public void clearCurrentUserAccount(Map session) {
		session.clear();
	}

	@SuppressWarnings("unchecked")
	static public boolean validateCode(Map session, String validateCode) {
		return !BlankUtil.isBlank(validateCode)
				&& validateCode.equalsIgnoreCase((String) session
						.get(VALIDATE_CODE_KEY));

	}

	/**
	 * 
	 * 方法用途和描述: 将用户认证的URL信息保存在session
	 * @param session
	 * @param list
	 * @author libu 新增日期：2008-12-4
	 * @author 你的姓名 修改日期：2008-12-4
	 * @since wapportal_manager version(2.0)
	 */
	/*@SuppressWarnings("unchecked")
	static public void setAuthenticationUrl(Map session, List<SysMenu> list ){
		List urlList = new ArrayList();
		if(!BlankUtil.isBlank(list) && list.size() > 0){
			for(int i = 0 ;i < list.size() ; i++){
				//SysMenu menu = list.get(i);
				//urlList.add(menu.getUrl());
				//''System.out.println(menu.getUrl());
			//	Role role = list.get(i);
				//Iterator ite = role.getMenus().iterator();
				//System.out.println(role.getName());
				//while(ite.hasNext()){

			//		Menu menu = (Menu)ite.next();
				//	System.out.println(menu.getAuthUrl()+"  menu.getAuthUrl()");
				//	urlList.add(menu.getAuthUrl());
				//}
			}
		}
		session.put(AUTHENTICATION_URL, urlList);
	}*/

	/**
	 * 
	 * 方法用途和描述: 对指定的url进行认证
	 * @param url  需要认证的url
	 * @param session  
	 * @return  认证通过返回 true,不通过返回 false
	 * @author libu 新增日期：2008-12-4
	 * @author 你的姓名 修改日期：2008-12-4
	 * @since wapportal_manager version(2.0)
	 */
	@SuppressWarnings("unchecked")
	static public boolean isAuthorized(String url,Map session){
		if(BlankUtil.isBlank(url) || BlankUtil.isBlank(session))
			return false;
		boolean result = false;
		List<String> urlList = (List<String>)session.get(AUTHENTICATION_URL);
		for(String urlItem : urlList){
			//	System.out.println(urlItem+" urlItem"+" url="+url);
			if(BlankUtil.isBlank(urlItem))
				continue;
			if(url.startsWith(urlItem))
				result = true;
		}
		return result;
	}
}
