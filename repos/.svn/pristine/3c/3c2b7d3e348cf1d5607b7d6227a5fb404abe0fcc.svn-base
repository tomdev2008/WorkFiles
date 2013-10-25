package com.unicom.mms.service.impl;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.dao.CommonDAO;
import com.unicom.mms.dao.TemplateCardDAO;
import com.unicom.mms.dao.UserPhotpDAO;
import com.unicom.mms.entity.TbPhotoFrame;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.entity.TbUserPhoto;
import com.unicom.mms.entity.TbUsers;
import com.unicom.mms.service.ITemplateCardService;
import com.unicom.mms.service.IUserPhotoService;
import com.unicom.mms.util.PageInfo;

/**
 * 
* 功能描述:模板明信片
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Service("userPhotoService")
public class UserPhotoService extends CommonService<TbUserPhoto> implements IUserPhotoService {
	public static Logger log = Logger.getLogger(UserPhotoService.class);

	@Autowired(required = true)
	private UserPhotpDAO userPhotpDAO;
	
	@Override
	public CommonDAO<TbUserPhoto> getBindDao() {
		return userPhotpDAO;
	}

	@Override
	public PageInfo<TbUserPhoto> page(int currentPage,int pageSize,String mdn) {
		PageInfo<TbUserPhoto> pageInfo = new PageInfo<TbUserPhoto>();
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setPageSize(pageSize);
		TbUserPhoto ex = null;
		if(null != mdn && !"".equals(mdn.trim())) {
			ex = new TbUserPhoto();
			TbUsers tbUsers = new TbUsers();
			tbUsers.setMdn(mdn.trim());
			ex.setUsers(tbUsers);
		}
		pageInfo = this.findByPage(ex, pageInfo);		
		return pageInfo;
	}

	/**
	 * 
	 * 根据选择的模板ID查询模板图片
	 * 
	 * @param tempPicId
	 * @return TbTemplateCard
	 * @author lizl 新增日期：2013-7-11
	 * @since mms-mobile
	 */
	@Override
	public TbUserPhoto queryUserPhotoById(int photoid) {
		TbUserPhoto tbUserPhoto = this.getByPk(photoid);
		return tbUserPhoto;
	}
}
