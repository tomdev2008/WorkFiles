package com.unicom.mms.web.action;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.googlecode.jsonplugin.annotations.JSON;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.service.ICommonService;
import com.unicom.mms.service.impl.TemlateCardService;
import com.unicom.mms.util.PageInfo;
import com.unicom.mms.web.BaseAction;

/**
 * 模板明信片管理
 * @author chenliang
 *
 */
public class TemplateCardAction extends BaseAction<TbTemplateCard, String> {
	private static final long serialVersionUID = -3967668845332516363L;

	private static final Logger LOGGER = Logger.getLogger(TemplateCardAction.class);

	@Autowired(required=true)
	private TemlateCardService templateCardService;

	@JSON(serialize=false)
	@Override
	public ICommonService getCommonService() {
		return templateCardService;
	}
	
	@Override
	public TbTemplateCard getModel() {
		if(null == this.model){
			this.model = new TbTemplateCard();
		}
		return this.model;
	}

	@Override
	public void setModel(TbTemplateCard model) {
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
	
	@Override
	public PageInfo<TbTemplateCard> getPageList() {
		if(null == this.pageList){
			this.pageList = new PageInfo<TbTemplateCard>();
		}
		return this.pageList;
	}

	@Override
	public void setPageList(PageInfo<TbTemplateCard> pageList) {
		this.pageList = pageList;
		
	}
	
	public String id;
	
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 
	 * 更多模版明信片
	 * 
	 * @return
	 * @author zhangjh 新增日期：2013-7-10
	 * @since mms-mobile
	 */
	public String page(){
		if(currentPage<0 || pageSize<0){
			return ERROR;
		}
		this.setPageList(templateCardService.page(currentPage, pageSize));
		System.out.println("nowpage:"+currentPage +"   "+pageList.getRows().size());
		return SUCCESS; 
	}
	
	/**
	 * 
	 * 根据选择的模板ID查询模板图片
	 * 
	 * @return
	 * @author lizl 新增日期：2013-7-11
	 * @since mms-mobile
	 */
	public String queryTempPicById() {
		if(null == this.id || "".equals(this.id)){
			return ERROR;
		}
		int tempPicId = Integer.parseInt(this.id);
		this.setModel(this.templateCardService.queryTempPicById(tempPicId));
		return SUCCESS;
	}
}
