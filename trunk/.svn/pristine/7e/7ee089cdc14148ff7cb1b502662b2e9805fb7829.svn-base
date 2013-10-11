package cn.com.kxcomm.common;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashSet;
import java.util.Set;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.Logger;
import org.springframework.util.Assert;


public class ReflectionUtils {
	
	protected static final Logger logger = Logger.getLogger(ReflectionUtils.class);

	@SuppressWarnings("unchecked")
	public static <T> Class<T> getSuperClassGenricType(final Class clazz) {
		return getSuperClassGenricType(clazz, 0);
	}
	

	@SuppressWarnings("unchecked")
	public static Class getSuperClassGenricType(final Class clazz, final int index) {

		Type genType = clazz.getGenericSuperclass();

		if (!(genType instanceof ParameterizedType)) {
			logger.warn(clazz.getSimpleName() + "'s superclass not ParameterizedType");
			return Object.class;
		}

		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();

		if (index >= params.length || index < 0) {
			logger.warn("Index: " + index + ", Size of " + clazz.getSimpleName() + "'s Parameterized Type: "
					+ params.length);
			return Object.class;
		}
		if (!(params[index] instanceof Class)) {
			logger.warn(clazz.getSimpleName() + " not set the actual class on superclass generic parameter");
			return Object.class;
		}

		return (Class) params[index];
	}
	

	public static void convertEmptyStringPropertyToNull(Object obj){
		String str = null;
		ReflectionUtils.convertEmptyStringPropertyToNull(obj, str);
	}
	
	
	public static void convertEmptyStringPropertyToNull(Object obj, String ... excludePropertys){
		Assert.notNull(obj, "object不能为空");
		Set<String> set = null;
		if(excludePropertys != null && excludePropertys.length >0){
			set = new HashSet<String>();
			for(String property : excludePropertys){
				set.add(property);
			}
		}
		try{
			PropertyDescriptor[] propertyDescriptors = PropertyUtils.getPropertyDescriptors(obj);
			String nullStr = null;
			for(PropertyDescriptor propertyDescriptor : propertyDescriptors){
				if(set != null && set.contains(propertyDescriptor.getName())) continue;
				Class clazz = propertyDescriptor.getPropertyType();
				if(clazz.isAssignableFrom(String.class)){
					String str = (String)propertyDescriptor.getReadMethod().invoke(obj);
					if(str != null && "".equals(str)){
						propertyDescriptor.getWriteMethod().invoke(obj, nullStr);
					}
				}
			}
		}catch(Exception e){
			throw convertReflectionExceptionToUnchecked(e);
		}
	}
	
	/**
	 * 将反射时的checked exception转换为unchecked exception.
	 */
	public static RuntimeException convertReflectionExceptionToUnchecked(Exception e) {
		if (e instanceof IllegalAccessException || e instanceof IllegalArgumentException
				|| e instanceof NoSuchMethodException) {
			return new IllegalArgumentException("Reflection Exception.", e);
		} else if (e instanceof InvocationTargetException) {
			return new RuntimeException("Reflection Exception.", ((InvocationTargetException) e).getTargetException());
		} else if (e instanceof RuntimeException) {
			return (RuntimeException) e;
		}
		return new RuntimeException("Unexpected Checked Exception.", e);
	}
}
