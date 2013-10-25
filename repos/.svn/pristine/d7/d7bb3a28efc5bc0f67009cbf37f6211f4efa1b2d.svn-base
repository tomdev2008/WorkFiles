package com.unicom.mms.service.impl;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.dao.BgPicDAO;
import com.unicom.mms.dao.CommonDAO;
import com.unicom.mms.entity.TbBgPic;
import com.unicom.mms.service.IBgPicService;
import com.unicom.mms.util.PageInfo;

/**
 * 
* 功能描述:模板明信片
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Service("bgPicService")
public class BgPicService extends CommonService<TbBgPic> implements IBgPicService {
	public static Logger log = Logger.getLogger(BgPicService.class);

	@Autowired(required = true)
	private BgPicDAO bgPicDAO;
	
	@Override
	public CommonDAO<TbBgPic> getBindDao() {
		return bgPicDAO;
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
	public PageInfo<TbBgPic> page(int currentPage,int pageSize) {
		PageInfo<TbBgPic> pageInfo = new PageInfo<TbBgPic>();
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setPageSize(pageSize);
		TbBgPic ex = null;
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
	public TbBgPic queryBgPicById(int bgPicid) {
		TbBgPic tbBgPic = this.getByPk(bgPicid);
		return tbBgPic;
	}
}
