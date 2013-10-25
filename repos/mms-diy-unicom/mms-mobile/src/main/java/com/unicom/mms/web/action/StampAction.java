package com.unicom.mms.web.action;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.googlecode.jsonplugin.annotations.JSON;
import com.unicom.mms.entity.TbStamp;
import com.unicom.mms.service.ICommonService;
import com.unicom.mms.service.impl.StampService;
import com.unicom.mms.util.PageInfo;
import com.unicom.mms.web.BaseAction;

/**
 * 相框管理
 * @author lizl
 *
 */
public class StampAction extends BaseAction<TbStamp, String> {
	private static final long serialVersionUID = -3947694459652516363L;

	private static final Logger LOGGER = Logger.getLogger(StampAction.class);

	@Autowired(required=true)
	private StampService stampService;

	@JSON(serialize=false)
	@Override
	public ICommonService getCommonService() {
		return stampService;
	}
	
	@Override
	public TbStamp getModel() {
		if(null == this.model){
			this.model = new TbStamp();
		}
		return this.model;
	}

	@Override
	public void setModel(TbStamp model) {
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
	public PageInfo<TbStamp> getPageList() {
		if(null == this.pageList){
			this.pageList = new PageInfo<TbStamp>();
		}
		return this.pageList;
	}

	@Override
	public void setPageList(PageInfo<TbStamp> pageList) {
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
	 * 更多相框
	 * 
	 * @return
	 * @author lizl
	 * 新增日期：2013-7-10
	 * @since mms-mobile
	 */
	public String stampspage(){
		if(currentPage<0 || pageSize<0){
			return ERROR;
		}
		this.setPageList(stampService.page(currentPage, pageSize));
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
		this.setModel(this.stampService.queryDecorationById(tempPicId));
		return SUCCESS;
	}
}
