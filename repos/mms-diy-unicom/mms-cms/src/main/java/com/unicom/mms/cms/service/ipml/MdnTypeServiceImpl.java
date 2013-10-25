package com.unicom.mms.cms.service.ipml;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.MdnTypeDAO;
import com.unicom.mms.cms.service.MdnTypeService;
import com.unicom.mms.entity.TbMdnType;

/**
 * 
* 功能描述:号码类型管理
* @author lujia 新增日期：2013-3-3
* @since mms-cms-unicom
 */
@Service("mdnTypeService")
public class MdnTypeServiceImpl extends CommonServiceImpl<TbMdnType> implements MdnTypeService{
	public static Logger log = Logger.getLogger(MdnTypeServiceImpl.class);

	@Autowired(required = true)
	private MdnTypeDAO mdnTypeDAO;

	@Override
	public CommonDAO<TbMdnType> getBindDao() {
		return mdnTypeDAO;
	}

}
