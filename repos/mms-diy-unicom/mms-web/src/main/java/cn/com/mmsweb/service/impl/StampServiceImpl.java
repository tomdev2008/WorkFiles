package cn.com.mmsweb.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.common.Page;
import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.PhotoFrameDAO;
import cn.com.mmsweb.dao.StampDAO;
import cn.com.mmsweb.dao.UserPhotoDAO;
import cn.com.mmsweb.service.PhotoFrameService;
import cn.com.mmsweb.service.StampService;
import cn.com.mmsweb.service.UserPhotoService;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbPhotoFrame;
import com.unicom.mms.entity.TbStamp;
import com.unicom.mms.entity.TbUserPhoto;

@Service("stampService")
public class StampServiceImpl extends CommonServiceImpl<TbStamp> implements StampService{

	private static Logger log = Logger.getLogger(StampServiceImpl.class);

	@Autowired(required=true)
	private StampDAO stampDAO;
	
	@Override
	public CommonDAO<TbStamp> getBindDao() {
		return stampDAO;
	}

	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	@Override
	public List<PhotoFrameVo> queryStampsPage(int pageSize, int pageNow,int pictype) {
		return this.stampDAO.queryByPage(pageSize, pageNow,pictype);
	}
}
