package cn.com.kxcomm.selfservice.action;

import org.apache.log4j.Logger;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import cn.com.kxcomm.base.action.BaseAction;
import cn.com.kxcomm.common.AuthenticationUtil;
import cn.com.kxcomm.entity.TenantsEntity;
import cn.com.kxcomm.selfservice.service.TenantsService;

/***
 * 
 * 功能描述:
 * <p>版权所有：
 * <p>未经本公司许可，不得以任何方式复制或使用本程序任何部分
 *
 * @author 刘小明 新增日期：2013-4-10
 * @author 你的姓名 修改日期：2013-4-10
 * @since edu-web
 */
@Controller
public class TenantsAuthenticationAction extends BaseAction {
	/**
	 * 说明清楚此属性的业务含义
	 */
	private static final long serialVersionUID = 7456715684775676928L;
	private static Logger _log = Logger.getLogger(TenantsAuthenticationAction.class);
	
	private String errorCode;
	
	@Autowired(required = true)
	private TenantsService tenantsService;
	
	
	public TenantsService getTenantsService() {
		return tenantsService;
	}

	public void setTenantsService(TenantsService tenantsService) {
		this.tenantsService = tenantsService;
	}

	private TenantsEntity entity;
	
	public TenantsEntity getEntity() {
		return entity;
	}

	public void setEntity(TenantsEntity entity) {
		this.entity = entity;
	}

	/**
	 * 
	* 方法用途和描述: 登陆
	* @return
	* @author chenliang 新增日期：2013-9-10
	* @since system_center_web
	 */
	public String tenantsLogin()   {
		
		System.out.println("登陆请求地址。。。");
		System.out.println("entity:"+Json.toJson(entity));
		System.out.println("tenantsService:"+tenantsService);
		tenantsService.searchLogin(entity);
		return SUCCESS;
	}

	public String reg(){
//		long id = studentService.getMaxId();
//		TbStudent student = new TbStudent();
//		student.setId(id+1);
//		AuthenticationUtil.setStudentRegister(getSessionMap(), student);
		return SUCCESS;
	}

	public String uploadhead(){
//		try{
//			TbStudent studentSession=AuthenticationUtil.getStudentRegister(getSessionMap());
//			String savePath = ServletActionContext.getRequest().getRealPath(""); 
//			savePath = savePath + "/student/"+studentSession.getId()+"/";
//			File savePathDir=new File(savePath);
//			if(!savePathDir.exists())savePathDir.mkdirs();//如果文件不存在就创建
//			String extName = "";//扩展名   
//			String newFileName= "";//新文件名 
//			//		System.out.println("原文件名称：" + this.headPicFileName); 
//			//获取扩展名   
//			if(this.headPicFileName.lastIndexOf(".") > -1){   
//				extName = this.headPicFileName.substring(this.headPicFileName.lastIndexOf("."));   
//			}   
//			//	  String nowTime = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());//当前时间 
//			newFileName = studentSession.getId() + extName;   
//			String entityPath="/student/"+studentSession.getId()+"/"+newFileName;
////			System.out.println("save path：" + savePath + newFileName); 
//			//		System.out.println("入库的路径名称：" +  entityPath); 
//			savePathDir=new File(savePath + newFileName);
//			if(savePathDir.exists())
//				savePathDir.delete();
////					System.out.println(this.headPic.renameTo(savePathDir)); 
//			FileUtils.copyFile(headPic, savePathDir);
//			HttpServletResponse response = ServletActionContext.getResponse();   
//			response.setCharacterEncoding("utf-8"); 
//			response.getWriter().print("上传成功《" + headPicFileName + "》！"); 
//			studentSession.setPhotoPath(entityPath);
//
//			AuthenticationUtil.setStudentRegister(getSessionMap(), studentSession);
//			//			teacherService.updateteacher(teacherSession);
//		}catch (Exception e){
//			System.out.println(e);
//		}
		return null; //这里不需要页面转向，所以返回空就可以了    
	} 

	public String initIndex(){
		return SUCCESS;
	}
	public String messageboard(){
		return SUCCESS;
	}
	public String logout() {
		_log.info("--------logout--");
		AuthenticationUtil.clearCurrentUserAccount(getSessionMap());
		return LOGIN;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorCode() {
		return errorCode;
	}

}
