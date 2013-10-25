package cn.com.mmsweb.service.impl;


import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.com.mmsweb.dao.BgMusicDAO;
import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.TextInfoDAO;
import cn.com.mmsweb.service.BgMusicService;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbBgMusic;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.resources.drawinfo.TextInfo;

@Service("bgMusicService")
public class BgMusicServiceImpl extends CommonServiceImpl<TbBgMusic> implements BgMusicService{

	private static Logger log = Logger.getLogger(BgMusicServiceImpl.class);

	@Autowired(required=true)
	private BgMusicDAO bgMusicDAO;
	@Autowired(required=true)
	private TextInfoDAO infoDAO;

	@Override
	public CommonDAO<TbBgMusic> getBindDao() {
		return bgMusicDAO;
	}

	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	@Override
	public List<PhotoFrameVo> queryBgMusicsPage(int pageSize, int pageNow,int picType) {
		return bgMusicDAO.queryByPage(pageSize, pageNow,picType);
	}
	
	/**
	 * 
	* 方法用途和描述:获得所有的歌曲
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	@Override
	public List<PhotoFrameVo> queryAllMusic() {
		List<TbBgMusic> list = bgMusicDAO.findAll();
		List<PhotoFrameVo> frameVos = new ArrayList<PhotoFrameVo>();
		PhotoFrameVo vo = null;
		for(int i = 0; i < list.size(); i++) {
			vo = new PhotoFrameVo();
			vo.setId(list.get(i).getId());
			vo.setName(list.get(i).getName());
			vo.setPicUrl(list.get(i).getFileUrl());
			frameVos.add(vo);
		}
		return frameVos;
	}

	/**
	 * 
	* 方法用途和描述:获得所有的字体类型
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	@Override
	public List<PhotoFrameVo> queryFontType(int pageSize, int pageNow,int picType) {
		List<TextInfo> list = infoDAO.findAll();
		List<PhotoFrameVo> frameVos = new ArrayList<PhotoFrameVo>();
		PhotoFrameVo vo = null;
		for(int i = 0; i < list.size(); i++) {
			vo = new PhotoFrameVo();
			vo.setName(list.get(i).getFontsColor());
			vo.setPicUrl(list.get(i).getText());
			frameVos.add(vo);
		}
		return frameVos;
	}
}
