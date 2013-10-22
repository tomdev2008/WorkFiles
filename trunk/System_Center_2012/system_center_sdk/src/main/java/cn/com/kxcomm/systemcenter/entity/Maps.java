package cn.com.kxcomm.systemcenter.entity;

import java.util.HashMap;
import java.util.List;

/**
 * 
* 功能描述:结果实体类
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-22
* @author chenliang 修改日期：2013-10-22
* @since system_center_sdk
 */
public class Maps {

	private List<HashMap<String, String>> hashMapList;

	public List<HashMap<String, String>> getHashMapList() {
		return hashMapList;
	}

	public void setHashMapList(List<HashMap<String, String>> hashMapList) {
		this.hashMapList = hashMapList;
	}

	public Maps(List<HashMap<String, String>> maplist){
		this.hashMapList = maplist;
	}
	
	public Maps() {
		super();
	}

}
