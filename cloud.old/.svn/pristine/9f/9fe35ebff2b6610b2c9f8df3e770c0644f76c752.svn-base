package cn.com.kxcomm.selfservice.action.web;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.nutz.json.Json;
import org.nutz.mvc.annotation.Ok;
import org.omg.PortableInterceptor.SUCCESSFUL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import cn.com.kxcomm.entity.TenantsEntity;
import cn.com.kxcomm.selfservice.action.util.AuthenticationUtil;
import cn.com.kxcomm.selfservice.action.util.SessionUtils;
import cn.com.kxcomm.selfservice.service.CommonService;
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
public class TenantsAuthenticationAction extends BaseAction<TenantsEntity, String> {
	/**
	 * 说明清楚此属性的业务含义
	 */
	private static final long serialVersionUID = 7456715684775676928L;
	private static Logger LOGGER = Logger.getLogger(TenantsAuthenticationAction.class);
	
	private String errorCode;
	
	@Autowired(required = true)
	private TenantsService tenantsService;
	private String verificationCode; //验证码
	
	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

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
	* 方法用途和描述: 用户登陆
	* @return
	* @author chenliang 新增日期：2013-9-10
	* @since system_center_web
	 */
	public String tenantsLogin()   {
		HttpSession session = getHttpSession();
		LOGGER.debug("session verificationCode:"+session.getAttribute(SessionUtils.VERIFICATION_CODE)+",verificationCode:"+verificationCode);
		msg = "ok";
		if (null == getModel().getAccount() || null == getModel().getPassword()) {
			LOGGER.debug("输入的账号，密码为空，登录失败...");
			msg = "error";
		} else if (!verificationCode.equals(session.getAttribute(SessionUtils.VERIFICATION_CODE))) {
			LOGGER.debug("输入的验证码错误，登录失败...");
			msg = "verificationCodeError";
		}
		String passwd = getModel().getPassword();
		LOGGER.debug("[after MD5,account,passwd]:" +  getModel().getAccount()+","+getModel().getPassword());
		TenantsEntity ce = null;
		try {
			LOGGER.debug("[=============tenantsService=============]"+tenantsService);
			ce = tenantsService.searchLogin(getModel().getAccount());
			if(null!=ce){
				if(ce.getPassword().equals(passwd)){  //验证密码
					session.setAttribute(SessionUtils.USER_NAME,getModel().getAccount());
					session.setAttribute(SessionUtils.USER,ce);
					msg = "ok";
				}else{
					msg = "no";
				}
			}else{
				msg = "no";
			}
		} catch (Exception ex) {
			LOGGER.error("checkLogin() Error:", ex);
			msg = "no";
		}
		return successInfo(msg);
	}
	
	/**
	 * 
	* 方法用途和描述: 用户注册
	* @return
	* @author chenliang 新增日期：2013-10-18
	* @since system_center_web
	 */
	public String tenantsRegister(){
		System.out.println("register entity:"+Json.toJson(model));
		try {
			tenantsService.register(model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return successInfo("ok");
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
		LOGGER.info("--------logout--");
//		AuthenticationUtil.clearCurrentUserAccount(getSessionMap());
		return LOGIN;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorCode() {
		return errorCode;
	}

	
	
	@Override
	public CommonService getCommonService() {
		return tenantsService;
	}

	@Override
	public TenantsEntity getModel() {
		if(this.model == null){
			this.model = new TenantsEntity();
		}
		return this.model;
	}

	@Override
	public void setModel(TenantsEntity model) {
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
