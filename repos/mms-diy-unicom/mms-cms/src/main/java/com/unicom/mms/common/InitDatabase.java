package com.unicom.mms.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.log4j.Logger;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.google.gson.reflect.TypeToken;
import com.google.gson.Gson;
import com.unicom.mms.cms.dao.BgMusicDAO;
import com.unicom.mms.cms.dao.BgPicDAO;
import com.unicom.mms.cms.dao.CardTypeDAO;
import com.unicom.mms.cms.dao.ContactDAO;
import com.unicom.mms.cms.dao.DecorationDAO;
import com.unicom.mms.cms.dao.DecorationTypeDAO;
import com.unicom.mms.cms.dao.FrameTypeDAO;
import com.unicom.mms.cms.dao.GroupContactsDAO;
import com.unicom.mms.cms.dao.GroupsDAO;
import com.unicom.mms.cms.dao.HotbillboardDAO;
import com.unicom.mms.cms.dao.NewbillboardDAO;
import com.unicom.mms.cms.dao.PhotoFrameDAO;
import com.unicom.mms.cms.dao.PostMarkDAO;
import com.unicom.mms.cms.dao.RightDAO;
import com.unicom.mms.cms.dao.RightRoleDAO;
import com.unicom.mms.cms.dao.RoleDAO;
import com.unicom.mms.cms.dao.StampDAO;
import com.unicom.mms.cms.dao.TemplateCardDAO;
import com.unicom.mms.cms.dao.UserDAO;
import com.unicom.mms.cms.dao.UsersDAO;
import com.unicom.mms.cms.entity.TbCmsUser;
import com.unicom.mms.cms.entity.TbRight;
import com.unicom.mms.cms.entity.TbRightRole;
import com.unicom.mms.cms.entity.TbRightRoleId;
import com.unicom.mms.cms.entity.TbRole;
import com.unicom.mms.entity.TbBgMusic;
import com.unicom.mms.entity.TbBgPic;
import com.unicom.mms.entity.TbCardType;
import com.unicom.mms.entity.TbContacts;
import com.unicom.mms.entity.TbDecoration;
import com.unicom.mms.entity.TbDecorationType;
import com.unicom.mms.entity.TbFrameType;
import com.unicom.mms.entity.TbGroupContacts;
import com.unicom.mms.entity.TbGroups;
import com.unicom.mms.entity.TbHotBillboard;
import com.unicom.mms.entity.TbNewBillboard;
import com.unicom.mms.entity.TbPhotoFrame;
import com.unicom.mms.entity.TbPostMark;
import com.unicom.mms.entity.TbStamp;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.entity.TbUsers;
import com.unicom.mms.mcp.webservice.Mcp;
import com.unicom.mms.mcp.webservice.McpServiceLocator;
import com.unicom.mms.mcp.webservice.Response;
import com.unicom.mms.resources.FileType;
import com.unicom.mms.resources.socket.ClientSocket;

/**
 * 初始化系统数据
 * 
 * @author Administrator
 * 
 */
public class InitDatabase {
	private ApplicationContext ctx;
	private static RightDAO rightDAO;
	private RoleDAO roleDAO;
	private UserDAO userDAO;
	private TemplateCardDAO templateCardDAO; //模版明信片
	private static RightRoleDAO rightRoleDAO;  //模版明信片
	private FrameTypeDAO frameTypeDAO;  //相框类型
	private PhotoFrameDAO photoFrameDAO; //相框
	private PostMarkDAO postMarkDAO; //邮戳
	private StampDAO stampDAO; //邮票
	private DecorationTypeDAO decorationTypeDAO; //饰品类型
	private DecorationDAO decorationDAO; //饰品
	private CardTypeDAO cardTypeDAO;  //模板明信片类型
	private BgMusicDAO bgMusicDAO;   //背景音乐
	private HotbillboardDAO hotbillboardDAO; //最热推荐
	private NewbillboardDAO newbillboardDAO; //最新推荐
	private ContactDAO contactDAO;//联系人
	private GroupContactsDAO groupContactsDAO; //联系人与分组关系
	private GroupsDAO groupsDAO;//分组
	private UsersDAO usersDAO; //登陆用户
	private BgPicDAO bgPicDAO; //背景图片
	
	private static InitDatabase instance = null;
	private static final Logger log = Logger.getLogger(InitDatabase.class);
	private static final String path = System.getProperty("user.dir"); //项目存放本地路径
	
	private static final String socketHost = AppConfig.getInstance().getString("socketHost");  //socket地址
	private static final Integer socketport = AppConfig.getInstance().getInt("socketport");;   //socket端口
	
	private static final String basePath =AppConfig.getInstance().getString("initImagesPath");
	private static final String diyPath = basePath+"相框";  //相框
	private static final String bgMusicPath = basePath+"背景音乐";  //背景音乐
	private static final String templateCardPath =basePath+"模板明信片"; //模板明信片
	private static final String decorationPath = basePath+"饰品"; //饰品
	private static final String stampPath = basePath+"邮票";  //邮票
	private static final String postMarkPath = basePath+"邮戳"; //邮戳
	private static final String bgPicPath = basePath+"背景图片"; //背景图片
	
