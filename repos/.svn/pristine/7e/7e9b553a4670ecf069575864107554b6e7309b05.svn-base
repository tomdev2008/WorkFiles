package com.unicom.mms.cms.service.ipml;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.DecorationTypeDAO;
import com.unicom.mms.cms.service.DecorationTypeService;
import com.unicom.mms.entity.TbDecorationType;

/**
 * 
* 功能描述:饰物分类管理业务逻辑处理类
* @author lujia 新增日期：2013-3-3
* @since mms-cms-unicom
 */
@Service("decorationTypeServiceImpl")
public class DecorationTypeServiceImpl extends CommonServiceImpl<TbDecorationType> implements DecorationTypeService{
	public static Logger log = Logger.getLogger(DecorationTypeServiceImpl.class);

	@Autowired(required = true)
	public DecorationTypeDAO decorationTypeDAO;
	@Override
	public CommonDAO<TbDecorationType> getBindDao() {
		return decorationTypeDAO;
	}

}
