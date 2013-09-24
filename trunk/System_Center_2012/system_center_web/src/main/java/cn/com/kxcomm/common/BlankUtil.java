package cn.com.kxcomm.common;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;
import java.util.Set;

/**
 * 
 * 功能描述:判断对象是否为空
 * <p>
 * 版权所有：金鹏科技
 * <p>
 * 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author dengcd 新增日期：2008-10-9
 * @author 你的姓名 修改日期：2008-10-9
 * @since wapportal_manager version(2.0)
 */
public class BlankUtil {

	/**
	 * 
	 * 方法用途和描述: 判断字符串是否为空 
	 * 
	 * @param str
	 * @return 为空返回true
	 * @author dengcd 新增日期：2008-10-9
	 * @author 你的姓名 修改日期：2008-10-9
	 * @since wapportal_manager version(2.0)
	 */
	public static boolean isBlank(final String str) {
		return (str == null) || (str.trim().length() <= 0);
	}

	/**
	 * 
	 * 方法用途和描述: 判断字符是否为空 
	 * 
	 * @param cha
	 * @return 为空返回true
	 * @author dengcd 新增日期：2008-10-9
	 * @author 你的姓名 修改日期：2008-10-9
	 * @since wapportal_manager version(2.0)
	 */
	public static boolean isBlank(final Character cha) {
		return (cha == null) || cha.equals(' ');
	}

	/**
	 * 
	 * 方法用途和描述: 判断对象是否为空 
	 * 
	 * @param obj
	 * @return 为空返回true
	 * @author dengcd 新增日期：2008-10-9
	 * @author 你的姓名 修改日期：2008-10-9
	 * @since wapportal_manager version(2.0)
	 */
	public static boolean isBlank(final Object obj) {
		return (obj == null);
	}

	/**
	 * 
	 * 方法用途和描述: 判断数组是否为空
	 * 
	 * @param objs
	 * @return 为空返回true
	 * @author dengcd 新增日期：2008-10-9
	 * @author 你的姓名 修改日期：2008-10-9
	 * @since wapportal_manager version(2.0)
	 */
	public static boolean isBlank(final Object[] objs) {
		return (objs == null) || (objs.length <= 0);
	}

	/**
	 * 
	 * 方法用途和描述: 判断Collection是否为空 
	 * 
	 * @param obj
	 * @return 为空返回true
	 * @author dengcd 新增日期：2008-10-9
	 * @author 你的姓名 修改日期：2008-10-9
	 * @since wapportal_manager version(2.0)
	 */
	public static boolean isBlank(final Collection<Object> obj) {
		return (obj == null) || (obj.size() <= 0);
	}
	

	/**
	 * 
	 * 方法用途和描述: 判断Set是否为空 
	 * 
	 * @param obj
	 * @return 为空返回true
	 * @author dengcd 新增日期：2008-10-9
	 * @author 你的姓名 修改日期：2008-10-9
	 * @since wapportal_manager version(2.0)
	 */
	public static boolean isBlank(final Set<Object> obj) {
		return (obj == null) || (obj.size() <= 0);
	}

	/**
	 * 
	 * 方法用途和描述: 判断Serializable是否为空
	 * 
	 * @param obj
	 * @return 为空返回true
	 * @author dengcd 新增日期：2008-10-9
	 * @author 你的姓名 修改日期：2008-10-9
	 * @since wapportal_manager version(2.0)
	 */
	public static boolean isBlank(final Serializable obj) {
		return obj == null;
	}

	/**
	 * 
	 * 方法用途和描述:判断Map是否为空 
	 * 
	 * @param obj
	 * @return 为空返回true
	 * @author dengcd 新增日期：2008-10-9
	 * @author 你的姓名 修改日期：2008-10-9
	 * @since wapportal_manager version(2.0)
	 */
	public static boolean isBlank(final Map<Object, Object> obj) {
		return (obj == null) || (obj.size() <= 0);
	}

}