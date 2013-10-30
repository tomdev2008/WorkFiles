package cn.com.kxcomm.selfservice.action.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.com.kxcomm.common.AppConfig;
import cn.com.kxcomm.common.MD5;
import cn.com.kxcomm.selfservice.dao.CmsUserDAO;
import cn.com.kxcomm.selfservice.dao.RightDAO;
import cn.com.kxcomm.selfservice.dao.RightRoleDAO;
import cn.com.kxcomm.selfservice.dao.RoleDAO;
import cn.com.kxcomm.selfservice.entity.TbCmsUser;
import cn.com.kxcomm.selfservice.entity.TbRight;
import cn.com.kxcomm.selfservice.entity.TbRightRole;
import cn.com.kxcomm.selfservice.entity.TbRightRoleId;
import cn.com.kxcomm.selfservice.entity.TbRole;

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
	private CmsUserDAO cmsUserDAO;
	private static RightRoleDAO rightRoleDAO;  
	
	private static InitDatabase instance = null;
	private static final Logger log = Logger.getLogger(InitDatabase.class);
	private static final String path = System.getProperty("user.dir"); //项目存放本地路径
	
//	private static final String socketHost = AppConfig.getInstance().getString("socketHost");  //socket地址
//	private static final Integer socketport = AppConfig.getInstance().getInt("socketport");;   //socket端口
//	
//	private static final String basePath =AppConfig.getInstance().getString("initImagesPath");
	
	public InitDatabase() {
		ctx = new ClassPathXmlApplicationContext("modules/applicationContext.xml");
		if (ctx != null)
			System.out.println("success spring");
		rightDAO = (RightDAO) ctx.getBean("rightDAO");
		roleDAO = (RoleDAO) ctx.getBean("roleDAO");
		cmsUserDAO = (CmsUserDAO) ctx.getBean("cmsUserDAO");
		rightRoleDAO = (RightRoleDAO) ctx.getBean("rightRoleDAO");
		
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
			//=======================1、订单管理======================
			TbRight tbRight = new TbRight();
			tbRight.setId(1);
			tbRight.setRightName("订单管理");
			tbRight.setRightLevel(1);
			rightDAO.save(tbRight);
			//=======================2、客户管理======================
			tbRight = new TbRight();
			tbRight.setId(2);
			tbRight.setRightName("客户管理");
			tbRight.setRightLevel(1);
			rightDAO.save(tbRight);
			//=======================3、服务与产品管理======================
			tbRight = new TbRight();
			tbRight.setId(3);
			tbRight.setRightName("服务与产品管理");
			tbRight.setRightLevel(1);
			rightDAO.save(tbRight);
			//=======================4、库管理======================
			tbRight = new TbRight();
			tbRight.setId(4);
			tbRight.setRightName("库管理");
			tbRight.setRightLevel(1);
			rightDAO.save(tbRight);
			//=======================5、系统管理======================
			tbRight = new TbRight();
			tbRight.setId(5);
			tbRight.setRightName("系统管理");
			tbRight.setRightLevel(1);
			rightDAO.save(tbRight);
			
			//**********************第二级菜单*********************
			//========1、订单管理========
			//+++++++++++++++++++++++++++++++++
			//        1.1、订单
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(11);
			tbRight.setRightName("订单阅览");
			tbRight.setParid(1);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/order/order.jsp");
			rightDAO.save(tbRight);
			
			//========2、客户信息========
			//+++++++++++++++++++++++++++++++++
			//        2.1、客户阅览
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(21);
			tbRight.setRightName("客户阅览");
			tbRight.setParid(2);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/customer/customer.jsp");
			rightDAO.save(tbRight);
			
			//========3、服务与产品管理========
			//+++++++++++++++++++++++++++++++++
			//        3.1、配置管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(31);
			tbRight.setRightName("配置管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/config/config.jsp");
			rightDAO.save(tbRight);
			//+++++++++++++++++++++++++++++++++
			//        3.2、控制台管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(32);
			tbRight.setRightName("控制台管理");
			tbRight.setParid(3);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/console/console.jsp");
			rightDAO.save(tbRight);
			
			
			//========4、库========
			//+++++++++++++++++++++++++++++++++
			//        4.1、ISO镜像管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(41);
			tbRight.setRightName("系统管");
			tbRight.setParid(4);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/iso/iso.jsp");
			rightDAO.save(tbRight);
			//+++++++++++++++++++++++++++++++++
			//        4.2、虚拟机与用户的关系
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(42);
			tbRight.setRightName("虚拟机与用户的关系");
			tbRight.setParid(4);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/vmUserInfo/vmUserInfo.jsp");
			rightDAO.save(tbRight);
			
			//+++++++++++++++++++++++++++++++++
			//        4.3、虚拟网络交换机
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(43);
			tbRight.setRightName("虚拟网络交换机管理");
			tbRight.setParid(4);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/vmNetWork/vmNetWork.jsp");
			rightDAO.save(tbRight);
			
			//+++++++++++++++++++++++++++++++++
			//        4.4、VHD磁盘
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(44);
			tbRight.setRightName("VHD磁盘管理");
			tbRight.setParid(4);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/vmVHD/vmVHD.jsp");
			rightDAO.save(tbRight);
			
			//========5、系统管理========
			//+++++++++++++++++++++++++++++++++
			//        5.1、用户管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(51);
			tbRight.setRightName("用户管理");
			tbRight.setParid(5);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/user/user.jsp");
			rightDAO.save(tbRight);
			
			//+++++++++++++++++++++++++++++++++
			//        5.2、角色管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(52);
			tbRight.setRightName("角色管理");
			tbRight.setParid(5);
			tbRight.setRightLevel(2);
			tbRight.setUrl("/jsp/role/role.jsp");
			rightDAO.save(tbRight);
			
			//**********************第三级菜单*********************
			//+++++++++++++++++++++++++++++++++
			//        1.1.1、用户管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(511);
			tbRight.setRightName("用户action");
			tbRight.setParid(11);
			tbRight.setRightLevel(3);
			tbRight.setUrl("/user/user/user");
			rightDAO.save(tbRight);
			//---------------------------------//
			tbRight = new TbRight();
			tbRight.setId(512);
			tbRight.setRightName("用户action");
			tbRight.setParid(11);
			tbRight.setRightLevel(3);
			tbRight.setUrl("/role/role/role");
			rightDAO.save(tbRight);
			//+++++++++++++++++++++++++++++++++
			//        1.1.2、角色管理
			//+++++++++++++++++++++++++++++++++
			tbRight = new TbRight();
			tbRight.setId(521);
			tbRight.setRightName("角色action");
			tbRight.setParid(12);
			tbRight.setRightLevel(3);
			tbRight.setUrl("/role/role/role");
			rightDAO.save(tbRight);
			//---------------------------------//
			tbRight = new TbRight();
			tbRight.setId(522);
			tbRight.setRightName("用户action");
			tbRight.setParid(12);
			tbRight.setRightLevel(3);
			tbRight.setUrl("/right/right/right");
			rightDAO.save(tbRight);
			
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
		total = cmsUserDAO.findTotalCount(hql, null);
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
			cmsUserDAO.save(tbuser);
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
			tbRightRoleId.setRightId(43l);
			tbRightRoleId.setRoleId(1l);
			tbRightRole = new TbRightRole();
			tbRightRole.setId(tbRightRoleId);
			rightRoleDAO.save(tbRightRole);	
			//--------------------------------------------------------//
			tbRightRoleId=new TbRightRoleId();
			tbRightRoleId.setRightId(44l);
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
	

	public static void main(String args[]){
		InitDatabase aa = InitDatabase.getSingleInstance();
		try {
			aa.writeData();
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
