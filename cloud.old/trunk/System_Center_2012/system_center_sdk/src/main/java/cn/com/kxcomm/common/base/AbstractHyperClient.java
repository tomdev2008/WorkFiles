package cn.com.kxcomm.common.base;

public class AbstractHyperClient {

	protected String clientType; //类型，选择openstack还是hyper
	
	public AbstractHyperClient(String clientType) {
		this.clientType = clientType;
	}

}
