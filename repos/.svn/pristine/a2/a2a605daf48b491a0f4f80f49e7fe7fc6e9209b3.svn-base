package cn.com.mmsweb.action.web;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.mmsweb.service.CardTypeService;
import cn.com.mmsweb.service.CommonService;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbCardType;

public class CardTypeAction extends BaseAction<TbCardType, String> {

	private static Logger log = Logger.getLogger(CardTypeAction.class);

	@Autowired(required = true)
	private CardTypeService cardTypeService;

	public List<TbCardType> cardTypeList;
	
	private List<PhotoFrameVo> frameVos;
	
	public List<PhotoFrameVo> getFrameVos() {
		return this.frameVos;
	}

	public void setFrameVos(List<PhotoFrameVo> frameVos) {
		this.frameVos = frameVos;
	}

	public String listAll() {
		cardTypeList = cardTypeService.findAll();
		log.info("cardTypeList:"+cardTypeList);
		return SUCCESS;
	}

	public List<TbCardType> getCardTypeList() {
		return cardTypeList;
	}

	public void setCardTypeList(List<TbCardType> cardTypeList) {
		this.cardTypeList = cardTypeList;
	}

	@Override
	public CommonService getCommonService() {
		return cardTypeService;
	}

	@Override
	public TbCardType getModel() {
		if(null==model){
			model = new TbCardType();
		}
		return model;
	}

	@Override
	public void setModel(TbCardType model) {
		this.model = model;
	}

	@Override
	public String[] getIds() {
		return this.ids;
	}

	@Override
	public void setIds(String[] ids) {
		this.ids = ids;
	}

	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	public String queryAllType() {
		this.frameVos = this.cardTypeService.queryAllType();
		log.info("cardTypeList:"+this.cardTypeList);
		return SUCCESS;
	}
}
