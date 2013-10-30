package cn.com.kxcomm;

import cn.com.kxcomm.systemcenter.vm.service.VmServiceApi;
import cn.com.kxcomm.systemcenter.vm.service.impl.VmServiceApiImpl;

public class ServiceTest {

	
	/**
	 * 方法用途和描述:测试
	 * @param args
	 * @author chenliang 新增日期：2013-5-27
	 * @throws Exception 
	 * @since system_center_sdk
	 */
	public static void main(String[] args) throws Exception {
		VmServiceApi vmApi = new VmServiceApiImpl();
		vmApi.getAllVM();
	}
	
}
