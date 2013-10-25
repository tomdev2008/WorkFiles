package cn.com.mmsweb.action.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.common.MD5;
import cn.com.mmsweb.action.util.SessionUtils;
import cn.com.mmsweb.service.CommonService;
import cn.com.mmsweb.service.UserService;

import com.googlecode.jsonplugin.annotations.JSON;
import com.unicom.mms.entity.TbUsers;

public class UserAction extends BaseAction<TbUsers, String> {
	
	private static final Logger LOGGER = Logger.getLogger(UserAction.class);

	private static final long serialVersionUID = 1L;

	private String pwd;
	private String msn;
	private String oldPasswd;
	@Autowired(required=true)
	public UserService userService;

	public String bgwideth;
	public String bghiehgt;
	public String bgurl;
	public String laywideth;
	public String layhiehgt;
	public String layurl;
	public String picwideth;
	public String pichiehgt;
	public String picurl;
	public String postwideth;
	public String posthiehgt;
	public String posturl;
   
	
	
	public String getOldPasswd() {
		return oldPasswd;
	}

	public void setOldPasswd(String oldPasswd) {
		this.oldPasswd = oldPasswd;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getMsn() {
		return msn;
	}

	public void setMsn(String msn) {
		this.msn = msn;
	}

	@JSON(serialize=true)
	public UserService getUserService() {
		return this.userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getBgwideth() {
		return this.bgwideth;
	}

	public void setBgwideth(String bgwideth) {
		this.bgwideth = bgwideth;
	}

	public String getBghiehgt() {
		return this.bghiehgt;
	}

	public void setBghiehgt(String bghiehgt) {
		this.bghiehgt = bghiehgt;
	}

	public String getBgurl() {
		return this.bgurl;
	}

	public void setBgurl(String bgurl) {
		this.bgurl = bgurl;
	}

	public String getLaywideth() {
		return this.laywideth;
	}

	public void setLaywideth(String laywideth) {
		this.laywideth = laywideth;
	}

	public String getLayhiehgt() {
		return this.layhiehgt;
	}

	public void setLayhiehgt(String layhiehgt) {
		this.layhiehgt = layhiehgt;
	}

	public String getLayurl() {
		return this.layurl;
	}

	public void setLayurl(String layurl) {
		this.layurl = layurl;
	}

	public String getPicwideth() {
		return this.picwideth;
	}

	public void setPicwideth(String picwideth) {
		this.picwideth = picwideth;
	}

	public String getPichiehgt() {
		return this.pichiehgt;
	}

	public void setPichiehgt(String pichiehgt) {
		this.pichiehgt = pichiehgt;
	}

	public String getPicurl() {
		return this.picurl;
	}

	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}

	public String getPostwideth() {
		return this.postwideth;
	}

	public void setPostwideth(String postwideth) {
		this.postwideth = postwideth;
	}

	public String getPosthiehgt() {
		return this.posthiehgt;
	}

	public void setPosthiehgt(String posthiehgt) {
		this.posthiehgt = posthiehgt;
	}

	public String getPosturl() {
		return this.posturl;
	}

	public void setPosturl(String posturl) {
		this.posturl = posturl;
	}

	public String verificationCode;  //验证砄1�7

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}


	/**
	 * 
	 * 方法用途和描述: 用户登录
	 * @return
	 * @author lizl 新增日期 2013-03-09
	 * @author 你的姓名 修改日期 2013-03-09
	 * @throws SQLException 
	 * @throws IOException 
	 * @throws ServletException 
	 * @since mms_web
	 */
	public String login() throws SQLException, ServletException, IOException {
		HttpSession session = getHttpSession();
		LOGGER.debug("session verificationCode:"+session.getAttribute(SessionUtils.VERIFICATION_CODE)+",verificationCode:"+verificationCode);
		if (null == getModel().getMdn() || null == getModel().getPwd()) {
			LOGGER.debug("输入的账号，密码为空，登录失败...");
			return successInfo("error");
		} else if (!verificationCode.equals(session.getAttribute(SessionUtils.VERIFICATION_CODE))) {
			LOGGER.debug("输入的验证码错误，登录失败...");
			return successInfo("verificationCodeError");
		}
//		String passwd = MD5.toMD5(getModel().getPwd());
		String passwd = getModel().getPwd();
		LOGGER.debug("[after MD5,account,passwd]:" +  getModel().getMdn()+","+getModel().getPwd());
		TbUsers ce = null;
		try {
			LOGGER.debug("[=============userService=============]"+userService);
			ce = userService.checkLogin(getModel().getMdn());
			if(null!=ce){
				if(ce.getPwd().equals(passwd)){  //验证密码
					session.setAttribute(SessionUtils.USER_NAME,getModel().getMdn());
					session.setAttribute(SessionUtils.USER,ce);
					return successInfo("ok");
				}else{
					return successInfo("no");
				}
			}else{
				return successInfo("no");
			}
		} catch (Exception ex) {
			LOGGER.error("checkLogin() Error:", ex);
			return successInfo("no");
		}
	}

