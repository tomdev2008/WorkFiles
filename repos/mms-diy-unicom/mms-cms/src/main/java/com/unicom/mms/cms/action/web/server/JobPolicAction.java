package com.unicom.mms.cms.action.web.server;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.unicom.mms.base.constants.BusinessConstants;
import com.unicom.mms.cms.action.util.SessionUtils;
import com.unicom.mms.cms.action.web.BaseAction;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.cms.service.JobPolicService;
import com.unicom.mms.cms.vo.PolicEntity;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.constants.SharePublicContants;
import com.unicom.mms.entity.TbPolic;

/**
 * 
* 功能描述:策略任务管理
* @author chenliang 新增日期：2013-6-28
* @since mms-cms
 */
public class JobPolicAction extends BaseAction<TbPolic, String>{
	
	private static final Logger LOGGER = Logger.getLogger(JobPolicAction.class);
	
	@Autowired(required=true)
	private JobPolicService jobPolicService;
	
	private String id; //主键id
	private PolicEntity policEntity; //策略Vo
	public File upload; //上传文件
	public String uploadFileName;//文件名称
	public String uploadContentType;//文件类型
	
	/**
	 * 
	* 方法用途和描述: 保存策略
	* @return
	* @author chenliang 新增日期：2013-6-27
	* @since mms-cms
	 */
	public String saveJobPolic(){
		String result = null; 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("file", upload);
		map.put("fileName", uploadFileName);
		map.put("mmsUrl", getHttpRequest().getSession().getServletContext().getRealPath("/jsp/img"));
		if(null==policEntity){
			policEntity = new PolicEntity();
		}
		map.put("policEntity", policEntity);
		
		//设置当前登陆用户账号
		HttpSession session = getHttpSession();
		long userId = (Long) session.getAttribute(SessionUtils.USER_ID);
		getModel().setCreator(userId);
		jobPolicService.saveJobPolic(getModel(),map);
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
	* 方法用途和描述: 修改策略
	* @return
	* @author chenliang 新增日期：2013-6-27
	* @since mms-cms
	 */
	public String updateJobPolic(){
		try {
			//设置当前登陆用户账号
			HttpSession session = getHttpSession();
			long userId = (Long) session.getAttribute(SessionUtils.USER_ID);
			getModel().setCreator(userId);
			jobPolicService.updateJobPolic(getModel(),policEntity);
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
	* 方法用途和描述: 启动
	* @return
	* @author chenliang 新增日期：2013-6-28
	* @since mms-cms
	 */
	public String start(){
		jobPolicService.startOrStop(id,SharePublicContants.JOB_STATUES_START);
		return successInfo("ok");
	}
	
	/**
	 * 
	* 方法用途和描述: 停止
	* @return
	* @author chenliang 新增日期：2013-6-28
	* @since mms-cms
	 */
	public String stop(){
		jobPolicService.startOrStop(id,SharePublicContants.JOB_STATUES_STOP);
		return successInfo("ok");
	}
	
	/**
	 * 
	* 方法用途和描述: 根据主键id查询
	* @return
	* @author chenliang 新增日期：2013-6-28
	* @since mms-cms
	 */
	public String findByPkid(){
		int pkid = 0;
		if(!BlankUtil.isBlank(id)){
			pkid = Integer.parseInt(id);
		}
		this.model = jobPolicService.getByPk(pkid);
		if(null!=this.model){
			policEntity = new PolicEntity();
			SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat hms = new SimpleDateFormat("HH:mm");
			policEntity.setStartSendDate(ymd.format(this.model.getStartSendTime()));
			policEntity.setStartTime(hms.format(this.model.getStartSendTime()));
			policEntity.setEndSendDate(ymd.format(this.model.getEndSendTime()));
			policEntity.setEndTime(hms.format(this.model.getEndSendTime()));
		}
		return successInfo("ok");
	}
	
	@Override
	public CommonService getCommonService() {
		return jobPolicService;
	}

	@Override
	public TbPolic getModel() {
		if(null==model){
			model = new TbPolic();
		}
		return model;
	}

	@Override
	public void setModel(TbPolic model) {
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

	public PolicEntity getPolicEntity() {
		return policEntity;
	}

	public void setPolicEntity(PolicEntity policEntity) {
		this.policEntity = policEntity;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
