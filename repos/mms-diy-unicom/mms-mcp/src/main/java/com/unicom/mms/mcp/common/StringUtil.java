package com.unicom.mms.mcp.common;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 
 * 功能描述:字符串处理公共类
 * <p>
 * 版权所有：金鹏科技
 * <p>
 * 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chuzq 新增日期：2009-1-12
 * @author 你的姓名 修改日期：2009-1-12
 * @since wapportal_manager version(2.0)
 */
public class StringUtil {
	 public static Object copyof(Object object)throws Exception{  
	        Class<?> classType = object.getClass();  
	        Object obj = classType.newInstance();  
	        Field[] fields = classType.getDeclaredFields();  
	        for(Field field : fields){  
	            String fieldName =field.getName().substring(0,1).toUpperCase()+field.getName().substring(1);  
	            Method setmethod = classType.getMethod("set"+fieldName,new Class[]{field.getType()});  
	            Method getmethod = classType.getMethod("get"+fieldName,new Class[]{});  
	            setmethod.invoke(obj,new Object[]{getmethod.invoke(object,new Object[]{})});  
	            System.out.println(setmethod.getName()+"============"+getmethod.getName());  
	  
	        }  
	        return obj;  
	    }  
	/**
	 * 
	 * 方法用途和描述:将一个字符串的指定的字符进行转义，如果已经转义不会再转
	 * 
	 * @param sourceStr
	 * @param old
	 *            ,例如 "&"
	 * @param obj
	 *            ,例如 "&amp;"
	 * @return
	 * @author chuzq 新增日期：2009-1-12
	 * @author 你的姓名 修改日期：2009-1-12
	 * @since wapportal_manager version(2.0)
	 */
	public static String replaceString(String sourceStr, String old, String obj) {
		if (sourceStr == null || sourceStr.trim().length() == 0) {
			return "";
		}
		int fromIndex = 0;
		int index = -1;
		int totoallength = sourceStr.length();
		StringBuilder resultSb = new StringBuilder();
		while ((index = sourceStr.indexOf(old, fromIndex)) != -1) {
			String str = sourceStr.substring(fromIndex, index);
			String str2 = sourceStr.substring(index, index + 4);
			resultSb.append(str);
			if (!checkTig(str2)) {
				resultSb.append(obj);
			} else {
				resultSb.append(old);
			}

			if (index + obj.length() > totoallength)
				fromIndex = index + old.length();
			else {
				// 如果已经转义,则不会再转
				if (obj
						.equals(sourceStr
								.substring(index, index + obj.length()))) {
					fromIndex = index + obj.length();
				} else
					fromIndex = index + old.length();
			}
		}

		resultSb.append(sourceStr.substring(fromIndex));
		return resultSb.toString();
	}

	/**
	 * 
	 * 方法用途和描述: 检查特殊字符
	 * 
	 * @param target
	 * @return
	 * @author dengcd 新增日期：2009-9-14
	 * @author 你的姓名 修改日期：2009-9-14
	 * @since wapportal_manager version(2.0)
	 */
	private static boolean checkTig(String target) {
		boolean flag = false;
		String[] source = { "&gt;", "&lt;" };
		for (String str : source) {
			if (str.equals(target)) {
				flag = true;
				break;
			}
		}
		return flag;
	}
	public static boolean isMobileNO(String mobiles) {  
        Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[^1^4,\\D]))\\d{8}");  
        Matcher m = p.matcher(mobiles);  
        return m.matches();  
    }  
	public static void main(String[] args) {
		System.out.println(isMobileNO("18613056507"));
		String str = "<a href=\"http://211.95.193.85/wap/campaign/detail.jsp?id=24&p=2&amp;o=4\">abc&gt;&gt; </a>";
		String str2 = replaceString(str, "&", "&amp;");
	}
}
