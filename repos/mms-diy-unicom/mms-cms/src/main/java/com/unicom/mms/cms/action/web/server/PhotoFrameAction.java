package com.unicom.mms.cms.action.web.server;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;

import com.unicom.mms.base.constants.BusinessConstants;
import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.cms.service.FramePosService;
import com.unicom.mms.cms.service.PhotoFrameService;
import com.unicom.mms.common.AppConfig;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.common.JSONString;
import com.unicom.mms.entity.TbFramePos;
import com.unicom.mms.entity.TbPhotoFrame;

public class PhotoFrameAction extends BaseAction<TbPhotoFrame, String>{
	
	private static final Logger LOGGER = Logger.getLogger(PhotoFrameAction.class);

	@Autowired(required=true)
	private PhotoFrameService photoFrameService;
	@Autowired(required=true)
	private FramePosService framePosService;
	
	private TbFramePos textFramePos; //文字相对相框坐标位置
	private TbFramePos postMarkFramePos; //邮戳相对相框坐标位置
	private TbFramePos stampFramePos; //邮票相对坐标位置 
	private String id;
	
	public TbFramePos getTextFramePos() {
		return textFramePos;
	}

	public void setTextFramePos(TbFramePos textFramePos) {
		this.textFramePos = textFramePos;
	}

	public TbFramePos getPostMarkFramePos() {
		return postMarkFramePos;
	}

	public void setPostMarkFramePos(TbFramePos postMarkFramePos) {
		this.postMarkFramePos = postMarkFramePos;
	}

	public TbFramePos getStampFramePos() {
		return stampFramePos;
	}

	public void setStampFramePos(TbFramePos stampFramePos) {
		this.stampFramePos = stampFramePos;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public File upload; //上传文件
	public String uploadFileName;//文件名称
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

	public PhotoFrameService getPhotoFrameService() {
		return photoFrameService;
	}

	public void setPhotoFrameService(PhotoFrameService photoFrameService) {
		this.photoFrameService = photoFrameService;
	}

	/**
	 * 分页查询
	 * @return
	 */
	public String findPage(){
		LOGGER.info("list model=" + Json.toJson(getModel()));
		this.pageList = photoFrameService.findByPage(getModel(), getPageInfo());
		JSONString<TbPhotoFrame> jsonString = new JSONString<TbPhotoFrame>();
		List<TbPhotoFrame> lists  = pageList.getResult();
		List<TbPhotoFrame> resultList = new ArrayList<TbPhotoFrame>();
		for (int i = 0; i < lists.size(); i++) {
			TbPhotoFrame photoFrame = lists.get(i);
			photoFrame.setPicUrl("<img src='"+AppConfig.getImgHttp()+photoFrame.getPicUrl()+"'></img>");
			resultList.add(photoFrame);
		}
		this.pageList.setResult(jsonString.listCrawl(resultList, TbPhotoFrame.class));
		LOGGER.info("list size=" + this.pageList.getResult());
		this.setSuccess(true);
		this.setMsg("成功");
		return "list";
	}
	
	/**
	 * 
	* 方法用途和描述: 保存相框
	* @return
	* @author lujia 新增日期：2013-4-11
	* @since mms-cms
	 */
	public String savePhotoFrame(){
		String result = null; 
		//相框大图片
		String photoFrameUrl =AppConfig.getInstance().getString("cmsUploadPath");
		photoFrameUrl += File.separator+"photoFrame";
		//相框小图片
		String minPhotoUrl =AppConfig.getInstance().getString("cmsUploadPath");
		minPhotoUrl += File.separator+"minPhotoFrame";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file", upload);
		map.put("fileName", uploadFileName);
		map.put("picUrl", photoFrameUrl);
		map.put("minfile", minUpload);
		map.put("minfileName", minUploadFileName);
		map.put("minpicUrl",minPhotoUrl);
		map.put("textFramePos",textFramePos);
		map.put("postmarkFramePos", postMarkFramePos);
		map.put("stampFramePos", stampFramePos);
		photoFrameService.savePhotoFrame(getModel(), map);
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
	* 方法用途和描述: 批量删除
	* @return
	* @author chenliang 新增日期：2013-6-18
	* @since mms-cms
	 */
	public String deleteByIds(){
		photoFrameService.deleteByPkid(getIds());
		return successInfo("删除成功！");
	}
	
	/**
	 * 
	* 方法用途和描述: 根据主键id查询相框
	* @return
	* @author chenliang 新增日期：2013-6-18
	* @since mms-cms
	 */
	public String findByPkid(){
		int pkid = 0;
		if(!BlankUtil.isBlank(id)){
			pkid = Integer.parseInt(id);
		}
		this.model = photoFrameService.getByPk(pkid);
		this.textFramePos = framePosService.findByPhotoFrameId(model, BusinessConstants.framePosType_text);
		this.postMarkFramePos = framePosService.findByPhotoFrameId(model, BusinessConstants.framePosType_postMark);
		this.stampFramePos = framePosService.findByPhotoFrameId(model, BusinessConstants.framePosType_stamp);
		return successInfo("ok");
	}
	
	/**
	 * 
	* 方法用途和描述: 修改相框
	* @return
	* @author chenliang 新增日期：2013-6-19
	* @since mms-cms
	 */
	public String updatePhotoFrame(){
		try {
			photoFrameService.updatePhotoFrame(getModel(),textFramePos,postMarkFramePos,stampFramePos);
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
	
	@Override
	public CommonService getCommonService() {
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

}
