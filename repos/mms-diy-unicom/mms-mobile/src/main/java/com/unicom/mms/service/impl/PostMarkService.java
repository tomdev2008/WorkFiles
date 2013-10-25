package com.unicom.mms.service.impl;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.dao.CommonDAO;
import com.unicom.mms.dao.PostMarkDAO;
import com.unicom.mms.entity.TbPostMark;
import com.unicom.mms.service.IPostMarkService;
import com.unicom.mms.util.PageInfo;

/**
 * 
* 功能描述:模板明信片
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Service("postMarkService")
public class PostMarkService extends CommonService<TbPostMark> implements IPostMarkService {
	public static Logger log = Logger.getLogger(PostMarkService.class);

	@Autowired(required = true)
	private PostMarkDAO postMarkDAO;
	
	@Override
	public CommonDAO<TbPostMark> getBindDao() {
		return postMarkDAO;
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
	public PageInfo<TbPostMark> page(int currentPage,int pageSize) {
		PageInfo<TbPostMark> pageInfo = new PageInfo<TbPostMark>();
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setPageSize(pageSize);
		TbPostMark ex = null;
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
	public TbPostMark queryPostMarkById(int postmarkid) {
		TbPostMark tbPostMark = this.getByPk(postmarkid);
		return tbPostMark;
	}
}
