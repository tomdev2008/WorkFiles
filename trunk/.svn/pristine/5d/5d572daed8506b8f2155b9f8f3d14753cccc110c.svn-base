package cn.com.kxcomm.base.action;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

//import cn.gzjp.common.util.AuthenticationUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * 功能描述:Action基类,所有的业务Action类应继承该基类
 * <p>
 * 版权所有：金鹏科技
 * <p>
 * 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author dengcd 新增日期：2008-10-9
 * @author 你的姓名 修改日期：2008-10-9
 * @since wapportal_manager version(2.0)
 */
@SuppressWarnings("unchecked")
public class BaseAction extends ActionSupport {
	
	public void print(String text) {
		try {
			this.getHttpResponse().setContentType("text/html;charset=UTF-8");
			this.getHttpResponse().setCharacterEncoding("UTF-8");
			PrintWriter writer = this.getHttpResponse().getWriter();
			writer.print(text);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}	
	/**
	 * 说明清楚此属性的业务含义
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 总记录数
	 */
	public final String TOTAL_ROWS = "totalRows";
	/**
	 * 新增页面标识
	 */
	public final String PAGE_ADD = "1";

	/**
	 * 修改页面标识
	 */
	public final String PAGE_EDIT = "2";

	/**
	 * 查看页面标识
	 */
	public final String PAGE_VIEW = "3";

	/**
	 * 删除页面标识
	 */
	public final String PAGE_DELETE = "0";

	/**
	 * 检查成功标识
	 */
	public final String FLAG_CHECK_SUCCESS = "0";
	/**
	 * 检查失败标识
	 */
	public final String FLAG_CHECK_FAILED = "1";
	/**
	 * 跳转结果到列表页面{object}-list.jsp
	 */
	public final String LIST = "list";

	/**
	 * 获取HttpRequest对象
	 * 
	 * @return
	 */
	public HttpServletRequest getHttpRequest() {
		HttpServletRequest request = ServletActionContext.getRequest();
		return request;
	}

	/**
	 * 获取HttpSession对象
	 * 
	 * @return
	 */
	public HttpSession getHttpSession() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		return session;
	}

	/**
	 * 获取HttpServletResponse对象
	 * 
	 * @return
	 */
	public HttpServletResponse getHttpResponse() {
		HttpServletResponse response = ServletActionContext.getResponse();
		return response;
	}

	/**
	 * 获取ActionContext对象
	 * 
	 * @return
	 */
	public ActionContext getActionContext() {
		return ActionContext.getContext();
	}

	/**
	 * 获取以Map方式存放数据的session对象
	 * 
	 * @return
	 */

	public Map  getSessionMap() {
		return getActionContext().getSession();
	}

	/**
	 * 获取以Map方式存放数据的Application对象
	 * 
	 * @return
	 */
	public Map getApplicationMap() {
		return getActionContext().getApplication();
	}

	/**
	 * 获取以Map方式存放数据的ActionContext对象
	 * 
	 * @return
	 */
	public Map getActionContextMap() {
		return getActionContext().getContextMap();
	}

	/**
	 * 
	 * 方法用途和描述: 获取ServletContext对象
	 * 
	 * @return
	 * @author chuzq 新增日期：2008-11-11
	 * @author 你的姓名 修改日期：2008-11-11
	 * @since wapportal_manager version(2.0)
	 */
	public ServletContext getServletContext() {
		return ServletActionContext.getServletContext();
	}

	/**
	 * 
	 * 方法用途和描述: 通过名称获取spring上下文的bean
	 * 
	 * @param beanName
	 * @return
	 * @author chuzq 新增日期：2008-11-11
	 * @author 你的姓名 修改日期：2008-11-11
	 * @since wapportal_manager version(2.0)
	 */
	public Object getBeanByName(String beanName) {
		ApplicationContext ac = WebApplicationContextUtils
				.getRequiredWebApplicationContext(getServletContext());
		return ac.getBean(beanName);
	}

	/**
	 * 
	 * 方法用途和描述: 以printwriter方式向响应中写入数据
	 * 
	 * @param text
	 * @author dengcd 新增日期：2008-10-9
	 * @author 你的姓名 修改日期：2008-10-9
	 * @since wapportal_manager version(2.0)
	 */
	public void print(Object text) {
		try {
			PrintWriter writer = this.getHttpResponse().getWriter();
			writer.print(String.valueOf(text));
			writer.flush();
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 
	 * 方法用途和描述: 对通过url提交的中文数据进行utf-8编码
	 * 
	 * @param str
	 * @return
	 * @author dengcd 新增日期：2008-11-4
	 * @author 你的姓名 修改日期：2008-11-4
	 * @since wapportal_manager version(2.0)
	 */
	public String transcode(String str) {
		String formatStr = "";
		try {
			formatStr = new String(str.getBytes("ISO-8859-1"), "utf-8");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return formatStr;
	}

	/**
	 * 
	 * 方法用途和描述: 根据检查结果返回标识字符串
	 * 
	 * @param flag
	 * @return
	 * @author dengcd 新增日期：2008-11-4
	 * @author 你的姓名 修改日期：2008-11-4
	 * @since wapportal_manager version(2.0)
	 */
	public String checkResult(boolean flag) {
		String checkFlag = "";
		if (flag) {// 已使用
			checkFlag = FLAG_CHECK_FAILED;
		} else {
			checkFlag = FLAG_CHECK_SUCCESS;
		}
		return checkFlag;
	}

	/**
	 * 
	 * 方法用途和描述: 直接输出纯XML
	 * 
	 * @param xml
	 *            xml内容
	 * @author dengcd 新增日期：2008-11-6
	 * @author 你的姓名 修改日期：2008-11-6
	 * @since wapportal_manager version(2.0)
	 */
	public void renderXML(String xml) {
		PrintWriter writer = null;
		try {
			HttpServletResponse response = getHttpResponse();
			response.setContentType("text/xml;charset=UTF-8");
			writer = response.getWriter();
			writer.write(xml);
			response.flushBuffer();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(writer != null){
				writer.close();
			}
		}
	}

	/**
	 * 
	 * 方法用途和描述: 得到当前登录用户的账号
	 * 
	 * @return
	 * @author dengcd 新增日期：2008-11-21
	 * @author 你的姓名 修改日期：2008-11-21
	 * @since wapportal_manager version(2.0)
	 */
//	public String getUserAccount() {
//		return AuthenticationUtil.getCurrentUserAccount(getSessionMap());
//	}
	
	/**
	 * 
	* 方法用途和描述: 得到当前登录用户的ID
	* @return
	* @author libu 新增日期：2008-11-27
	* @author 你的姓名 修改日期：2008-11-27
	* @since wapportal_manager version(2.0)
	 */
//	public String getUserId(){
//		return AuthenticationUtil.getCurrentUserId(this.getSessionMap());
//	}
	/**
	 * 
	* 方法用途和描述: 从object数组的list中获取第一个元素
	* @param sourceList
	* @return
	* @author chuzq 新增日期：2008-11-24
	* @author 你的姓名 修改日期：2008-11-24
	* @since wapportal_manager version(2.0)
	 */
	public List getFirstElementOfList(List<Object[]> sourceList) {

		List result = new ArrayList();
		if (sourceList == null || sourceList.size() == 0)
			return result;
		for (Object[] objArr : sourceList) {
			result.add(objArr[0]);
		}
		return result;

	}
}
