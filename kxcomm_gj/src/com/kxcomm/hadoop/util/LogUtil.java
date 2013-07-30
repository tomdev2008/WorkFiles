package com.kxcomm.hadoop.util;

import java.util.ArrayList;
import java.util.List;

public class LogUtil {

	public List<LogBean> parseLog(String family,String line){
		List<LogBean> lists=new ArrayList<LogBean>();
		
		String[] values=line.split(",");
		
		if(values.length!=8){   //格式不对
			return null;
		}
		LogBean bean=null;
		String[] names=new String[]{"mobile_num","mobile_date","mobile_url",
				"mobile_type","moble_imei","httpcharset","httpcode","size"};
		for(int i=0;i<values.length;i++){
			bean=new LogBean(family, names[i], values[i]);
			lists.add(bean);
		}
		return lists;
	}
}
