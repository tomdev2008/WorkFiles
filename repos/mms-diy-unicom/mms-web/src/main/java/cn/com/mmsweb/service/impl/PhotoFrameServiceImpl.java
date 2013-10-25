package cn.com.mmsweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.common.Page;
import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.FrameTypeDAO;
import cn.com.mmsweb.dao.PhotoFrameDAO;
import cn.com.mmsweb.service.PhotoFrameService;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbCardType;
import com.unicom.mms.entity.TbFrameType;
import com.unicom.mms.entity.TbPhotoFrame;

@Service("photoFrameService")
public class PhotoFrameServiceImpl extends CommonServiceImpl<TbPhotoFrame> implements PhotoFrameService{

	private static Logger log = Logger.getLogger(PhotoFrameServiceImpl.class);

	@Autowired(required=true)
	private PhotoFrameDAO photoFrameDAO;
	@Autowired(required=true)
	private FrameTypeDAO frameTypeDAO;
	
	@Override
	public CommonDAO<TbPhotoFrame> getBindDao() {
		return photoFrameDAO;
	}

	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	@Override
	public List<PhotoFrameVo> queryPhotoFramePage(int pageSize, int pageNow,int pictype,int whatpic) {
		return this.photoFrameDAO.queryByPage(pageSize, pageNow,pictype,whatpic);
	}
	
	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	@Override
	public int maxPage(int pageSize, int pageNow,int pictype,int whatpic) {
		 return this.photoFrameDAO.maxPage(pageSize, pageNow,pictype,whatpic);
	}
	
	/**
	 * 
	* 方法用途和描述:获得所有的相框类型
	* @return
	* @author lizl 新增日期：2013-5-10
	* @since mms-web
	 */
	public List<PhotoFrameVo> queryFramePhotosType() {
		List<TbFrameType> cardTypes = this.frameTypeDAO.findAll();
		List<PhotoFrameVo> frameVos = new ArrayList<PhotoFrameVo>();
		PhotoFrameVo frameVo = null;
		for(int i = 0;i < cardTypes.size(); i++) {
			frameVo = new PhotoFrameVo();
			frameVo.setId(cardTypes.get(i).getId());
			frameVo.setName(cardTypes.get(i).getName());
			frameVos.add(frameVo);
		}
		return frameVos;
	}
}
