package com.unicom.mms.cms.service.ipml;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.FramePosDAO;
import com.unicom.mms.cms.service.FramePosService;
import com.unicom.mms.entity.TbFramePos;
import com.unicom.mms.entity.TbPhotoFrame;
/**
 * 
* 功能描述:相框相对位置管理
* @author lujia 新增日期：2013-3-3
* @since mms-cms-unicom
 */
@Service("framePosService")
public class FramePosServiceImpl extends CommonServiceImpl<TbFramePos> implements FramePosService{
	public static Logger log = Logger.getLogger(FramePosServiceImpl.class);

	@Autowired(required = true)
	private FramePosDAO framePosDAO;
	
	@Override
	public CommonDAO<TbFramePos> getBindDao() {
		return framePosDAO;
	}

	@Override
	public TbFramePos findByPhotoFrameId(TbPhotoFrame photoFrame, String type) {
		String hql = "from TbFramePos where photoFrame.id = ? and type = ? ";
		TbFramePos framePos = (TbFramePos) framePosDAO.findUnique(hql, photoFrame.getId(),type);
		return framePos;
	}

}