	public InitDatabase() {
		ctx = new ClassPathXmlApplicationContext("modules/applicationContext.xml");
		if (ctx != null)
			System.out.println("success spring");
		rightDAO = (RightDAO) ctx.getBean("rightDAO");
		roleDAO = (RoleDAO) ctx.getBean("roleDAO");
		userDAO = (UserDAO) ctx.getBean("userDAO");
		rightRoleDAO = (RightRoleDAO) ctx.getBean("rightRoleDAO");
		
		frameTypeDAO = (FrameTypeDAO) ctx.getBean("frameTypeDAO");
		photoFrameDAO = (PhotoFrameDAO) ctx.getBean("photoFrameDAO");
		postMarkDAO = (PostMarkDAO) ctx.getBean("postMarkDAO");
		stampDAO = (StampDAO) ctx.getBean("stampDAO");
		decorationTypeDAO = (DecorationTypeDAO) ctx.getBean("decorationTypeDAO");
		decorationDAO = (DecorationDAO) ctx.getBean("decorationDAO");
		cardTypeDAO = (CardTypeDAO) ctx.getBean("cardTypeDAO");
		templateCardDAO = (TemplateCardDAO) ctx.getBean("templateCardDAO");
		bgMusicDAO=(BgMusicDAO) ctx.getBean("bgMusicDAO");
		hotbillboardDAO = (HotbillboardDAO) ctx.getBean("hotbillboardDAO");
		newbillboardDAO = (NewbillboardDAO) ctx.getBean("newbillboardDAO");
		contactDAO = (ContactDAO) ctx.getBean("contactDAO");
		groupContactsDAO = (GroupContactsDAO) ctx.getBean("groupContactsDAO");
		groupsDAO = (GroupsDAO) ctx.getBean("groupsDAO");
		usersDAO = (UsersDAO) ctx.getBean("usersDAO");
		bgPicDAO = (BgPicDAO) ctx.getBean("bgPicDAO");
	}

	public static InitDatabase getSingleInstance(){
		if(instance==null){
			instance = new InitDatabase();
		}
		return instance;
	}

