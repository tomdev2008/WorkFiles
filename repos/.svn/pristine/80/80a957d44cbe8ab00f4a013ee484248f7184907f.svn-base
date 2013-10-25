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
import com.unicom.mms.cms.service.DecorationService;
import com.unicom.mms.common.AppConfig;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.common.JSONString;
import com.unicom.mms.entity.TbDecoration;
import com.unicom.mms.entity.TbStamp;

public class DecorationAction extends BaseAction<TbDecoration, String>{
	private static final Logger LOGGER = Logger.getLogger(DecorationAction.class);

	@Autowired(required=true)
	private DecorationService decorationService;
	
	private String id;
	public File upload; //上传文件
	public String uploadFileName;//文件名称
	
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

	public DecorationService getDecorationService() {
		return decorationService;
	}

	public void setDecorationService(DecorationService decorationService) {
		this.decorationService = decorationService;
	}
	
	/**
	 * 分页查询
	 * @return
	 */
	public String findPage(){
		LOGGER.info("list model=" + Json.toJson(getModel()));
		this.pageList = decorationService.findByPage(getModel(), getPageInfo());
		JSONString<TbDecoration> jsonString = new JSONString<TbDecoration>();
		List<TbDecoration> lists  = pageList.getResult();
		List<TbDecoration> resultList = new ArrayList<TbDecoration>();
		for (int i = 0; i < lists.size(); i++) {
			TbDecoration decoration = lists.get(i);
			decoration.setPicUrl("<img src='"+AppConfig.getImgHttp()+decoration.getPicUrl()+"'></img>");
			resultList.add(decoration);
		}
		this.pageList.setResult(jsonString.listCrawl(resultList, TbStamp.class));
		LOGGER.info("list size=" + this.pageList.getResult());
		this.setSuccess(true);
		this.setMsg("成功");
		return "list";
	}
	
	/**
	 * 
	* 方法用途和描述: 上传饰品
	* @return
	* @author chenliang 新增日期：2013-6-19
	* @since mms-cms
	 */
	public String saveDecoration(){
		String result = null; 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file", upload);
		map.put("fileName", uploadFileName);
		String decorationPath =AppConfig.getInstance().getString("cmsUploadPath");
		decorationPath += File.separator+"decoration";
		map.put("picUrl", decorationPath);
		decorationService.saveDecoration(getModel(), map);
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
	* 方法用途和描述: 修改饰品
	* @return
	* @author chenliang 新增日期：2013-6-19
	* @since mms-cms
	 */
	public String updateDecoration(){
		try {
			decorationService.updateDecoration(getModel());
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
	* 方法用途和描述: 根据主键查询
	* @return
	* @author chenliang 新增日期：2013-6-19
	* @since mms-cms
	 */
	public String findByPkid(){
		int pkid = 0;
		if(!BlankUtil.isBlank(id)){
			pkid = Integer.parseInt(id);
		}
		this.model = decorationService.getByPk(pkid);
		return successInfo("ok");
	}
	
	@Override
	public CommonService getCommonService() {
		return decorationService;
	}

	@Override
	public TbDecoration getModel() {
		if(null == this.model){
			this.model = new TbDecoration();
		}
		return this.model;
	}

	@Override
	public void setModel(TbDecoration model) {
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
