package com.unicom.mms.base.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.unicom.mms.cms.action.util.SessionUtils;
import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.vo.UserRightEntity;

/**
 * 
 * 功能描述:验证用户登录拦截噄1�7�1�7
 * <p>
 * 版权扄1�7�1�7�：北京康讯通讯设备有限公司
 * <p>
 * 未经本公司许可，不得以任何方式复制或使用本程序任何部刄1�7�1�7
 * 
* @author chenliang 新增日期＄1�713-1-14
* @since mms-cms-unicom
 */

@Controller
public class AuthenticationInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = -4994877859122219609L;

	final static public String TIMEOUT = "timeout";

	private static Logger log = Logger.getLogger(BaseAction.class);

	/**
	 * 
	 * 方法用�1ￄ1�7�和描述: 数据权限拦截器，将获取到的数据权限设置给action
	 * @author dongshen
	 * @return
	 * @since dongshen
	 */
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext actionContext = invocation.getInvocationContext();
		log.debug("---AuthenticationInterceptor----" + invocation.getAction()
				+ "!" + invocation.getResultCode());

		Object action = invocation.getAction();
		if(action instanceof BaseAction){
			@SuppressWarnings("rawtypes")
			BaseAction baseAction = (BaseAction)action;
			HttpServletRequest request = (HttpServletRequest)actionContext.get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
			HttpSession session = request.getSession();
			UserRightEntity tbUser = (UserRightEntity)session.getAttribute(SessionUtils.USER);//SessionUtils.getUser();	
			if(tbUser == null)
				return invocation.invoke();
			//将登录用户账号回传给页面
			baseAction.setAdminname(tbUser.getUserEntity().getAccouont());
			baseAction.setAdminrole(tbUser.getUserEntity().getTbRole().getNote());
		}
		log.debug("拦截器�1ￄ1�7�过!");
		return invocation.invoke();
	}

}
