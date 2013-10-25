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
import com.unicom.mms.cms.service.PostMarkService;
import com.unicom.mms.common.AppConfig;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.common.JSONString;
import com.unicom.mms.entity.TbDecoration;
import com.unicom.mms.entity.TbNewBillboard;
import com.unicom.mms.entity.TbPhotoFrame;
import com.unicom.mms.entity.TbPostMark;

public class PostMarkAction extends BaseAction<TbPostMark, String>{
	private static final Logger LOGGER = Logger.getLogger(PostMarkAction.class);

	@Autowired(required=true)
	private PostMarkService postMarkService;
	
	public String id;
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

	public PostMarkService getPostMarkService() {
		return postMarkService;
	}

	public void setPostMarkService(PostMarkService postMarkService) {
		this.postMarkService = postMarkService;
	}
	/**
	 * 分页查询
	 * @return
	 */
	public String findPage(){
		LOGGER.info("list model=" + Json.toJson(getModel()));
		this.pageList = postMarkService.findByPage(getModel(), getPageInfo());
		JSONString<TbPostMark> jsonString = new JSONString<TbPostMark>();
		List<TbPostMark> lists = pageList.getResult();
		List<TbPostMark> resultList = new ArrayList<TbPostMark>();
		for (int i = 0; i < lists.size(); i++) {
			TbPostMark postmark = lists.get(i);
			postmark.setPicUrl("<img src='"+AppConfig.getImgHttp()+postmark.getPicUrl()+"'></img>");
			resultList.add(postmark);
		}
		this.pageList.setResult(jsonString.listCrawl(resultList, TbPostMark.class));
		LOGGER.info("list size=" + this.pageList.getResult());
		this.setSuccess(true);
		this.setMsg("成功");
		return "list";
	}
	
	/**
	 * 
	* 方法用途和描述: 上传邮戳
	* @return
	* @author chenliang 新增日期：2013-6-20
	* @since mms-cms
	 */
	public String savePostmark(){
		String result = null; 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file", upload);
		map.put("fileName", uploadFileName);
		String postMarkPath =AppConfig.getInstance().getString("cmsUploadPath");
		postMarkPath += File.separator+"postMarkPath";
		map.put("picUrl",postMarkPath);
		postMarkService.savePostmark(getModel(), map);
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
	* 方法用途和描述: 修改邮戳
	* @return
	* @author chenliang 新增日期：2013-6-20
	* @since mms-cms
	 */
	public String updatePostmark(){
		try {
			postMarkService.updatePostmark(getModel());
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
	
	/**
	 * 
	* 方法用途和描述: 根据主键id查询
	* @return
	* @author chenliang 新增日期：2013-6-20
	* @since mms-cms
	 */
	public String findByPkid(){
		int pkid = 0;
		if(!BlankUtil.isBlank(id)){
			pkid = Integer.parseInt(id);
		}
		this.model = postMarkService.getByPk(pkid);
		return successInfo("ok");
	}
	
	@Override
	public CommonService getCommonService() {
		return postMarkService;
	}

	@Override
	public TbPostMark getModel() {
		if(null == this.model){
			this.model = new TbPostMark();
		}
		return this.model;
	}

	@Override
	public void setModel(TbPostMark model) {
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
