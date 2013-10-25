package com.unicom.mms.service.impl;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.dao.CommonDAO;
import com.unicom.mms.dao.TemplateCardDAO;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.service.ITemplateCardService;
import com.unicom.mms.util.PageInfo;

/**
 * 
* 功能描述:模板明信片
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Service("temlateCardService")
public class TemlateCardService extends CommonService<TbTemplateCard> implements ITemplateCardService {
	public static Logger log = Logger.getLogger(TemlateCardService.class);

	@Autowired(required = true)
	private TemplateCardDAO templateCardDAO;
	
	@Override
	public CommonDAO<TbTemplateCard> getBindDao() {
		return templateCardDAO;
	}

	@Override
	public PageInfo<TbTemplateCard> page(int currentPage,int pageSize) {
		PageInfo<TbTemplateCard> pageInfo = new PageInfo<TbTemplateCard>();
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setPageSize(pageSize);
		TbTemplateCard ex = null;
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
	public TbTemplateCard queryTempPicById(int tempPicId) {
		TbTemplateCard templateCard = this.getByPk(tempPicId);
		return templateCard;
	}
}
