package com.unicom.mms.web.action;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.googlecode.jsonplugin.annotations.JSON;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.entity.TbUserPhoto;
import com.unicom.mms.service.ICommonService;
import com.unicom.mms.service.impl.UserPhotoService;
import com.unicom.mms.util.PageInfo;
import com.unicom.mms.web.BaseAction;

/**
 * 用户相片管理
 * @author chenliang
 *
 */
public class UserPhotoAction extends BaseAction<TbUserPhoto, String> {
	private static final long serialVersionUID = -3967661845332665363L;

	private static final Logger LOGGER = Logger.getLogger(UserPhotoAction.class);

	@Autowired(required=true)
	private UserPhotoService userPhotoService;

	@JSON(serialize=false)
	@Override
	public ICommonService getCommonService() {
		return userPhotoService;
	}
	
	@Override
	public TbUserPhoto getModel() {
		if(null == this.model){
			this.model = new TbUserPhoto();
		}
		return this.model;
	}

	@Override
	public void setModel(TbUserPhoto model) {
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
	public PageInfo<TbUserPhoto> getPageList() {
		if(null == this.pageList){
			this.pageList = new PageInfo<TbUserPhoto>();
		}
		return this.pageList;
	}

	@Override
	public void setPageList(PageInfo<TbUserPhoto> pageList) {
		this.pageList = pageList;
		
	}
	
	public String id;
	
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String mdn;
	
	public String getMdn() {
		return this.mdn;
	}

	public void setMdn(String mdn) {
		this.mdn = mdn;
	}

	/**
	 * 
	 * 更多模版明信片
	 * 
	 * @return
	 * @author lizl
	 * 新增日期：2013-7-10
	 * @since mms-mobile
	 */
	public String page(){
		if(currentPage<0 || pageSize<0){
			return ERROR;
		}
		System.out.println("用户号码：  "+this.mdn);
		this.setPageList(userPhotoService.page(currentPage, pageSize,this.mdn));
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
	public String queryUserPhotoById() {
		if(null == this.id || "".equals(this.id)){
			return ERROR;
		}
		int photoid = Integer.parseInt(this.id);
		this.setModel(this.userPhotoService.queryUserPhotoById(photoid));
		return SUCCESS;
	}
}
