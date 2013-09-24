package cn.com.kxcomm.common;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * 
 * 功能描述:获取应用上下文相关信息的通用类
 * <p>
 * 版权所有：金鹏科技
 * <p>
 * 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chuzq 新增日期：2008-11-13
 * @author 你的姓名 修改日期：2008-11-13
 * @since wapportal_manager version(2.0)
 */
public class ApplicationContextUtil {
	/*
	 * 应用的上下文
	 */
	private static String contextPath;
	/*
	 * spring的applicationContex
	 */
	private static ApplicationContext ac;
	/**
	 * servlet的上下文
	 */
	private static ServletContext sc;

	/**
	 * 
	 * 方法用途和描述: 获取应用的上下文
	 * 
	 * @return
	 * @author chuzq 新增日期：2008-11-13
	 * @author 你的姓名 修改日期：2008-11-13
	 * @since wapportal_manager version(2.0)
	 */
	public static String getContextPath() {
		if (contextPath == null || contextPath.trim().length() <= 0)
			setContextPath();
		return contextPath;
	}

	/**
	 * 
	 * 方法用途和描述: 根据bean名字获取spring的bean
	 * 
	 * @param beanName
	 * @return
	 * @author chuzq 新增日期：2008-11-13
	 * @author 你的姓名 修改日期：2008-11-13
	 * @since wapportal_manager version(2.0)
	 */
	public static Object getBeanByName(String beanName) {
		if (ac == null)
			setApplicationContext();
		return ac.getBean(beanName);
	}

	public static Object getBeanByName(ServletConfig config, String beanName) {
		if (ac == null)
			setApplicationContext(config);
		return ac.getBean(beanName);
	}

	/**
	 * 
	 * 方法用途和描述: 获取spring的ApplicationContext
	 * 
	 * @return
	 * @author chuzq 新增日期：2008-11-13
	 * @author 你的姓名 修改日期：2008-11-13
	 * @since wapportal_manager version(2.0)
	 */
	public static ApplicationContext getApplicationContext() {
		if (ac == null)
			setApplicationContext();
		return ac;
	}

	/**
	 * 
	 * 方法用途和描述: 获取servlet的上下文
	 * 
	 * @return
	 * @author chuzq 新增日期：2008-11-13
	 * @author 你的姓名 修改日期：2008-11-13
	 * @since wapportal_manager version(2.0)
	 */
	public static ServletContext getServletContext() {
		if (sc == null)
			setServletContext();
		return sc;
	}

	private static void setContextPath() {
		HttpServletRequest request = ServletActionContext.getRequest();
		contextPath = request.getContextPath();
	}

	private static void setApplicationContext() {
		ac = WebApplicationContextUtils
				.getRequiredWebApplicationContext(getServletContext());
	}

	private static void setApplicationContext(ServletConfig config) {
		ac = WebApplicationContextUtils.getRequiredWebApplicationContext(config
				.getServletContext());
	}

	private static void setServletContext() {
		sc = ServletActionContext.getServletContext();
	}
}
