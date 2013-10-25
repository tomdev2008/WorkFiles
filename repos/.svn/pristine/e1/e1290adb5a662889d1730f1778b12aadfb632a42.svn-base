package com.unicom.mms.cms.service.ipml;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.dao.CardTypeDAO;
import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.service.CardTypeService;
import com.unicom.mms.entity.TbCardType;

/**
 * 
* 功能描述:明信片类型管理
* @author lujia 新增日期：2013-3-3
* @since mms-cms-unicom
 */
@Service("cardTypeService")
public class CardTypeServiceImpl extends CommonServiceImpl<TbCardType> implements CardTypeService{
	public static Logger log = Logger.getLogger(CardTypeServiceImpl.class);

	@Autowired(required = true)
	private CardTypeDAO cardTypeDAO;

	@Override
	public CommonDAO<TbCardType> getBindDao() {
		return cardTypeDAO;
	}

}
