package cn.com.mmsweb.vo;

import java.io.Serializable;

import com.unicom.mms.entity.TbUsers;

public class UserRightEntity implements Serializable {

	/**
	 * 用户基本信息
	 */
	private TbUsers userEntity;

	public TbUsers getUserEntity() {
		return this.userEntity;
	}

	public void setUserEntity(TbUsers userEntity) {
		this.userEntity = userEntity;
	}

	
}
