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

import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.service.BgMusicService;
import com.unicom.mms.cms.service.BgPicService;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.common.AppConfig;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.common.JSONString;
import com.unicom.mms.entity.TbBgMusic;
import com.unicom.mms.entity.TbBgPic;
import com.unicom.mms.entity.TbPostMark;

public class BgPicAction extends BaseAction<TbBgPic, String>{
	private static final Logger LOGGER = Logger.getLogger(BgPicAction.class);
	@Autowired(required=true)
	private BgPicService bgPicService;
	
	private String id;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	/**
	 * 分页查询
	 * @return
	 */
	public String findPage(){
		LOGGER.info("list model=" + Json.toJson(getModel()));
		this.pageList = bgPicService.findByPage(getModel(), getPageInfo());
		JSONString<TbBgPic> jsonString = new JSONString<TbBgPic>();
		List<TbBgPic> lists = pageList.getResult();
		List<TbBgPic> resultList = new ArrayList<TbBgPic>();
		for (int i = 0; i < lists.size(); i++) {
			TbBgPic bgPic = lists.get(i);
			bgPic.setPicUrl("<img src='"+AppConfig.getImgHttp()+bgPic.getPicUrl()+"'></img>");
			resultList.add(bgPic);
		}
		this.pageList.setResult(jsonString.listCrawl(resultList, TbBgPic.class));
		LOGGER.info("list size=" + this.pageList.getResult());
		this.setSuccess(true);
		this.setMsg("成功");
		return "list";
	}
	
	
	/**
	 * 
	* 方法用途和描述: 上传背景图片
	* @return
	* @author chenliang 新增日期：2013-6-20
	* @since mms-cms
	 */
	public String saveBgPic(){
		String result = null; 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file", upload);
		map.put("fileName", uploadFileName);
		map.put("minfile", minUpload);
		map.put("minfileName", minUploadFileName);
		String bgPicPath =AppConfig.getInstance().getString("cmsUploadPath");
		bgPicPath += File.separator+"bgPic";
		//背景小图片
		String minPhotoFrameUrl =AppConfig.getInstance().getString("cmsUploadPath");
		minPhotoFrameUrl += File.separator+"minBgPic";
		map.put("picUrl", bgPicPath);
		map.put("minpicUrl", minPhotoFrameUrl);
		bgPicService.saveBgPic(getModel(), map);
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
	* 方法用途和描述: 修改背景图片
	* @return
	* @author chenliang 新增日期：2013-6-20
	* @since mms-cms
	 */
	public String updateBgPic(){
		try {
			bgPicService.updateBgPic(getModel());
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
	* 方法用途和描述: 根据id查找
	* @return
	* @author chenliang 新增日期：2013-6-20
	* @since mms-cms
	 */
	public String findByPkid(){
		int pkid = 0;
		if(!BlankUtil.isBlank(id)){
			pkid = Integer.parseInt(id);
		}
		this.model = bgPicService.getByPk(pkid);
		return successInfo("ok");
	}
	
	/**
	 * 
	* 方法用途和描述: 批量删除
	* @return
	* @author chenliang 新增日期：2013-6-20
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

	@Override
	public CommonService getCommonService() {
		return bgPicService;
	}

	@Override
	public TbBgPic getModel() {
		if(null == model){
			model = new TbBgPic();
		}
		return model;
	}

	@Override
	public void setModel(TbBgPic model) {
		this.model = model;
	}

	@Override
	public String[] getIds() {
		return ids;
	}

	@Override
	public void setIds(String[] ids) {
		this.ids = ids;
	}
	

}
