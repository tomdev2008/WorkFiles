package cn.com.kxcomm.selfservice.service.impl;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.kxcomm.common.BlankUtil;
import cn.com.kxcomm.entity.TenantsEntity;
import cn.com.kxcomm.selfservice.dao.CommonDAO;
import cn.com.kxcomm.selfservice.dao.TenantsDAO;
import cn.com.kxcomm.selfservice.service.TenantsService;

/**
 * 
* 功能描述:租户业务处理类
* @author chenliang 新增日期：2013-9-9
* @since system_center_web
 */
@Service("tenantsService")
public class TenantsServiceImpl extends CommonServiceImpl<TenantsEntity> implements TenantsService  {
	
	private static final Logger LOGGER = Logger.getLogger(TenantsServiceImpl.class);
	
	@Autowired(required = true)
	public TenantsDAO tenantsDAO;
	
	@Override
	public CommonDAO<TenantsEntity> getBindDao() {
		return tenantsDAO;
	}
	
	/**
	 * 登陆
	 */
	@Override
	public TenantsEntity searchLogin(String account) throws Exception {
		TenantsEntity entity = null;
		try {
			entity = tenantsDAO.findByField("account", account);
		} catch (Exception e) {
			LOGGER.error("searcheLogin account error.",e);
			throw e;
		}
		return entity;
	}

	/**
	 * 注册
	 */
	@Override
	public void register(TenantsEntity model) throws Exception {
		try {
			if(BlankUtil.isBlank(model)){
				model.setRegisterTime(new Timestamp(new Date().getTime()));
				tenantsDAO.save(model);
			}
		} catch (Exception e) {
			LOGGER.error("",e);
			throw e;
		}
	}

}
