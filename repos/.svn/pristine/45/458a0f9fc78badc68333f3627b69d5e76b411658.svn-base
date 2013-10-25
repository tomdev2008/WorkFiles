package com.unicom.mms.mcp.filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.unicom.mms.mcp.activemq.InitSpringBean;
import com.unicom.mms.mcp.activemq.MsgPublisher;
import com.unicom.mms.mcp.service.SecurityAddressService;

/**
 * 
 * 安全过滤器<br/>
 * 做IP验证，不在允许范围内则不可以访问
 * 
 * @author zhangjh 新增日期：2013-9-27
 * @since mms-mcp
 */
public class SecurityFilter implements javax.servlet.Filter{
	
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		String ipAddr = getIpAddr((HttpServletRequest)request);
		System.out.println("2、获取当前登录人员IP："+ipAddr+"--登录时间："+new Date());
		InitSpringBean initSpringBean = InitSpringBean.getSingleInstance();
		SecurityAddressService securityAddressService = initSpringBean.getSecurityAddressService();
		if(securityAddressService!=null){
			boolean ok = securityAddressService.checkAccess(ipAddr);
			 if(ok ){//返回 0 不允许访问
				 chain.doFilter(request, response);
				 System.out.println("可以访问");
			     }else {//进入后台的登录页面
			     System.out.println("不可以访问");
			     }
		}else{
			System.out.println("spring faild");
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

	protected String getIpAddr(HttpServletRequest request) {  
		  if (request.getHeader("x-forwarded-for") == null) {  
		         return request.getRemoteAddr();  
		        }  
		        return request.getHeader("x-forwarded-for");  
	}
}
