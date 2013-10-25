package com.unicom.mms;

import com.huawei.insa2.util.Args;
import com.unicom.mms.sgip.SgipMO;

public class StartGateway {
	public static void main(String[] args){
		InitInstance init = InitInstance.getInstance();
		init.startMQListener();
		Args argstr = new Args();
		argstr.set("localhost", "127.0.0.1");
		argstr.set("localport", init.getSmsProperties().getString("local_port"));
		argstr.set("transaction-timeout", 10); // 操作超时时间(单位：秒)
		argstr.set("read-timeout", 15); // 物理连接读操作超时时间(单位：秒)
		/**
		 * 处理短信上行
		 */
		SgipMO sgipMO=new SgipMO(argstr);    
		sgipMO.startService("127.0.0.1", init.getSmsProperties().getInt("local_port")); 
	}
}
