package cn.com.kxcomm.selfservice.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.kxcomm.base.dao.CommonDAO;
import cn.com.kxcomm.entity.TenantsEntity;
import cn.com.kxcomm.selfservice.dao.TenantsDAO;
import cn.com.kxcomm.selfservice.entity.TbRight;
import cn.com.kxcomm.selfservice.entity.TbRole;
import cn.com.kxcomm.selfservice.service.TenantsService;
import cn.com.kxcomm.selfservice.vo.MenuEntity;

@Service("tenantsService")
public class TenantsServiceImpl extends CommonServiceImpl<TenantsEntity> implements TenantsService {
	
	@Autowired(required = true)
	private TenantsDAO tenantsDAO;
	
	@Override
	public boolean checkPasswd(Long userID, String oldPasswd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void updatePasswd(Long userId, String newPasswd) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void initPasswd(Long userID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean checkAccount(String account) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public TenantsEntity checkLogin(String account) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TbRole queryConsumerRole(Long consumerId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TbRight> queryRoleRightListByRoleId(Long roleId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MenuEntity> queryMenuEntityByRoleId(Long roleId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TenantsEntity queryConsumerEntityFromSession(HttpSession session) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommonDAO<TenantsEntity> getBindDao() {
		return tenantsDAO;
	}

}
