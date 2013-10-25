package com.unicom.mms.base.interceptor;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;

/**
 * 
* 鍔熻兘鎻忚堪:寮傚父鏃ュ織鎷︽埅鍣紝鐢ㄤ簬瀵圭郴缁熶骇鐢熺殑寮傚父淇℃伅杩涜鏃ュ織鏂囦欢璁板綍
 * <p>
 * 鐗堟潈鎵��夛細鍖椾含搴疯閫氳璁惧鏈夐檺鍏徃
 * <p>
 * 鏈粡鏈叕鍙歌鍙紝涓嶅緱浠ヤ换浣曟柟寮忓鍒舵垨浣跨敤鏈▼搴忎换浣曢儴鍒��
 * 
	* @author chenliang 鏂板鏃ユ湡锛�13-1-14
	* @since mms-cms-unicom
 */
public class ExceptionLoggerInterceptor{
	private static Logger _log = Logger.getLogger(ExceptionLoggerInterceptor.class);
    
	/**
	 * 
	* 鏂规硶鐢拷1锟�藉拰鎻忚堪: 瀵瑰紓甯歌繘琛屽啓鏃ュ織鎿嶄綔
	* @param joinPoint
	* @param throwable
	* @author chenliang 鏂板鏃ユ湡锛�13-1-14
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
