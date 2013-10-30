package cn.com.kxcomm.systemcenter;

import cn.com.kxcomm.common.base.AbstractHyperClient;

public class Client extends AbstractHyperClient {

	public Client(String clientType){
		super(clientType);
	}
	
	public <R> R execute(Command<R> command) throws Exception{
		return command.execute(clientType);
	}

}
