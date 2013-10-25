package cn.com.base.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import cn.com.common.BlankUtil;
import cn.com.mmsweb.action.util.SessionUtils;
import cn.com.mmsweb.action.web.BaseAction;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
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
	 * 方法用法和描述: 数据权限拦截器，将获取session判断是否超时
	 * @author dongshen
	 * @return
	 * @since dongshen
	 */
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext actionContext = invocation.getInvocationContext();
		log.debug("---AuthenticationInterceptor----" + invocation.getAction()
				+ "!" + invocation.getResultCode());

		HttpServletRequest request = (HttpServletRequest)actionContext.get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String tbUser = (String)session.getAttribute(SessionUtils.USER_NAME);	
		if(!BlankUtil.isBlank(tbUser)){
			return invocation.invoke();
		}else{
//			HttpServletResponse response = ServletActionContext.getResponse(); 
//			response.sendRedirect(request.getContextPath()+"/timeout.jsp");
//			return Action.NONE;
			return TIMEOUT;
		}
	}
	
}
