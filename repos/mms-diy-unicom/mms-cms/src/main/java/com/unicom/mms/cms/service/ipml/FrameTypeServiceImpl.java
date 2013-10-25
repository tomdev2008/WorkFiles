package com.unicom.mms.cms.service.ipml;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.FrameTypeDAO;
import com.unicom.mms.cms.service.FrameTypeService;
import com.unicom.mms.entity.TbFrameType;

/**
 * 
* 功能描述:相框类型管理
* @author lujia 新增日期：2013-3-3
* @since mms-cms-unicom
 */
@Service("frameTypeService")
public class FrameTypeServiceImpl extends CommonServiceImpl<TbFrameType> implements FrameTypeService{
	public static Logger log = Logger.getLogger(FrameTypeServiceImpl.class);

	@Autowired(required = true)
	private FrameTypeDAO frameTypeDAO;

	@Override
	public CommonDAO<TbFrameType> getBindDao() {
		return frameTypeDAO;
	}


}
