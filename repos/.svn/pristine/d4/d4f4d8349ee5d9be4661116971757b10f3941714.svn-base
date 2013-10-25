package cn.com.base.interceptor;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;

/**
 * 
* 功能描述:异常日志拦截器，用于对系统产生的异常信息进行日志文件记录
 * <p>
 * 版权扄1�7�1�7�：北京康讯通讯设备有限公司
 * <p>
 * 未经本公司许可，不得以任何方式复制或使用本程序任何部刄1�7�1�7
 * 
	* @author chenliang 新增日期＄1�713-1-14
	* @since mms-cms-unicom
 */
public class ExceptionLoggerInterceptor{
	private static Logger _log = Logger.getLogger(ExceptionLoggerInterceptor.class);
    
	/**
	 * 
	* 方法用�1ￄ1�7�和描述: 对异常进行写日志操作
	* @param joinPoint
	* @param throwable
	* @author chenliang 新增日期＄1�713-1-14
	* @since mms-cms-unicom
	 */
    public void afterThrowing (JoinPoint joinPoint, Throwable throwable) {   
        System.out.println("Logging when throwing " + joinPoint.getSignature().getName());   
        _log.error("**********************begin***************************"); 
        _log.error("Logging when throwing " + joinPoint.getSignature().getName()); 
        _log.error("Error happened in class: " + joinPoint.getTarget().getClass().getName()); 
        _log.error("Error toString: " + throwable.toString()); 
        _log.error("Error getLocalizedMessage: " + getStackTrace(throwable.getStackTrace())); 
        _log.error("***********************end****************************"); 
    }   
    
    public String getStackTrace(StackTraceElement[] StackTraceElements){
    	StringBuilder sb = new StringBuilder();
    	for(StackTraceElement element:StackTraceElements){
    		sb.append(element.getClassName());
    		sb.append(".");
    		sb.append(element.getMethodName());
    		sb.append("(");
    		sb.append(element.getFileName());
    		sb.append(":");
    		sb.append(element.getLineNumber());
    		sb.append(")\n");
    	}
    	return sb.toString();
    }

   
    

}
