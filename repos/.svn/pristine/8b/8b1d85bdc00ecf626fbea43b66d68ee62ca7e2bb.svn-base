package cn.com.mmsweb.action.util;

import java.util.Map;
import org.apache.log4j.Logger;
import cn.com.common.BlankUtil;

/**
 * 
 * 功能描述:登录验证util籄1�7
 * <p>
 * 版权扄1�7有：
 * <p>
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
* 
*/
public class AuthenticationUtil {
	
	private static Logger log = Logger.getLogger(AuthenticationUtil.class);
	
	static final public String ACCOUNT_SESSION_KEY = "currentUserAccount";

	static final public String VALIDATE_CODE_KEY = "validateCode";

	static final public String NAME_SESSION_KEY = "currentUserName";

	static final public String ID_SESSION_KEY = "currentUserId";
	
	static final public String AUTHENTICATION_URL = "authenticationUrl";

	@SuppressWarnings("unchecked")
	static public String getCurrentUserAccount(Map session) {
		return (String) session.get(ACCOUNT_SESSION_KEY);

	}

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
		return !BlankUtil.isBlank(session.get(ACCOUNT_SESSION_KEY));
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
	* 方法用�1�7�和描述: 对指定的url进行认证
	* @param url  霄1�7要认证的url
	* @param session  
	* @return  认证通过返回 true,不�1�7�过返回 false
	* @author libu 新增日期＄1�708-12-4
	* @author 你的姓名 修改日期＄1�708-12-4
	* @since wapportal_manager version(2.0)
	 */
//	@SuppressWarnings("unchecked")
//	static public boolean isAuthorized(String url,List<RightEntity> rightList){
//		if(BlankUtil.isBlank(url) || BlankUtil.isBlank(rightList))
//			return false;
//		boolean result = false;
//		for (RightEntity rightEntity : rightList) {
//			 String urlItem = rightEntity.getUrl();
//			 if(BlankUtil.isBlank(urlItem)){
//				 continue;
//			 }
//			 if(url.startsWith(urlItem)){
//				 result = true;
//			 }
//		}
//		return result;
//	}
//	
}
