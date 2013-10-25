package cn.com.common;

import java.lang.reflect.Method;
import java.util.List;

import org.apache.log4j.Logger;

public class JSONString<T> {
	
	private static final Logger LOGGER = Logger.getLogger(JSONString.class);
	

	/**
	 * 
	    * 功能描述：  解决hibernate 延迟加载对象问题
	    * @param dataList 数据集
	    * @param clazz 结果集内对象的class
	    * @return: void
	    * @author: lb
	    * @version: 2.0
	 */
	public List<T> listCrawl(List<T> dataList,Class clazz){
		String ss="java.lang.String,java.util.Date,java.lang.Integer,java.lang.Long,int,float,long";
		String filterType="java.util.Map,java.util.HashMap,java.util.Set,java.util.HashSet";
		try{
		for(int i=0;i<dataList.size();i++){
			Object originalObj=dataList.get(i);//原始数据对象
			Method[] originalMethods= clazz.getDeclaredMethods();//原始数据对象的方法
			for(Method originalMethod:originalMethods){
				LOGGER.debug("original MethodName:  "+originalMethod.getName());
				if(originalMethod.getName().contains("get")){
					LOGGER.debug("getMethod returnType: "+originalMethod.getReturnType().getName());
					String returnType=originalMethod.getReturnType().getName();//get方法返回的对象类型
					if(!ss.contains(returnType)&&!filterType.contains(returnType)){//不是基本类型和Set Map等集合，即是二级对象
						Object proxyObjct=originalMethod.invoke(originalObj, null);//二级hibernate代理对象
						if(proxyObjct!=null){//二级代理对象是否为空
						Class proxyClass=proxyObjct.getClass();
						Method[] proxyMethods=proxyClass.getDeclaredMethods();
						
						Class tempClazz=Class.forName(returnType);//创建一个hibernate代理的原始二级对象
						Object tempObject=tempClazz.newInstance();//创建一个hibernate代理的原始二级对象
						
						for(Method proxyMethod:proxyMethods ){//
							if(ss.contains(proxyMethod.getReturnType().getName())){//只抓取hibernate代理的二级对象的基础数据
							if(proxyMethod.getName().contains("get")){
								Object returnValue=proxyMethod.invoke(proxyObjct, null);//
								LOGGER.debug("proxy  returnValue:"+returnValue);
								String setMethod=proxyMethod.getName().replace("get", "set");
								LOGGER.debug("setMethod name:"+setMethod);
								Method tempMethod=tempClazz.getDeclaredMethod(setMethod, proxyMethod.getReturnType());
								tempMethod.invoke(tempObject, returnValue);
							}
							}
						}
						Method originalMethod1=clazz.getDeclaredMethod(originalMethod.getName().replace("get", "set"), originalMethod.getReturnType());
						originalMethod1.invoke(originalObj, tempObject);//为原始对象重新装入一个非hibernate代理对象
						
						}
						
					}
					}
			}
		}
		}catch(Exception e){
			System.out.println("处理加载对象出现问题");
			e.printStackTrace();
		}
		
		return dataList;
	}

}
