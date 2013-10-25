package cn.com.mmsweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mmsweb.dao.CardTypeDAO;
import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.service.CardTypeService;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbCardType;

@Service("cardTypeService")
public class CardTypeServiceImpl extends CommonServiceImpl<TbCardType> implements CardTypeService{

private static Logger log = Logger.getLogger(CardTypeServiceImpl.class);
	
	@Autowired(required=true)
	private CardTypeDAO cardTypeDAO;
	
	@Override
	public CommonDAO<TbCardType> getBindDao() {
		return cardTypeDAO;
	}

	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	@Override
	public List<PhotoFrameVo> queryAllType() {
		List<TbCardType> cardTypes = this.cardTypeDAO.findAll();
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
