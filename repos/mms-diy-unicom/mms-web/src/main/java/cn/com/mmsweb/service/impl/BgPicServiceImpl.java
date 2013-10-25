package cn.com.mmsweb.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mmsweb.dao.BgPicDAO;
import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.service.BgPicService;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbBgPic;

@Service("bgPicService")
public class BgPicServiceImpl extends CommonServiceImpl<TbBgPic> implements BgPicService{
	private static Logger log = Logger.getLogger(BgPicServiceImpl.class);

	@Autowired(required=true)
	private BgPicDAO bgPicDAO;
	@Override
	public CommonDAO<TbBgPic> getBindDao() {
		return bgPicDAO;
	}
	
	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	@Override
	public List<PhotoFrameVo> queryBgPicPage(int pageSize, int pageNow,int pictype) {
		return this.bgPicDAO.queryByPage(pageSize, pageNow,pictype);
	}
}
