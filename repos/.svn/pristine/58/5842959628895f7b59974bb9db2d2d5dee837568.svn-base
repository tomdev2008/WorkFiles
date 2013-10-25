package cn.com.mmsweb.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.common.Page;
import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.DecorationDAO;
import cn.com.mmsweb.dao.DecorationTypeDAO;
import cn.com.mmsweb.dao.PhotoFrameDAO;
import cn.com.mmsweb.dao.PostMarkDAO;
import cn.com.mmsweb.dao.StampDAO;
import cn.com.mmsweb.dao.UserPhotoDAO;
import cn.com.mmsweb.service.DecorationService;
import cn.com.mmsweb.service.PhotoFrameService;
import cn.com.mmsweb.service.PostMarkService;
import cn.com.mmsweb.service.StampService;
import cn.com.mmsweb.service.UserPhotoService;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbDecoration;
import com.unicom.mms.entity.TbPhotoFrame;
import com.unicom.mms.entity.TbPostMark;
import com.unicom.mms.entity.TbStamp;
import com.unicom.mms.entity.TbUserPhoto;

@Service("decorationService")
public class DecorationServiceImpl extends CommonServiceImpl<TbDecoration> implements DecorationService{

	private static Logger log = Logger.getLogger(DecorationServiceImpl.class);

	@Autowired(required=true)
	private DecorationDAO decorationDAO;
	
	@Autowired(required=true)
	private DecorationTypeDAO decorationTypeDAO;
	
	@Override
	public CommonDAO<TbDecoration> getBindDao() {
		return this.decorationDAO;
	}

	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	@Override
	public List<PhotoFrameVo> queryDecorationsPage(int pageSize, int pageNow,int pictype) {
		return this.decorationDAO.queryByPage(pageSize, pageNow,pictype);
	}

	/**
	 * 
	* 方法用途和描述:获得所有的类型
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	@Override
	public List<PhotoFrameVo> queryDecorationsType(int pageSize, int pageNow,int pictype) {
		return this.decorationTypeDAO.queryByPage(pageSize, pageNow,pictype);
	}
}
