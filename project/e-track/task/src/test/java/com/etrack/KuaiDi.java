package com.etrack;

import java.util.UUID;

import org.testng.annotations.Test;

import com.kuaidi.KOrderDetails;
import com.kuaidi.KOrderInfo;

public class KuaiDi {
	@Test
	public void query(){
		KOrderInfo info =com.kuaidi.Query.get("shunfeng", "114651353590");
		if(info!=null){
			System.out.println(info.toString());
		}
		
		 info =com.kuaidi.Query.get("yunda", "1900330840346");
			if(info!=null){
				System.out.println(info.toString());
			}
	}
	
	//@Test
	public void uuid(){
		UUID uuid = UUID.randomUUID();
        System.out.println(uuid.toString().replaceAll("-", ""));
	}
}
