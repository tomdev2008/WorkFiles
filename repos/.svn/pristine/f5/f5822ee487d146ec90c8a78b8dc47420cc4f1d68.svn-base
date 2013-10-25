package com.unicom.mms.cms.action.web.server;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;

import com.googlecode.jsonplugin.annotations.JSON;
import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.cms.service.TemplateCardService;
import com.unicom.mms.cms.vo.TemplateCardEntity;
import com.unicom.mms.common.AppConfig;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.common.Page;
import com.unicom.mms.entity.TbTemplateCard;

/**
 * 模板明信片管理
 * @author chenliang
 *
 */
public class TemplateCardAction extends BaseAction<TbTemplateCard, String> {

	private static final Logger LOGGER = Logger.getLogger(TemplateCardAction.class);

	@Autowired(required=true)
	private TemplateCardService templateCardService;
	
	public List<TemplateCardEntity> cardList;
	public String id;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<TemplateCardEntity> getCardList() {
		return cardList;
	}

	public void setCardList(List<TemplateCardEntity> cardList) {
		this.cardList = cardList;
	}

	public File upload; //上传文件
	public String uploadFileName;//文件名称
	public String uploadContentType;//文件类型
	public File minUpload; //上传文件
	public String minUploadFileName;//文件名称
	
	
	public File getMinUpload() {
		return minUpload;
	}

	public void setMinUpload(File minUpload) {
		this.minUpload = minUpload;
	}

	public String getMinUploadFileName() {
		return minUploadFileName;
	}

	public void setMinUploadFileName(String minUploadFileName) {
		this.minUploadFileName = minUploadFileName;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	/**
	 * 
	* 方法用途和描述: 保存模板明信片
	* @return
	* @author chenliang 新增日期：2013-4-10
	* @since mms-cms
	 */
	public String saveTemplateCard(){
		String result = null; 
		//模板明星片大图片
		String templateCardUrl =AppConfig.getInstance().getString("cmsUploadPath");
		templateCardUrl += File.separator+"templateCard";
		//模板明星片小图片
		String minTemplateCardUrl =AppConfig.getInstance().getString("cmsUploadPath");
		minTemplateCardUrl += File.separator+"minTemplateCard";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file", upload);
		map.put("fileName", uploadFileName);
		map.put("picUrl", templateCardUrl);
		map.put("minfile", minUpload);
		map.put("minfileName", minUploadFileName);
		map.put("minpicUrl",minTemplateCardUrl);
		templateCardService.saveTemplateCard(getModel(),map);
		try {
			int state = 0;
	        switch (state) {  
	        case 0:  
	            result = "{success:true,msg:'ok'}";  
	            break;  
	        case 1:  
	            result = "{success:false,errors:[{message:'文件格式错误！'}]}";  
	            break;  
	        case 2:  
	            throw new RuntimeException("抛出异常");  
	        }  
	        getHttpResponse().setContentType("text/html");  
	        getHttpResponse().setCharacterEncoding("UTF-8");  
	        getHttpResponse().resetBuffer();  
	        PrintWriter out = getHttpResponse().getWriter();
			out.write(result);  
			out.close();  
		} catch (IOException e) {
			e.printStackTrace();
		}  
		return null;
	}
	
	/**
	 * 
	* 方法用途和描述: 模板明信片修改
	* @return
	* @author chenliang 新增日期：2013-6-18
	* @since mms-cms
	 */
	public String updateTemplateCard(){
		try {
			templateCardService.updateTemplateCard(getModel());
			getHttpResponse().setContentType("text/html");  
	        getHttpResponse().setCharacterEncoding("UTF-8");  
	        getHttpResponse().resetBuffer();  
	        PrintWriter out = getHttpResponse().getWriter();
	        out.write("{success:true,msg:'ok'}");  
	        out.close();  
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 
	* 方法用途和描述: 查询所有的模板明信片
	* @return
	* @author chenliang 新增日期：2013-5-20
	* @since mms-cms
	 */
	public String listAll(){
//		list = templateCardService.findAll();
		cardList = templateCardService.listAll();
		return successInfo("ok");
	}
	
	/**
	 * 
	* 方法用途和描述: 分页查询
	* @return
	* @author chenliang 新增日期：2013-7-12
	 * @throws Exception 
	* @since mms-cms
	 */
	public String listPage() throws Exception{
		try {
			log.debug("list model=" + Json.toJson(getModel()));
			this.pageList = this.getCommonService().findByPage(getModel(),getPageInfo());
			List<TbTemplateCard> listTemplate = pageList.getResult();
			List<TbTemplateCard> listC = new ArrayList<TbTemplateCard>();
			for (int i = 0; i < listTemplate.size(); i++) {
				TbTemplateCard card = listTemplate.get(i);
				card.setPicUrl("<img src='"+AppConfig.getImgHttp()+card.getPicUrl()+"'></img>");
				card.setSmallPic("<img src='"+AppConfig.getImgHttp()+card.getSmallPic()+"'></img>");
				listC.add(card);
			}
			pageList.setResult(listC);
			log.debug("list size=" + this.pageList.getResult());
			this.setSuccess(true);
			this.setMsg("成功");
			return "list";
		} catch (Exception e) {
			log.error("list error." + e.getMessage(), e);
			throw e;
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 批量删除模板明信片
	* @return
	* @author chenliang 新增日期：2013-6-18
	* @since mms-cms
	 */
	public String deleteByIds(){
		String[] idss=(String[])getIds();
		Integer[] idslong = new Integer[idss.length];
		for(int i=0;i<idslong.length;i++){
			idslong[i]=Integer.parseInt(idss[i]);
		}
		getCommonService().deleteAllByPks(idslong);
		return successInfo("删除成功！");
	}
	
	/**
	 * 
	* 方法用途和描述: 根据主键id查询
	* @return
	* @author chenliang 新增日期：2013-6-18
	* @since mms-cms
	 */
	public String findByPkid(){
		int pkid = 0;
		if(!BlankUtil.isBlank(id)){
			pkid = Integer.parseInt(id);
		}
		this.model = templateCardService.getByPk(pkid);
		return successInfo("ok");
	}
	
	@Override
	public CommonService getCommonService() {
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
	

}