	//TODO 
	public void writeData(){
		/**
		 * 初始化权限数据
		 */
		String hql = "select count(tr.id) from TbRight tr ";
		int total = rightDAO.findTotalCount(hql, null);
		System.out.println("rightDAO:"+total);
		if(total<=0){
			//**********************第一级菜单*********************  
			//=======================1、系统管理======================
			TbRight tbRight = new TbRight();
			tbRight.setId(1);
			tbRight.setRightName("系统管理");
			tbRight.setRightLevel(1);
			rightDAO.save(tbRight);
			//=======================2、操作记录信息======================
			tbRight = new TbRight();
			tbRight.setId(2);
			tbRight.setRightName("操作记录管理");
			tbRight.setRightLevel(1);
			rightDAO.save(tbRight);
			//=======================3、服务管理======================
			tbRight = new TbRight();
			tbRight.setId(3);
			tbRight.setRightName("服务管理");
			tbRight.setRightLevel(1);
			rightDAO.save(tbRight);
			//=======================4、报表管理======================
			tbRight = new TbRight();
			tbRight.setId(4);
			tbRight.setRightName("报表管理");
			tbRight.setRightLevel(1);
			rightDAO.save(tbRight);
			//=======================5、任务管理======================
			tbRight = new TbRight();
			tbRight.setId(5);
			tbRight.setRightName("任务管理");
			tbRight.setRightLevel(1);
			rightDAO.save(tbRight);
			
			//**********************第二级菜单*********************
			//========1、系统管理========
			//+++++++++++++++++++++++++++++++++
			//        1.1、用户管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(11);
			tbRight.setRightName("用户管理");
			tbRight.setParid(1);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/user_manager/user_manager.jsp");
			rightDAO.save(tbRight);
			//+++++++++++++++++++++++++++++++++
			//        1.2、角色管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(12);
			tbRight.setRightName("角色管理");
			tbRight.setParid(1);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/role_manager/role_manager.jsp");
			rightDAO.save(tbRight);
			
			//========2、操作记录信息========
			//+++++++++++++++++++++++++++++++++
			//        2.1、服务记录查询
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(21);
			tbRight.setRightName("服务记录查询");
			tbRight.setParid(2);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/serviceInfo_manager/serviceInfo_summary.jsp");
			rightDAO.save(tbRight);
			
			//========3、服务管理========
			//+++++++++++++++++++++++++++++++++
			//        3.1、最新推荐管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(31);
			tbRight.setRightName("最新推荐管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/service_manager/newBillboard/newbillboard_manager.jsp");
			rightDAO.save(tbRight);
			//+++++++++++++++++++++++++++++++++
			//        3.2、热点推荐管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(32);
			tbRight.setRightName("热点推荐管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/service_manager/hotBillboard/hotbillboard_manager.jsp");
			rightDAO.save(tbRight);
			//+++++++++++++++++++++++++++++++++
			//        3.3、模板明信片管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(33);
			tbRight.setRightName("模板明信片管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/service_manager/templateCard/templatecard_manager.jsp");
			rightDAO.save(tbRight);
			//+++++++++++++++++++++++++++++++++
			//        3.4、相框管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(34);
			tbRight.setRightName("相框管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/service_manager/photoFrame/photoframe_manager.jsp");
			rightDAO.save(tbRight);
			//++++++++++++++++++++++++++++++++
			//        3.5、邮票管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(35);
			tbRight.setRightName("邮票管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/service_manager/stamp/stamp_manager.jsp");
			rightDAO.save(tbRight);
			//+++++++++++++++++++++++++++++++++
			//        3.6、饰物管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(36);
			tbRight.setRightName("饰物管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/service_manager/decoration/decoration_manager.jsp");
			rightDAO.save(tbRight);
			
			//+++++++++++++++++++++++++++++++++
			//        3.7、邮戳管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(37);
			tbRight.setRightName("邮戳管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/service_manager/postmark/postmark_manager.jsp");
			rightDAO.save(tbRight);
			
			//+++++++++++++++++++++++++++++++++
			//        3.8、饰物分类管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(38);
			tbRight.setRightName("饰物分类管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/service_manager/decorationType/decorationType_manager.jsp");
			rightDAO.save(tbRight);
			
			//+++++++++++++++++++++++++++++++++
			//        3.9、背景音乐管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(39);
			tbRight.setRightName("背景音乐管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/service_manager/bgmusic/bgmusic_manager.jsp");
			rightDAO.save(tbRight);
			
			//+++++++++++++++++++++++++++++++++
			//        3.10、背景图片管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(310);
			tbRight.setRightName("背景图片管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/service_manager/bgPic/bgPic_manager.jsp");
			rightDAO.save(tbRight);
			
			//+++++++++++++++++++++++++++++++++
			//        3.11、模板明星片类型管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(320);
			tbRight.setRightName("模板类型管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/service_manager/cardType/cardType_manager.jsp");
			rightDAO.save(tbRight);
			
			//+++++++++++++++++++++++++++++++++
			//        3.12、相框类型管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(330);
			tbRight.setRightName("相框类型管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/service_manager/frameType/frameType_manager.jsp");
			rightDAO.save(tbRight);
			
			
			//========4、报表========
			//+++++++++++++++++++++++++++++++++
			//        4.1、用户注册报表管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(41);
			tbRight.setRightName("用户注册报表管理");
			tbRight.setParid(4);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/serviceInfo_manager/serviceInfo_summary.jsp");
			rightDAO.save(tbRight);
			//+++++++++++++++++++++++++++++++++
			//        4.1、用户注册报表管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(42);
			tbRight.setRightName("用户注销报表管理");
			tbRight.setParid(4);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/serviceInfo_manager/serviceInfo_summary.jsp");
			rightDAO.save(tbRight);
			
			//========5、任务策略========
			//+++++++++++++++++++++++++++++++++
			//        5.1、任务策略管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(51);
			tbRight.setRightName("策略管理");
			tbRight.setParid(5);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/jobPolic_manager/jobPolic_manager.jsp");
			rightDAO.save(tbRight);
			
			//+++++++++++++++++++++++++++++++++
			//        5.2、推送号码管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(52);
			tbRight.setRightName("推送号码管理");
			tbRight.setParid(5);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/pushNumber_manager/pushNumber_manager.jsp");
			rightDAO.save(tbRight);
			
			//**********************第三级菜单*********************
			//+++++++++++++++++++++++++++++++++
			//        1.1.1、用户管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(111);
			tbRight.setRightName("用户action");
			tbRight.setParid(11);
			tbRight.setRightLevel(3);
			tbRight.setUrl("/user/user/user");
			rightDAO.save(tbRight);
			//---------------------------------//
			tbRight = new TbRight();
			tbRight.setId(112);
			tbRight.setRightName("用户action");
			tbRight.setParid(11);
			tbRight.setRightLevel(3);
			tbRight.setUrl("/role/role/role");
			rightDAO.save(tbRight);
			//+++++++++++++++++++++++++++++++++
			//        1.1.2、角色管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(121);
			tbRight.setRightName("角色action");
			tbRight.setParid(12);
			tbRight.setRightLevel(3);
			tbRight.setUrl("/role/role/role");
			rightDAO.save(tbRight);
			//---------------------------------//
			tbRight = new TbRight();
			tbRight.setId(122);
			tbRight.setRightName("用户action");
			tbRight.setParid(12);
			tbRight.setRightLevel(3);
			tbRight.setUrl("/right/right/right");
			rightDAO.save(tbRight);
			//+++++++++++++++++++++++++++++++++
			//        3.1.1、最新推荐管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(311);
			tbRight.setRightName("用户action");
			tbRight.setParid(31);
			tbRight.setRightLevel(3);
			tbRight.setUrl("/newbillboard/newbillboard/newbillboard");
			rightDAO.save(tbRight);
			//+++++++++++++++++++++++++++++++++
			//        3.1.3、最新推荐管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(331);
			tbRight.setRightName("用户action");
			tbRight.setParid(33);
			tbRight.setRightLevel(3);
			tbRight.setUrl("/templateCard/templateCard/templateCard");
			rightDAO.save(tbRight);
			log.info("初始化TbRight数据");
			
		}
		/**
		 * 初始角色限数据
		 */
		hql = "select count(*) from TbRole tr ";
		total = roleDAO.findTotalCount(hql, null);
		System.out.println("roleDAO:"+total);
		if(total<=0){
			TbRole tbrole = new TbRole();
			tbrole.setRolename("系统管理员");
			tbrole.setNote("初始化管理员");
			tbrole.setId(1l);
			roleDAO.save(tbrole);
			log.info("初始化TbRole数据");
		}
		/**
		 * 初始化用户数据
		 */
		hql = "select count(*) from TbCmsUser tr ";
		total = userDAO.findTotalCount(hql, null);
		System.out.println("rightDAO:"+total);
		if(total<=0){
			TbCmsUser tbuser = new TbCmsUser();
			tbuser.setAccouont("admin");
			tbuser.setEmail("chenliang@kxcomm.com.cn");
			tbuser.setNote("初始化管理员");
			tbuser.setPassword(MD5.toMD5("123"));
			tbuser.setPhoneNumber("15902021957");
			TbRole tbrole=new TbRole();
			tbrole.setId(1l);
			tbuser.setTbRole(tbrole);
			tbuser.setUserName("陈亮");
			userDAO.save(tbuser);
			log.info("初始化TbUser数据");
		}
		/**
		 * 初始化角色权限关系表
		 */
		hql = "select count(*) from TbRightRole tr ";
		total = roleDAO.findTotalCount(hql, null);
		log.info("rightDAO:"+total);
		if(total<=0){
			TbRightRoleId tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(1l);
			tbRightRoleId.setRoleId(1l);
			TbRightRole tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(2l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(3l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(4l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(5l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(11l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(12l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(21l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);

			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(31l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(32l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(33l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(34l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(35l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(36l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(37l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(38l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(39l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(310l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(320l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(330l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(41l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(42l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);			
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(51l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);		
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(52l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 初始化相框 和相框类型
	* @author chenliang 新增日期：2013-4-23
	 * @throws IOException 
	* @since mms-cms
	 */
	public void  initPhotoFrame() throws IOException{
		//1、初始化相框类型
		String hql = "select count(tf.id) from TbFrameType tf ";
		int total = frameTypeDAO.findTotalCount(hql, null);
		System.out.println("frameTypeDAO:"+total);
		TbFrameType entity = null;
		int[] ids = new int[5];
		if(total<=0){
			entity = new TbFrameType();
			entity.setId(1);
			entity.setName("工作商务");
			frameTypeDAO.save(entity);
			ids[0] = entity.getId();
			
			entity = new TbFrameType();
			entity.setId(2);
			entity.setName("节日祝福");
			frameTypeDAO.save(entity);
			
			entity = new TbFrameType();
			entity.setId(3);
			entity.setName("甜蜜爱情");
			frameTypeDAO.save(entity);
			
			entity = new TbFrameType();
			entity.setId(4);
			entity.setName("友谊万岁");
			frameTypeDAO.save(entity);
			
			entity = new TbFrameType();
			entity.setId(5);
			entity.setName("整蛊搞怪");
			frameTypeDAO.save(entity);
		
			//2、初始化相框
			hql = "select count(tf.id) from TbPhotoFrame tf ";
			total = photoFrameDAO.findTotalCount(hql, null);
			if(total<=0){
		
				try {
					File pathfile = new File(diyPath);
					if(pathfile.isDirectory()){
						String[] wishFile = pathfile.list(); //遍历该目录下所有的文件夹
						List<TbPhotoFrame> photoFrameList = new ArrayList<TbPhotoFrame>();
						for (int i = 0; i < wishFile.length; i++) {
							//读取本地文件，调用图片服务器接口，上传图片。
							File file = new File(diyPath+File.separator+wishFile[i]);
							if("工作商务".equals(file.getName())){  
								photoFrameList = setPhotoFrame(file.getPath(),"工作商务",1,photoFrameList);
							}else if("节日祝福".equals(file.getName())){  
								photoFrameList = setPhotoFrame(file.getPath(), "节日祝福", 2, photoFrameList);
							}else if("甜蜜爱情".equals(file.getName())){  
								photoFrameList = setPhotoFrame(file.getPath(), "甜蜜爱情",3, photoFrameList);
							}else if("友谊万岁".equals(file.getName())){  
								photoFrameList = setPhotoFrame(file.getPath(), "友谊万岁",4, photoFrameList);
							}else if("整蛊搞怪".equals(file.getName())){
								photoFrameList = setPhotoFrame(file.getPath(), "整蛊搞怪",5, photoFrameList);
							}
						}
						System.out.println("photoFrameList.size();"+photoFrameList.size());
						
						
						//调用接口的保存方法
	//					Mcp mcp = new McpServiceLocator().getMcpPort();
	//					Gson gson = new Gson();
	//					String jsonStr = gson.toJson(photoFrameList);
	//					String responseStr = mcp.photoFrameManage(jsonStr, 1);
	//					Response response = gson.fromJson(responseStr, new TypeToken<Response>(){}.getType());
					}
				
	//			} catch (ServiceException e) {
	//				e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		}
		
	}
	

	/**
	 * 
	* 方法用途和描述: 设置保存的对象
	* @param filePath  文件地址
	* @param fileName 文件名
	* @param type 相框类型
	* @param photoFrameList
	* @return
	* @throws IOException
	* @author chenliang 新增日期：2013-4-24
	* @since mms-cms
	 */
	private List<TbPhotoFrame> setPhotoFrame(String filePath,String fileName,int type,List<TbPhotoFrame> photoFrameList) throws IOException{
		File endfile = new File(filePath);
		String[] imgStr = endfile.list();
		for (int j = 0; j < imgStr.length; j++) {
			File imgFile = new File(imgStr[j]);
			long startTime = System.currentTimeMillis();
			if(imgFile.getName().startsWith("small")){
				break;
			}
			//大图
			String bigPath = new ClientSocket().sendFile(socketHost, socketport,filePath+File.separator+imgFile.getPath(),startTime+imgFile.getName(),"null",FileType.PhotoFrameType);
			//小图
			String smallFileName = "";
			if(imgFile.getName().contains(".")){
				smallFileName = imgFile.getName().substring(0, imgFile.getName().indexOf("."));
				smallFileName = "small_"+smallFileName+".jpg";
			}
			String smallPath = new ClientSocket().sendFile(socketHost, socketport,filePath+File.separator+smallFileName,startTime+smallFileName,"null",FileType.PhotoFrameType);
			
			TbPhotoFrame tbphotoFrame = new TbPhotoFrame();
			tbphotoFrame.setName(fileName);
			tbphotoFrame.setPicUrl(path);
			tbphotoFrame.setSmallFrame(smallPath);
			tbphotoFrame.setStauts(0);
			TbFrameType frameType = new TbFrameType();
			frameType.setId(type);
			tbphotoFrame.setFrameType(frameType);
			
			photoFrameDAO.save(tbphotoFrame);
			
			photoFrameList.add(tbphotoFrame);
		}
		return photoFrameList;
	}
	
	/**
	 * 
	* 方法用途和描述: 初始化邮戳
	* @author chenliang 新增日期：2013-4-23
	 * @throws IOException 
	* @since mms-cms
	 */
	public void initPostMark() throws IOException{
		String hql = "select count(tf.id) from TbPostMark tf ";
		int total = postMarkDAO.findTotalCount(hql, null);
		if(total<=0){
			try {
				File pathfile = new File(postMarkPath);
				if(pathfile.isDirectory()){
					String[] wishFile = pathfile.list(); //遍历该目录下所有的文件夹
					List<TbPostMark> postMarkList = new ArrayList<TbPostMark>();
					for (int i = 0; i < wishFile.length; i++) {
						//读取本地文件，调用图片服务器接口，上传图片。
						File imgFile = new File(postMarkPath+File.separator+wishFile[i]);
						
						String path = new ClientSocket().sendFile(socketHost, socketport,imgFile.getPath(),"postMark-"+imgFile.getName(),"null",FileType.PostMarkType);

						TbPostMark tbPoseMark = new TbPostMark();
						tbPoseMark.setName("postMark-"+imgFile.getName());
						tbPoseMark.setPicUrl(path);
						tbPoseMark.setStauts(0);
						postMarkDAO.save(tbPoseMark);
						
						postMarkList.add(tbPoseMark);
					}
					System.out.println("postMarkList.size();"+postMarkList.size());
					//调用接口的保存方法
//					Mcp mcp = new McpServiceLocator().getMcpPort();
//					Gson gson = new Gson();
//					String jsonStr = gson.toJson(photoFrameList);
//					String responseStr = mcp.photoFrameManage(jsonStr, 1);
//					Response response = gson.fromJson(responseStr, new TypeToken<Response>(){}.getType());
				}
			
//			} catch (ServiceException e) {
//				e.printStackTrace();
			} catch (RemoteException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 初始化邮票
	* @author chenliang 新增日期：2013-4-23
	 * @throws IOException 
	* @since mms-cms
	 */
	public void initStamp() throws IOException{
		String hql = "select count(tf.id) from TbStamp tf ";
		int total = stampDAO.findTotalCount(hql, null);
		if(total<=0){
			try {
				File pathfile = new File(stampPath);
				if(pathfile.isDirectory()){
					String[] wishFile = pathfile.list(); //遍历该目录下所有的文件夹
					List<TbStamp> postMarkList = new ArrayList<TbStamp>();
					for (int i = 0; i < wishFile.length; i++) {
						//读取本地文件，调用图片服务器接口，上传图片。
						File imgFile = new File(stampPath+File.separator+wishFile[i]);
						String path = new ClientSocket().sendFile(socketHost, socketport,imgFile.getPath(),"stamp-"+imgFile.getName(),"null",FileType.StampsType);
						TbStamp tbStamp = new TbStamp();
						tbStamp.setName("tbStamp-"+imgFile.getName());
						tbStamp.setPicUrl(path);
						tbStamp.setStauts(0);
						stampDAO.save(tbStamp);
						
						postMarkList.add(tbStamp);
					}
					System.out.println("postMarkList.size();"+postMarkList.size());

					//调用接口的保存方法
//					Mcp mcp = new McpServiceLocator().getMcpPort();
//					Gson gson = new Gson();
//					String jsonStr = gson.toJson(photoFrameList);
//					String responseStr = mcp.photoFrameManage(jsonStr, 1);
//					Response response = gson.fromJson(responseStr, new TypeToken<Response>(){}.getType());
				}
			
//			} catch (ServiceException e) {
//				e.printStackTrace();
			} catch (RemoteException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 初始化饰品 和饰品类型
	* @author chenliang 新增日期：2013-4-23
	 * @throws IOException 
	* @since mms-cms
	 */
	public void initDecoration() throws IOException{
		//1、初始化相框类型
		String hql = "select count(tf.id) from TbDecorationType tf ";
		int total = decorationTypeDAO.findTotalCount(hql, null);
		System.out.println("decorationTypeDAO:"+total);
		TbDecorationType entity = null;
		if(total<=0){
			entity = new TbDecorationType();
			entity.setId(1);
			entity.setName("表情");
			decorationTypeDAO.save(entity);
			
			entity = new TbDecorationType();
			entity.setId(2);
			entity.setName("道具");
			decorationTypeDAO.save(entity);
			
			entity = new TbDecorationType();
			entity.setId(3);
			entity.setName("动物");
			decorationTypeDAO.save(entity);
			
			entity = new TbDecorationType();
			entity.setId(4);
			entity.setName("节日");
			decorationTypeDAO.save(entity);
			
			entity = new TbDecorationType();
			entity.setId(5);
			entity.setName("蜜语");
			decorationTypeDAO.save(entity);
		}
		//2、初始化相框
		hql = "select count(tf.id) from TbDecoration tf ";
		total = decorationDAO.findTotalCount(hql, null);
		if(total<=0){
			try {
				File pathfile = new File(decorationPath);
				if(pathfile.isDirectory()){
					String[] wishFile = pathfile.list(); //遍历该目录下所有的文件夹
					List<TbDecoration> decorationList = new ArrayList<TbDecoration>();
					for (int i = 0; i < wishFile.length; i++) {
						//读取本地文件，调用图片服务器接口，上传图片。
						File file = new File(decorationPath+File.separator+wishFile[i]);
						if("表情".equals(file.getName())){  
							decorationList = setDecoration(file.getPath(),"表情",1,decorationList);
						}else if("道具".equals(file.getName())){  
							decorationList = setDecoration(file.getPath(), "道具", 2, decorationList);
						}else if("动物".equals(file.getName())){
							decorationList = setDecoration(file.getPath(), "动物",3, decorationList);
						}else if("节日".equals(file.getName())){ 
							decorationList = setDecoration(file.getPath(), "节日",4, decorationList);
						}else if("蜜语".equals(file.getName())){
							decorationList = setDecoration(file.getPath(), "蜜语",5, decorationList);
						}
					}
					
					System.out.println("decorationList.size();"+decorationList.size());
					//调用接口的保存方法
//							Mcp mcp = new McpServiceLocator().getMcpPort();
//							Gson gson = new Gson();
//							String jsonStr = gson.toJson(photoFrameList);
//							String responseStr = mcp.photoFrameManage(jsonStr, 1);
//							Response response = gson.fromJson(responseStr, new TypeToken<Response>(){}.getType());
				}
			
//					} catch (ServiceException e) {
//						e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 设置保存的对象
	* @param filePath  文件地址
	* @param fileName 文件名
	* @param type 相框类型
	* @param photoFrameList
	* @return
	* @throws IOException
	* @author chenliang 新增日期：2013-4-24
	* @since mms-cms
	 */
	private List<TbDecoration> setDecoration(String filePath,String fileName,int type,List<TbDecoration> decorationList) throws IOException{
		File endfile = new File(filePath);
		String[] imgStr = endfile.list();
		for (int j = 0; j < imgStr.length; j++) {
			File imgFile = new File(imgStr[j]);
			long startTime = System.currentTimeMillis();
			String path = new ClientSocket().sendFile(socketHost, socketport,filePath+File.separator+imgFile.getPath(),startTime+imgFile.getName(),"null",FileType.AccessoriesType);

			TbDecoration tbDecoration = new TbDecoration();
			tbDecoration.setName(fileName);
			tbDecoration.setPicUrl(path);
			tbDecoration.setStatus(0);
			TbDecorationType decorationType = new TbDecorationType();
			decorationType.setId(type);
			tbDecoration.setDecorationType(decorationType);
			decorationDAO.save(tbDecoration);
			
			decorationList.add(tbDecoration);
		}
		return decorationList;
	}
	
	/**
	 * 
	* 方法用途和描述: 初始化背景音乐
	* @author chenliang 新增日期：2013-4-23
	 * @throws IOException 
	* @since mms-cms
	 */
	public void initBgMusic() throws IOException{
		String hql = "select count(bm.id) from TbBgMusic bm ";
		int total = bgMusicDAO.findTotalCount(hql, null);
		if(total<=0){
			try {
				File pathfile = new File(bgMusicPath);
				if(pathfile.isDirectory()){
					String[] wishFile = pathfile.list(); //遍历该目录下所有的文件夹
					List<TbBgMusic> bgMusicList = new ArrayList<TbBgMusic>();
					for (int i = 0; i < wishFile.length; i++) {
						//读取本地文件，调用图片服务器接口，上传图片。
						File imgFile = new File(bgMusicPath+File.separator+wishFile[i]);
						Random random = new Random();
						String path = new ClientSocket().sendFile(socketHost, socketport,imgFile.getPath(),"music-"+random.nextInt(1000000)+imgFile.getName(),"null",FileType.MusicType);

						TbBgMusic bgMusic = new TbBgMusic();
						bgMusic.setName(imgFile.getName());
						bgMusic.setFileUrl(path);
						bgMusic.setStauts(0);
						bgMusicDAO.save(bgMusic);
						
						bgMusicList.add(bgMusic);
					}
					System.out.println("bgMusicList.size();"+bgMusicList.size());

					//调用接口的保存方法
//					Mcp mcp = new McpServiceLocator().getMcpPort();
//					Gson gson = new Gson();
//					String jsonStr = gson.toJson(photoFrameList);
//					String responseStr = mcp.photoFrameManage(jsonStr, 1);
//					Response response = gson.fromJson(responseStr, new TypeToken<Response>(){}.getType());
				}
			
//			} catch (ServiceException e) {
//				e.printStackTrace();
			} catch (RemoteException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 初始化模版明信片和模版明星片类型
	* @author chenliang 新增日期：2013-4-25
	 * @throws IOException 
	* @since mms-cms
	 */
	public void  initTemplateCard() throws IOException{
		//1、初始化模版明信片类型
			String hql = "select count(ct.id) from TbCardType ct ";
			int total = cardTypeDAO.findTotalCount(hql, null);
			TbCardType entity = null;
			if(total<=0){
				entity = new TbCardType();
				entity.setId(1);
				entity.setName("生日快乐");
				cardTypeDAO.save(entity);
				
				entity = new TbCardType();
				entity.setId(2);
				entity.setName("甜蜜祝福");
				cardTypeDAO.save(entity);
				
				entity = new TbCardType();
				entity.setId(3);
				entity.setName("温馨节日");
				cardTypeDAO.save(entity);
				
				entity = new TbCardType();
				entity.setId(4);
				entity.setName("我们的爱");
				cardTypeDAO.save(entity);
				
				entity = new TbCardType();
				entity.setId(5);
				entity.setName("炫彩请柬");
				cardTypeDAO.save(entity);
				
				entity = new TbCardType();
				entity.setId(6);
				entity.setName("整蛊搞笑");
				cardTypeDAO.save(entity);
			}
			//2、初始化模版明信片
			hql = "select count(tc.id) from TbTemplateCard tc ";
			total = cardTypeDAO.findTotalCount(hql, null);
			if(total<=0){
					File pathfile = new File(templateCardPath);
					if(pathfile.isDirectory()){
						String[] wishFile = pathfile.list(); //遍历该目录下所有的文件夹
						List<TbTemplateCard> templateCardList = new ArrayList<TbTemplateCard>();
						for (int i = 0; i < wishFile.length; i++) {
							//读取本地文件，调用图片服务器接口，上传图片。
							File file = new File(templateCardPath+File.separator+wishFile[i]);
							if("生日快乐".equals(file.getName())){  //呼朋唤友    festival-wish
								templateCardList = setTemplateCard(file.getPath(),"生日快乐",1,templateCardList);
							}else if("甜蜜祝福".equals(file.getName())){  //节日祝福  brithday-wish
								templateCardList = setTemplateCard(file.getPath(), "甜蜜祝福", 2, templateCardList);
							}else if("温馨节日".equals(file.getName())){  //生日祝福 sweet-love
								templateCardList = setTemplateCard(file.getPath(), "温馨节日",3, templateCardList);
							}else if("我们的爱".equals(file.getName())){  //甜蜜爱情 tricky-funny
								templateCardList = setTemplateCard(file.getPath(), "我们的爱",4, templateCardList);
							}else if("炫彩请柬".equals(file.getName())){//温馨祝福  warm-wish
								templateCardList = setTemplateCard(file.getPath(), "炫彩请柬",5, templateCardList);
							}else if("整蛊搞笑".equals(file.getName())){//整蛊搞笑  warm-wish
								templateCardList = setTemplateCard(file.getPath(), "整蛊搞笑",6, templateCardList);
							}
						}
						initHotBillBoard(templateCardList);
					}
				
			}
	}
	
	/**
	 * 
	* 方法用途和描述: 设置保存的对象
	* @param filePath  文件地址
	* @param fileName 文件名
	* @param type 模版明信片类型
	* @param templateCardList
	* @return
	* @throws IOException
	* @author chenliang 新增日期：2013-4-24
	* @since mms-cms
	 */
	private List<TbTemplateCard> setTemplateCard(String filePath,String fileName,int type,List<TbTemplateCard> templateCardList) throws IOException{
		File f = new File(filePath+"/data.xlsx");
		try {
			XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(f));
			if(workbook!=null){
				XSSFSheet  sheet = workbook.getSheetAt(0);
				for(int i=1;i<sheet.getLastRowNum();i++){
					XSSFRow row = sheet.getRow(i);
					String bigPic = row.getCell(0).toString();
					String smallPic =row.getCell(1).toString();
					String cardTitle = row.getCell(2).toString();
					String wishWord = row.getCell(3).toString();
					String layout =row.getCell(4).toString();
					File sImgBigFile = new File(filePath+File.separator+bigPic);
					File sImgSmallFile = new File(filePath+File.separator+smallPic);
					if(!sImgBigFile.exists() || !sImgSmallFile.exists()){
						continue;
					}
					
					String bigPath = new ClientSocket().sendFile(socketHost, socketport,sImgBigFile.getPath(),System.currentTimeMillis()+sImgBigFile.getName(),"null",FileType.TemplateCard);
					String smallPath = new ClientSocket().sendFile(socketHost, socketport,sImgSmallFile.getPath(),"small_"+System.currentTimeMillis()+sImgSmallFile.getName(),"null",FileType.TemplateCard);
					
					TbTemplateCard templateCard = new TbTemplateCard();
					templateCard.setCardTitle(cardTitle);
					templateCard.setPicUrl(bigPath);
					templateCard.setStatus(0);
					templateCard.setCollectNum(0);
					templateCard.setSmallPic(smallPath);
					if(layout.equals("横版")){//下方
						templateCard.setxPosText(16);
						templateCard.setyPosText(357);
						templateCard.setWidthText(528);
						templateCard.setHeightText(70);
					}else{//右边竖型
						templateCard.setxPosText(389);
						templateCard.setyPosText(90);
						templateCard.setWidthText(155);
						templateCard.setHeightText(322);
					}
					templateCard.setWishWord(wishWord);
					TbCardType cardType = new TbCardType();
					cardType.setId(type);
					templateCard.setCardType(cardType);
					templateCardDAO.save(templateCard);
					
					templateCardList.add(templateCard);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return templateCardList;
	}
	
	/**
	 * 
	* 方法用途和描述: 最新，最热推荐初始化
	* @param templateCardList
	* @author chenliang 新增日期：2013-5-11
	* @since mms-cms
	 */
	private void initHotBillBoard(List<TbTemplateCard> templateCardList){
		String hql="";
		int total;
		if(templateCardList!=null ){
			//初始化最热推荐
			if(templateCardList.size()>=10){
				hql = "select count(tc.id) from TbHotBillboard tc ";
				total = hotbillboardDAO.findTotalCount(hql, null);
				if(total<=0){
					TbHotBillboard hotbill = new TbHotBillboard();
					hotbill.setTop1(templateCardList.get(0));
					hotbill.setTop2(templateCardList.get(1));
					hotbill.setTop3(templateCardList.get(2));
					hotbill.setTop4(templateCardList.get(3));
					hotbill.setTop5(templateCardList.get(4));
					hotbill.setTop6(templateCardList.get(5));
					hotbill.setTop7(templateCardList.get(6));
					hotbill.setTop8(templateCardList.get(7));
					hotbill.setTop9(templateCardList.get(8));
					hotbill.setTop10(templateCardList.get(9));
					hotbillboardDAO.save(hotbill);
				}
			}
			//初始化最新推荐
			if(templateCardList.size()>=20){
				hql = "select count(tc.id) from TbNewBillboard tc ";
				total = newbillboardDAO.findTotalCount(hql, null);
				if(total<=0){
					TbNewBillboard newBill = new TbNewBillboard();
					newBill.setTop1(templateCardList.get(10));
					newBill.setTop2(templateCardList.get(11));
					newBill.setTop3(templateCardList.get(12));
					newBill.setTop4(templateCardList.get(13));
					newBill.setTop5(templateCardList.get(14));
					newBill.setTop6(templateCardList.get(15));
					newBill.setTop7(templateCardList.get(16));
					newBill.setTop8(templateCardList.get(17));
					newBill.setTop9(templateCardList.get(18));
					newBill.setTop10(templateCardList.get(19));
					newbillboardDAO.save(newBill);
				}
			}
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 初始化登陆用户表
	* @author chenliang 新增日期：2013-5-11
	 * @throws Exception 
	* @since mms-cms
	 */
	public void initUser() throws Exception{
		try {
			String hql = "select count(tb.id) from TbUsers tb";
			int totalCount = usersDAO.findTotalCount(hql);
			if(totalCount<=0){
				TbUsers users = new TbUsers();
				users.setMdn("15502021957");
				users.setPwd(MD5.toMD5("123"));
				users.setRegisterTime(new Date());
				users.setStatus(1);
				users.setUnregisterTime(new Date());
				usersDAO.save(users);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	/**
	 * 
	* 方法用途和描述: 初始化联系人和分组
	* @author chenliang 新增日期：2013-5-11
	 * @throws Exception 
	* @since mms-cms
	 */
	public void initGroupsContacts() throws Exception{
		try {
			//初始化联系人
			String hql = "select count(tb.id) from TbContacts tb";
			int totalCount = contactDAO.findTotalCount(hql);
			if(totalCount<=0){
				TbContacts contacts = new TbContacts();
				contacts.setBirthday(new Date());
				contacts.setEmail("xiaoli@XXX.com");
				contacts.setMdn("13890876545");
				contacts.setName("小丽");
				TbUsers users = new TbUsers();
				users.setId(1L);
				contacts.setUsers(users);
				contactDAO.save(contacts);
				
				contacts = new TbContacts();
				contacts.setBirthday(new Date());
				contacts.setEmail("xiaohua@XXX.com");
				contacts.setMdn("13890879999");
				contacts.setName("小华");
				users = new TbUsers();
				users.setId(1L);
				contacts.setUsers(users);
				contactDAO.save(contacts);
			}
			
			//初始化分组
			hql = "select count(tb.id) from TbGroups tb";
			totalCount = groupsDAO.findTotalCount(hql);
			if(totalCount<=0){
				TbGroups groups = new TbGroups();
				groups.setName("同事");
				TbUsers users = new TbUsers();
				users.setId(1L);
				groups.setUsers(users);
				groupsDAO.save(groups);
				
				groups = new TbGroups();
				groups.setName("常用");
				groups.setUsers(users);
				groupsDAO.save(groups);
				
				groups = new TbGroups();
				groups.setName("家人");
				groups.setUsers(users);
				groupsDAO.save(groups);
				
				groups = new TbGroups();
				groups.setName("同学");
				groups.setUsers(users);
				groupsDAO.save(groups);
				
				groups = new TbGroups();
				groups.setName("客户");
				groups.setUsers(users);
				groupsDAO.save(groups);
				
				groups = new TbGroups();
				groups.setName("其他");
				groups.setUsers(users);
				groupsDAO.save(groups);
			}
			
			//初始化联系人与分组的关系
			hql = "select count(tb.id) from TbGroupContacts tb";
			totalCount = groupContactsDAO.findTotalCount(hql);
			if(totalCount<=0){
				TbGroupContacts groupContacts = new TbGroupContacts();
				TbContacts contacts = new TbContacts();
				contacts.setId(1);
				groupContacts.setContacts(contacts);
				TbGroups groups = new TbGroups();
				groups.setId(1);
				groupContacts.setGroups(groups);
				groupContactsDAO.save(groupContacts);
				
				groupContacts = new TbGroupContacts();
				contacts = new TbContacts();
				contacts.setId(2);
				groupContacts.setContacts(contacts);
				groups = new TbGroups();
				groups.setId(1);
				groupContacts.setGroups(groups);
				groupContactsDAO.save(groupContacts);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	/**
	 * 
	* 方法用途和描述: 初始化背景图
	* @author chenliang 新增日期：2013-5-11
	* @since mms-cms
	 */
	public void initBgPic(){
		String hql = "select count(bm.id) from TbBgPic bm ";
		int total = bgPicDAO.findTotalCount(hql, null);
		if(total<=0){
			try {
				File pathfile = new File(bgPicPath);
				if(pathfile.isDirectory()){
					String[] wishFile = pathfile.list(); //遍历该目录下所有的文件夹
					List<TbBgPic> bgPicList = new ArrayList<TbBgPic>();
					String smallImgName = "";
					String bigPath = "";
					String smallPath = "";
					for (int i = 0; i < wishFile.length; i++) {
						//读取本地文件，调用图片服务器接口，上传图片。
						File imgFile = new File(bgPicPath+File.separator+wishFile[i]);
						if(imgFile.getName().startsWith("small")){
							break;
						}
						smallImgName = "small_"+imgFile.getName();
						Random random = new Random();
						bigPath = new ClientSocket().sendFile(socketHost, socketport,imgFile.getPath(),"bigBgpic-"+random.nextInt(1000000)+imgFile.getName(),"null",FileType.Background);
						
						smallPath = new ClientSocket().sendFile(socketHost, socketport,imgFile.getParent()+File.separator+smallImgName,"smallBgpic-"+random.nextInt(1000000)+smallImgName,"null",FileType.Background);
						
						TbBgPic bgpic = new TbBgPic();
						bgpic.setName(imgFile.getName());
						bgpic.setPicUrl(bigPath);
						bgpic.setSmallBgPic(smallPath);
						bgpic.setStatus(0);
						bgPicDAO.save(bgpic);
						
						bgPicList.add(bgpic);
					}
					System.out.println("bgPicList.size();"+bgPicList.size());

					//调用接口的保存方法
//					Mcp mcp = new McpServiceLocator().getMcpPort();
//					Gson gson = new Gson();
//					String jsonStr = gson.toJson(photoFrameList);
//					String responseStr = mcp.photoFrameManage(jsonStr, 1);
//					Response response = gson.fromJson(responseStr, new TypeToken<Response>(){}.getType());
				}
			
//			} catch (ServiceException e) {
//				e.printStackTrace();
			} catch (RemoteException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String args[]){
		InitDatabase aa = InitDatabase.getSingleInstance();
		try {
			aa.initPhotoFrame();
//			aa.initPhotoFrame();//初始化相框
//			aa.initPostMark(); //初始化邮戳
//			aa.initStamp(); //初始化邮票
//			aa.initDecoration(); //初始化饰品
//			aa.initTemplateCard(); //初始化模板明信片
//		    aa.initBgMusic();  //初始化背景音乐
		    aa.initBgPic();  //初始化北京图片
//		    aa.initUser(); //初始化登陆用户
//		    aa.initGroupsContacts();//初始化分组联系人
//			aa.writeData();
			
			//		String path = System.getProperty("user.dir");
//		System.out.println("path:"+path);
		
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		String brithdayWishPath = "D:/caixin/模板明信片"; //生日祝福 Brithday-w
//		File pathfile = new File(brithdayWishPath);
//		if(pathfile.isDirectory()){
//			String[] wishFile = pathfile.list();
//			for (int i = 0; i < wishFile.length; i++) {  //循环“模板明信片”目录下的文件
//				File file = new File(brithdayWishPath+File.separator+wishFile[i]);
//				if("节日祝福".equals(file.getName())){
//					File endfile = new File(file.getPath());
//					String[] typeString = endfile.list();
//					for (int j = 0; j < typeString.length; j++) {//循环“类型”目录下的文件夹，例如“节日祝福”
//						File typeFile = new File(file.getPath()+File.separator+typeString[j]);
//						String[] imgStrings = typeFile.list();
//						for (int k = 0; k < imgStrings.length; k++) { 
//							File imgFile = new File(typeFile.getPath()+File.separator+imgStrings[k]);
//							System.out.println("@@@@@@@@@@"+imgFile.getName());
//						}
//					}
//				}
//			}
//		}
	}
}
