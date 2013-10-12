package cn.com.kxcomm.systemcenter.domer.service;

import cn.com.kxcomm.systemcenter.Client;
import cn.com.kxcomm.systemcenter.domer.api.UserCore;

public class DomUserApi {

	public static DomUserApi domUserApi;
	
	private static DomUserApi getInstance(){
		if( null == domUserApi){
			domUserApi = new DomUserApi();
		}
		return domUserApi;
	}
	
	public void selectDomUser() throws Exception{
		String clientType = "";
		Client domUserClient = new Client(clientType);
		domUserClient.execute(UserCore.deleteDomUse("1"));
		
	}
	
	public static void main(String[] args) {
		DomUserApi api = DomUserApi.getInstance();
		try {
			api.selectDomUser();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

