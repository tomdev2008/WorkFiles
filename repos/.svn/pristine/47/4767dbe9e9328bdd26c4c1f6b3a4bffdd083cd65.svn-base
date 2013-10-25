package com.unicom.mms.service.impl;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.dao.CommonDAO;
import com.unicom.mms.dao.PhotoFrameDAO;
import com.unicom.mms.entity.TbPhotoFrame;
import com.unicom.mms.service.IPhotoFrameService;
import com.unicom.mms.util.PageInfo;

/**
 * 
* 功能描述:模板明信片
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Service("photoFrameService")
public class PhotoFrameService extends CommonService<TbPhotoFrame> implements IPhotoFrameService {
	public static Logger log = Logger.getLogger(PhotoFrameService.class);

	@Autowired(required = true)
	private PhotoFrameDAO photoFrameDAO;
	
	@Override
	public CommonDAO<TbPhotoFrame> getBindDao() {
		return photoFrameDAO;
	}

	/**
	 * 
	 * 更多相框
	 * 
	 * @return
	 * @author lizl
	 * 新增日期：2013-7-10
	 * @since mms-mobile
	 */
	@Override
	public PageInfo<TbPhotoFrame> page(int currentPage,int pageSize) {
		PageInfo<TbPhotoFrame> pageInfo = new PageInfo<TbPhotoFrame>();
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setPageSize(pageSize);
		TbPhotoFrame ex = null;
		pageInfo =  this.findByPage(ex, pageInfo);		
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
	public TbPhotoFrame queryUserPhotoById(int photoframeid) {
		TbPhotoFrame photoFrame = this.getByPk(photoframeid);
		return photoFrame;
	}
}
