package cn.com.kxcomm.systemcenter.domUser.service.impl;

import java.util.List;

import org.apache.log4j.Logger;

import cn.com.kxcomm.entity.DomUserEntity;
import cn.com.kxcomm.systemcenter.domUser.dao.DomUserDAO;
import cn.com.kxcomm.systemcenter.domUser.dao.PowerShellDAO;
import cn.com.kxcomm.systemcenter.domUser.service.DomUserService;
import cn.com.kxcomm.systemcenter.domUser.service.ExecuteService;

/**
 * 
* 功能描述:域用户业务处理实现类
* @author chenliang 新增日期：2013-6-24
* @since system_center_sdk
 */
public class DomUserServiceImpl implements DomUserService {

	private static final Logger LOGGER = Logger.getLogger(DomUserServiceImpl.class);
	
	private static DomUserServiceImpl domUserServiceImpl;
	private ExecuteService execute = CommonServiceImpl.getInstance();
	private DomUserDAO domUserDAO = DomUserDAO.getInstance();
	private PowerShellDAO powerShellDAO = PowerShellDAO.getInstance();
	
	/**
	 * 
	* 方法用途和描述: 单例
	* @return
	* @author chenliang 新增日期：2013-6-24
	* @since system_center_sdk
	 */
	public static DomUserServiceImpl getInstance(){
		if(null == domUserServiceImpl){
			domUserServiceImpl = new DomUserServiceImpl();
		}
		return domUserServiceImpl;
	}

	@Override
	public List<DomUserEntity> listDomUser() {
		//获取查询所有的域用户的脚本
		List<DomUserEntity> list = domUserDAO.listEntity();
		System.out.println("list"+list);
//		execute.execute(powerShell);
		return null;
	}
	
}
