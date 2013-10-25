package com.etrack.service;

import org.apache.log4j.Logger;

import com.kuaidi.KOrderDetails;
import com.kuaidi.KOrderInfo;

public class KuaidiService {
	private static KuaidiService instance = null;
	private static final Logger log = Logger.getLogger(KuaidiService.class);
	private KuaidiService(){}
	
	public static KuaidiService getSingleInstance(){
		if(instance == null)
			instance = new KuaidiService();
		
		return instance;
	}
	
	public com.kuaidi.KOrderInfo query(){
		KOrderInfo info =com.kuaidi.Query.get("yunda", "1900330840346");
		if(info!=null){
			log.info("接收订单更新信息:"+info.getNu());
			for(KOrderDetails d : info.getData()){
				log.info(d.getContext());
			}
		}
		return info;
	}
}
