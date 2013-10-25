package cn.com.mmsweb.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.common.Page;
import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.PhotoFrameDAO;
import cn.com.mmsweb.dao.UserPhotoDAO;
import cn.com.mmsweb.service.PhotoFrameService;
import cn.com.mmsweb.service.UserPhotoService;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbPhotoFrame;
import com.unicom.mms.entity.TbUserPhoto;

@Service("userPhotoService")
public class UserPhotoServiceImpl extends CommonServiceImpl<TbUserPhoto> implements UserPhotoService{

	private static Logger log = Logger.getLogger(UserPhotoServiceImpl.class);

	@Autowired(required=true)
	private UserPhotoDAO userPhotoDAO;
	
	@Override
	public CommonDAO<TbUserPhoto> getBindDao() {
		return userPhotoDAO;
	}

	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	@Override
	public List<PhotoFrameVo> queryUserPhotosPage(int pageSize, int pageNow,int pictype) {
		return this.userPhotoDAO.queryByPage(pageSize, pageNow,pictype);
	}
}
