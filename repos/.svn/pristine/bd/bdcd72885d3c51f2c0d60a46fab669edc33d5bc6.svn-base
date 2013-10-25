package cn.com.mmsweb.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.common.Page;
import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.PhotoFrameDAO;
import cn.com.mmsweb.dao.PostMarkDAO;
import cn.com.mmsweb.dao.StampDAO;
import cn.com.mmsweb.dao.UserPhotoDAO;
import cn.com.mmsweb.service.PhotoFrameService;
import cn.com.mmsweb.service.PostMarkService;
import cn.com.mmsweb.service.StampService;
import cn.com.mmsweb.service.UserPhotoService;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbPhotoFrame;
import com.unicom.mms.entity.TbPostMark;
import com.unicom.mms.entity.TbStamp;
import com.unicom.mms.entity.TbUserPhoto;

@Service("postMarkService")
public class PostMarkServiceImpl extends CommonServiceImpl<TbPostMark> implements PostMarkService{

	private static Logger log = Logger.getLogger(PostMarkServiceImpl.class);

	@Autowired(required=true)
	private PostMarkDAO postMarkDAO;
	
	@Override
	public CommonDAO<TbPostMark> getBindDao() {
		return postMarkDAO;
	}

	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	@Override
	public List<PhotoFrameVo> queryPostMarksPage(int pageSize, int pageNow,int pictype) {
		return this.postMarkDAO.queryByPage(pageSize, pageNow,pictype);
	}
}
