package cn.com.kxcomm.selfservice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.kxcomm.common.BlankUtil;
import cn.com.kxcomm.entity.TenantsEntity;
import cn.com.kxcomm.selfservice.dao.TenantsDAO;
import cn.com.kxcomm.selfservice.service.TenantsService;

/**
 * 
* 功能描述:租户业务处理类
* @author chenliang 新增日期：2013-9-9
* @since system_center_web
 */
@Service("tenantsService")
public class TenantsServiceImpl implements TenantsService {

	@Autowired(required = true)
	public TenantsDAO tenantsDAO;
	
	@Override
	public boolean searchLogin(TenantsEntity entity) {
		if(BlankUtil.isBlank(entity.getAccount()) && BlankUtil.isBlank(entity.getPassword())){
			TenantsEntity resultEntity = tenantsDAO.searchLogin(entity);
			if(resultEntity==null){
				return false;
			}
			return true;
		}else{
			return false;
		}
	}

}
