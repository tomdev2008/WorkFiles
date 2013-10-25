package com.unicom.mms.cms.action.web.server;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.cms.service.JobPolicService;
import com.unicom.mms.cms.service.PushMdnService;
import com.unicom.mms.entity.TbMdnType;
import com.unicom.mms.entity.TbPolic;
import com.unicom.mms.entity.TbPostMark;
import com.unicom.mms.entity.TbPushMdn;

public class PushMdnAction extends BaseAction<TbPushMdn, String>{
	
	private static final Logger LOGGER = Logger.getLogger(PushMdnAction.class);
	
	@Autowired(required=true)
	private PushMdnService pushMdnService;
	
	private TbMdnType mdnType;
	
	public File upload; //上传文件
	public String uploadFileName;//文件名称
	public String uploadContentType;//文件类型
	

	@Override
	public CommonService getCommonService() {
		return pushMdnService;
	}

	
	public TbMdnType getMdnType() {
		return mdnType;
	}


	public void setMdnType(TbMdnType mdnType) {
		this.mdnType = mdnType;
	}


	/**
	 * 
	* 方法用途和描述: 上传推送号码
	* @return
	* @author chenliang 新增日期：2013-4-10
	* @since mms-cms
	 */
	public String savePushMdn()
	{
		String result = null; 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file", upload);
		map.put("fileName", uploadFileName);
		map.put("txtUrl", getHttpRequest().getSession().getServletContext().getRealPath("/jsp/txt"));
		pushMdnService.savePushMdn(mdnType, map);
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

	@Override
	public TbPushMdn getModel() {
		if(null == this.model){
			this.model = new TbPushMdn();
		}
		return this.model;
	}



	@Override
	public void setModel(TbPushMdn model) {
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