	/**
	 * 
	 * 方法用途和描述: 用户注销
	 * @return
	 * @author chenhui 新增日期 2013-03-09
	 * @author 你的姓名 修改日期 2013-03-09
	 * @throws IOException 
	 * @throws ServletException 
	 * @since zte_ipmi_bi
	 */
	public String loginOut() throws IOException, ServletException {
		HttpSession session = getHttpSession();
		String userName = (String) session.getAttribute(SessionUtils.USER_NAME);
		if (null != userName) {
			session.removeAttribute(SessionUtils.USER_NAME);
			log.debug("用户" + userName + "成功退出.");
		}
		return successInfo("ok");
	}

	/**
	 * 旧密码验评1�7
	 * @return
	 */
	public String checkPasswd(){
		String str = "ok";
		try{		
			HttpSession session = getHttpSession();
			TbUsers entity = (TbUsers) session.getAttribute(SessionUtils.USER);
			boolean flag = userService.checkPasswd(entity.getId(), oldPasswd);
			if(flag){
				str = "ok";
			}else{
				str = "no";
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return successInfo(str);
	}

	/**
	 * 修改密码
	 * @return
	 */
	public String updatePasswd(){
		HttpSession session = getHttpSession();
		TbUsers entity = (TbUsers) session.getAttribute(SessionUtils.USER);
		 TbUsers user=userService.getByPk(entity.getId());
	//	 String passwd = MD5.toMD5(pwd);
		 user.setPwd(pwd);
		userService.updatePWD(user);
		return successInfo("ok");
	}

	/**
	 * 密码初始匄1�7
	 * @retur
	 */
	public String initPasswd(){
		Long userId = getModel().getId();
		log.debug("initPasswd id:"+userId);
		userService.initPasswd(userId);
		return successInfo("ok");
	}


	/**
	 * 棄1�7查账户名是否存在
	 * @return
	 */
	public String checkAccount() {
		String str = "ok";
//		String accouont = getModel().getAccouont();
//		boolean temp = userService.checkAccount(accouont);
//		if (!temp) {
//			str = "ok";
//		} else {
//			str = "no";
//		}
		return successInfo(str);
	}

	//整理前台传回来的url
	public String changeUrlStyle() {
		this.bgurl = this.bgurl.substring(this.bgurl.indexOf("test")+16,this.bgurl.indexOf(")")-1);
		System.out.println(this.bgurl);
		this.picurl = this.picurl.substring(this.picurl.indexOf("test")+16,this.picurl.indexOf("jpg")+3);
		System.out.println(this.picurl);
		this.layurl = this.layurl.substring(this.layurl.indexOf("test")+16,this.layurl.indexOf(")")-1);
		System.out.println(this.layurl);
		this.posturl = this.posturl.substring(this.posturl.indexOf("test")+16,this.posturl.indexOf(")")-1);
		System.out.println(this.posturl);
		return SUCCESS;
	}
	
	//创建合成图片
	public String createPicture() {
		changeUrlStyle();
		HttpServletRequest request = ServletActionContext.getRequest();
		String str = "";		//图片名称
		str = request.getSession().getServletContext().getRealPath("common/testImages/test/")+File.separator;
		System.out.println(str);
		try {
	      //读取背景图片
	      File fileOne = new File(str+this.bgurl);
	      BufferedImage ImageOne = ImageIO.read(fileOne);
	      int width = ImageOne.getWidth();//图片宽度
	      int height = ImageOne.getHeight();//图片高度
	      System.out.println("width:" +width +"    "+"height:"+height);
	      //从图片中读取RGB
	      int[] ImageArrayOne = new int[width*height];
	      ImageArrayOne = ImageOne.getRGB(0,0,width,height,ImageArrayOne,0,width);
	      //对第二张图片做相同的处理
	      File fileTwo = new File(str+this.picurl);
	      BufferedImage ImageTwo = ImageIO.read(fileTwo);
	      int width1 = ImageTwo.getWidth();//图片宽度
	      int height1 = ImageTwo.getHeight();//图片高度
	      System.out.println("width1:" +width1 +"    "+"height1:"+height1);
	      int[] ImageArrayTwo = new int[width1*height1];
	      ImageArrayTwo = ImageTwo.getRGB(0,0,width1,height1,ImageArrayTwo,0,width1);
	    //对第三张图片做相同的处理
	      File fileThree = new File(str+this.layurl);
	      BufferedImage ImageThree = ImageIO.read(fileThree);
	      int width2 = ImageThree.getWidth();//图片宽度
	      int height2 = ImageThree.getHeight();//图片高度
	      System.out.println("width2:" +width2 +"    "+"height2:"+height2);
	      int[] ImageArrayThree = new int[width2*height2];
	      ImageArrayThree = ImageThree.getRGB(0,0,width2,height2,ImageArrayThree,0,width2);
	    //对第四张图片做相同的处理
	      File fileFour = new File(str+this.posturl);
	      BufferedImage ImageFour = ImageIO.read(fileFour);
	      int width3 = ImageFour.getWidth();//图片宽度
	      int height3 = ImageFour.getHeight();//图片高度
	      System.out.println("width3:" +width3 +"    "+"height3:"+height3);
	      int[] ImageArrayFour = new int[width3*height3];
	      ImageArrayFour = ImageFour.getRGB(0,0,width3,height3,ImageArrayFour,0,width3);
	      //生成新图片
	      BufferedImage ImageNew = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
	      ImageNew.setRGB(0,0,width,height,ImageArrayOne,0,width);//设置背景图的RGB
	      ImageNew.setRGB(Integer.parseInt(this.picwideth),Integer.parseInt(this.pichiehgt),width1,height1,ImageArrayTwo,0,width1);//设置相片的RGB
	      ImageNew.setRGB(Integer.parseInt(this.laywideth),Integer.parseInt(this.layhiehgt),width2,height2,ImageArrayThree,0,width2);//设置邮票的RGB
	      ImageNew.setRGB(Integer.parseInt(this.postwideth),Integer.parseInt(this.posthiehgt),width3,height3,ImageArrayFour,0,width3);//设置邮戳的RGB
	      str = request.getSession().getServletContext().getRealPath("newpicture/")+File.separator;
	      File outFile = new File(str+"girlfriend.jpg");
	      ImageIO.write(ImageNew, "jpg", outFile);//写图片
	    } catch(Exception e) {
	      e.printStackTrace();
	    }
		return successInfo(str+"girlfriend.jpg");	//返回图片名称
	}
	//修改密码
	public String updatePWD()
	{
		TbUsers user=userService.findByMsn(msn);
		//String passwd = MD5.toMD5(pwd);
		user.setPwd(pwd);
		userService.updatePWD(user);
		return successInfo("ok");
	}
	/**
	 * 验证用户输入号码是否存在
	 * @return
	 */
	public String initMdn(){
		log.debug("initMdn mdn:"+msn);
		TbUsers users=userService.findByMsn(msn);
		if(users==null)
		{
		 return successInfo("error");
		}else{
		  return successInfo("ok");
	    }
		}

	@Override
	@JSON(serialize=false)
	public CommonService getCommonService() {
		return userService;
	}

	@Override
	public TbUsers getModel() {
		if(null==this.model){
			this.model = new TbUsers();
		}
		return this.model;
	}

	@Override
	public void setModel(TbUsers model) {
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
