package cn.com.kxcomm.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.log4j.Logger;
/**
 * 
* 功能描述:工具包
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-22
* @author chenliang 修改日期：2013-10-22
* @since system_center_sdk
 */
public class SdkUtil<T> {

	private static final Logger LOGGER = Logger.getLogger(SdkUtil.class);
	
	/**
	 * 
	* 方法用途和描述: 通过反射给DetectorEntity实体对象赋值
	* @param entity
	* @param list
	* @return
	* @author chenl 新增日期：2012-8-28
	* @since ipmi_web
	 */
	protected T invoke(T entity,HashMap<String, String> map){
		try {
			Field[] field = entity.getClass().getFields();
			int len = field.length;
			Method[] methods= new Method[len];
			for (int i = 0; i < len; i++) {
				String ff = field[i].getName().substring(0,1).toUpperCase()+field[i].getName().substring(1);
				methods[i] = entity.getClass().getDeclaredMethod("set"+ff,String.class);
			}
			for (int i = 0; i < methods.length; i++) {
				Method me = methods[i];
				String str = me.getName().substring(3).trim().toLowerCase();
				Set set = map.entrySet();
				Iterator iter = set.iterator();
				while (iter.hasNext()) {
					Entry entry = (Entry) iter.next();
					if(entry.getKey().toString().trim().replace(" ", "").toLowerCase().contains(str)){
						me.invoke(entity,entry.getValue());
					}
				}
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return entity;
	}
}
