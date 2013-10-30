package cn.com.kxcomm.selfservice.vo;

import java.io.Serializable;

import cn.com.kxcomm.entity.TenantsEntity;

public class UserRightEntity implements Serializable {

	/**
	 * 用户基本信息
	 */
	private TenantsEntity tenantsEntity;

	public TenantsEntity getUserEntity() {
		return this.tenantsEntity;
	}

	public void setUserEntity(TenantsEntity userEntity) {
		this.tenantsEntity = userEntity;
	}

	
}
