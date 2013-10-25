package com.unicom.mms.web.action;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.googlecode.jsonplugin.annotations.JSON;
import com.unicom.mms.entity.TbPhotoFrame;
import com.unicom.mms.service.ICommonService;
import com.unicom.mms.service.impl.PhotoFrameService;
import com.unicom.mms.util.PageInfo;
import com.unicom.mms.web.BaseAction;

/**
 * 相框管理
 * @author lizl
 *
 */
public class PhotoFrameAction extends BaseAction<TbPhotoFrame, String> {
	private static final long serialVersionUID = -3947663242152516363L;

	private static final Logger LOGGER = Logger.getLogger(PhotoFrameAction.class);

	@Autowired(required=true)
	private PhotoFrameService photoFrameService;

	@JSON(serialize=false)
	@Override
	public ICommonService getCommonService() {
		return photoFrameService;
	}
	
	@Override
	public TbPhotoFrame getModel() {
		if(null == this.model){
			this.model = new TbPhotoFrame();
		}
		return this.model;
	}

	@Override
	public void setModel(TbPhotoFrame model) {
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
	public PageInfo<TbPhotoFrame> getPageList() {
		if(null == this.pageList){
			this.pageList = new PageInfo<TbPhotoFrame>();
		}
		return this.pageList;
	}

	@Override
	public void setPageList(PageInfo<TbPhotoFrame> pageList) {
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
	public String decorationspage(){
		if(currentPage<0 || pageSize<0){
			return ERROR;
		}
		this.setPageList(photoFrameService.page(currentPage, pageSize));
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
		this.setModel(this.photoFrameService.queryUserPhotoById(tempPicId));
		return SUCCESS;
	}
}
