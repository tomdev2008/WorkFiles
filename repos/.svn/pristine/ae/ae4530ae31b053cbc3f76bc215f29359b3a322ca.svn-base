package com.unicom.mms.service.impl;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.dao.CommonDAO;
import com.unicom.mms.dao.DecorationDAO;
import com.unicom.mms.entity.TbDecoration;
import com.unicom.mms.service.IDecorationService;
import com.unicom.mms.util.PageInfo;

/**
 * 
* 功能描述:模板明信片
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Service("decorationService")
public class DecorationService extends CommonService<TbDecoration> implements IDecorationService {
	public static Logger log = Logger.getLogger(DecorationService.class);

	@Autowired(required = true)
	private DecorationDAO decorationDAO;
	
	@Override
	public CommonDAO<TbDecoration> getBindDao() {
		return decorationDAO;
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
	public PageInfo<TbDecoration> page(int currentPage,int pageSize) {
		PageInfo<TbDecoration> pageInfo = new PageInfo<TbDecoration>();
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setPageSize(pageSize);
		TbDecoration ex = null;
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
	public TbDecoration queryDecorationById(int decorationid) {
		TbDecoration tbDecoration = this.getByPk(decorationid);
		return tbDecoration;
	}
}
