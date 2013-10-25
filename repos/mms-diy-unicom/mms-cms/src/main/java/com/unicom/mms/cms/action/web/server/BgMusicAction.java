package com.unicom.mms.cms.action.web.server;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.service.BgMusicService;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.common.AppConfig;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.entity.TbBgMusic;

public class BgMusicAction extends BaseAction<TbBgMusic, String>{
	private static final Logger LOGGER = Logger.getLogger(BgMusicAction.class);
	@Autowired(required=true)
	private BgMusicService bgMusicService;
	
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

	public BgMusicService getBgMusicService() {
		return bgMusicService;
	}

	public void setBgMusicService(BgMusicService bgMusicService) {
		this.bgMusicService = bgMusicService;
	}
	
	/**
	 * 
	* 方法用途和描述: 上传背景音乐
	* @return
	* @author chenliang 新增日期：2013-6-20
	* @since mms-cms
	 */
	public String saveBgmusic(){
		String result = null; 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file", upload);
		map.put("fileName", uploadFileName);
		String bgMusicPath =AppConfig.getInstance().getString("cmsUploadPath");
		bgMusicPath += File.separator+"bgMusic";
		map.put("picUrl", bgMusicPath);
		bgMusicService.saveBgMuisc(getModel(), map);
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
	* 方法用途和描述: 修改背景音乐
	* @return
	* @author chenliang 新增日期：2013-6-20
	* @since mms-cms
	 */
	public String updateBgmusic(){
		try {
			bgMusicService.updateBgMusic(getModel());
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
		this.model = bgMusicService.getByPk(pkid);
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
		return bgMusicService;
	}

	@Override
	public TbBgMusic getModel() {
		if(null == this.model){
			this.model = new TbBgMusic();
		}
		return this.model;
	}

	@Override
	public void setModel(TbBgMusic model) {
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
