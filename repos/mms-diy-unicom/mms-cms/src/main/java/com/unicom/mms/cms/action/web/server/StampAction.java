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
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.cms.service.StampService;
import com.unicom.mms.cms.service.ipml.StampServiceImpl;
import com.unicom.mms.common.AppConfig;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.common.JSONString;
import com.unicom.mms.entity.TbPhotoFrame;
import com.unicom.mms.entity.TbStamp;

public class StampAction extends BaseAction<TbStamp, String> {

	private static final Logger LOGGER = Logger.getLogger(StampAction.class);

	@Autowired(required = true)
	private StampService stampService;

	private String id;
	public File upload; //上传文件
	public String uploadFileName;//文件名称
	
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public StampService getStampService() {
		return stampService;
	}

	public void setStampService(StampService stampService) {
		this.stampService = stampService;
	}
	
	/**
	 * 分页查询
	 * @return
	 */
	public String findPage(){
		LOGGER.info("list model=" + Json.toJson(getModel()));
		this.pageList = stampService.findByPage(getModel(), getPageInfo());
		JSONString<TbStamp> jsonString = new JSONString<TbStamp>();
		List<TbStamp> lists  = pageList.getResult();
		List<TbStamp> resultList = new ArrayList<TbStamp>();
		for (int i = 0; i < lists.size(); i++) {
			TbStamp stamp = lists.get(i);
			stamp.setPicUrl("<img src='"+AppConfig.getImgHttp()+stamp.getPicUrl()+"'></img>");
			resultList.add(stamp);
		}
		this.pageList.setResult(jsonString.listCrawl(resultList, TbStamp.class));
		LOGGER.info("list size=" + this.pageList.getResult());
		this.setSuccess(true);
		this.setMsg("成功");
		return "list";
	}
	
	/**
	 * 
	* 方法用途和描述: 上传邮票
	* @return
	* @author chenliang 新增日期：2013-6-19
	* @since mms-cms
	 */
	public String saveStamp(){
		String result = null; 
		String stampUrl =AppConfig.getInstance().getString("cmsUploadPath");
		stampUrl += File.separator+"stamp";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file", upload);
		map.put("fileName", uploadFileName);
		map.put("picUrl", stampUrl);
		stampService.saveStamp(getModel(), map);
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
	* 方法用途和描述: 修改邮票
	* @return
	* @author chenliang 新增日期：2013-6-19
	* @since mms-cms
	 */
	public String updateStamp(){
		try {
			stampService.updateStamp(getModel());
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
	* 方法用途和描述: 批量删除
	* @return
	* @author chenliang 新增日期：2013-6-19
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
	* 方法用途和描述: 根据主键id查找邮票
	* @return
	* @author chenliang 新增日期：2013-6-19
	* @since mms-cms
	 */
	public String findByPkid(){
		int pkid = 0;
		if(!BlankUtil.isBlank(id)){
			pkid = Integer.parseInt(id);
		}
		this.model = stampService.getByPk(pkid);
		return successInfo("ok");
	}
	
	@Override
	public CommonService getCommonService() {
		return stampService;
	}

	@Override
	public TbStamp getModel() {
		if (null == this.model) {
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

}
