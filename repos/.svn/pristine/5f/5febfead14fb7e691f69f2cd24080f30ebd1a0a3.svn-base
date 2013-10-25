package com.unicom.mms.service.impl;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.dao.CommonDAO;
import com.unicom.mms.dao.DecorationDAO;
import com.unicom.mms.dao.StampDAO;
import com.unicom.mms.entity.TbStamp;
import com.unicom.mms.service.IStampService;
import com.unicom.mms.util.PageInfo;

/**
 * 
* 功能描述:模板明信片
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Service("stampService")
public class StampService extends CommonService<TbStamp> implements IStampService {
	public static Logger log = Logger.getLogger(StampService.class);

	@Autowired(required = true)
	private StampDAO stampDAO;
	
	@Override
	public CommonDAO<TbStamp> getBindDao() {
		return stampDAO;
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
	public PageInfo<TbStamp> page(int currentPage,int pageSize) {
		PageInfo<TbStamp> pageInfo = new PageInfo<TbStamp>();
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setPageSize(pageSize);
		TbStamp ex = null;
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
	public TbStamp queryDecorationById(int stampid) {
		TbStamp tbStamp = this.getByPk(stampid);
		return tbStamp;
	}
}
