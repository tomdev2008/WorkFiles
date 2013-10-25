package jeecg.test.controller.orders;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.contants.UserLevelContants;
import jeecg.system.pojo.base.TSUser;
import jeecg.system.service.SystemService;
import jeecg.test.entity.orders.TbAgentsEntity;
import jeecg.test.entity.orders.TbChannelEntity;
import jeecg.test.entity.orders.TbDestinationCountryEntity;
import jeecg.test.entity.orders.TbOrdersEntity;
import jeecg.test.entity.orders.TbRemarkEntity;
import jeecg.test.service.orders.TbOrdersServiceI;
import jeecg.test.vo.AgentVo;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**   
 * @Title: Controller
 * @Description: 订单
 * @author zhangdaihao
 * @date 2013-05-29 14:58:16
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbOrdersController")
public class TbOrdersController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbOrdersController.class);

	@Autowired
	private TbOrdersServiceI tbOrdersService;
	@Autowired
	private SystemService systemService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 订单列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbOrders")
	public ModelAndView tbOrders(HttpServletRequest request) {
		return new ModelAndView("jeecg/test/orders/tbOrdersList");
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 * @throws ParseException 
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(TbOrdersEntity tbOrders,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) throws ParseException {
		String queryParam = request.getParameter("orderNumber"); //前台传入的参数条件
//		System.out.println("queryParam:"+queryParam);
		
		//查询条件组装器
		HqlQuery hqlQuery = new HqlQuery("tbOrdersController.do?datagrid");
		hqlQuery.setCurPage(dataGrid.getPage());
		hqlQuery.setPageSize(dataGrid.getRows());
		hqlQuery.setDataGrid(dataGrid);
		TSUser user= ResourceUtil.getSessionUserName();
		user = systemService.getEntity(TSUser.class, user.getId());
		
		PageList pagelist = this.tbOrdersService.getPageList(hqlQuery, true,queryParam,user.getId(),user);
		dataGrid.setPage(pagelist.getCurPageNO());
		dataGrid.setTotal(pagelist.getCount());
		dataGrid.setReaults(pagelist.getResultList());
		TagUtil.datagrid(response, dataGrid);
	}
	
	@RequestMapping(params = "allList")
	@ResponseBody
	public AjaxJson allList(String userId,String key,Integer page,Integer rows, HttpServletRequest req) {
		AjaxJson j = new AjaxJson();
		if(userId==null){
			j.setMsg("error");
			return j;
		}
		DataGrid dataGrid = new DataGrid();
		if(page==null){
			page=0;
		}
		if(rows==null){
			rows=1000;
		}
		dataGrid.setPage(page);
		dataGrid.setRows(rows);
		HqlQuery hqlQuery = new HqlQuery("tbOrdersController.do?datagrid");
		hqlQuery.setCurPage(dataGrid.getPage());
		hqlQuery.setPageSize(dataGrid.getRows());
		hqlQuery.setDataGrid(dataGrid);
		TSUser user= ResourceUtil.getSessionUserName();
		user = systemService.getEntity(TSUser.class, user.getId());
		
		PageList pagelist = this.tbOrdersService.getPageList(hqlQuery, false,key,userId,user);
		dataGrid.setPage(pagelist.getCurPageNO());
		dataGrid.setTotal(pagelist.getCount());
		dataGrid.setReaults(pagelist.getResultList());
		j.setMsg("ok");
		j.setObj(dataGrid);
		return j;
	}
	
	/**
	 * 删除订单
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbOrdersEntity tbOrders, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		//根据订单id与当前登陆用户id删除备注表（用户与订单关联表）的值
		tbOrdersService.deleteRemarkEntity(tbOrders.getId());
		//根据订单id删除订单详情
		tbOrdersService.deleteTrackingEntity(tbOrders.getId());
		//根据订单id删除订单表数据
		tbOrders = systemService.getEntity(TbOrdersEntity.class, tbOrders.getId());
		message = "删除成功";
		tbOrdersService.delete(tbOrders);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加订单
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbOrdersEntity tbOrders,String remark, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		//判断输入的订单编号是否存在
			if (StringUtil.isNotEmpty(tbOrders.getId())) {
				message = "更新成功";
				TbOrdersEntity t = tbOrdersService.get(TbOrdersEntity.class, tbOrders.getId());
				try {
					//修改订单
					t = this.copyBeanNotNull2Bean(tbOrders, t);
					//修改订单
					tbOrdersService.saveOrUpdate(t);
					//修改备注
					tbOrdersService.updateRemarkEntity(tbOrders,remark);
					systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				//根据订单号查询是否已经存在，如果不存在，则添加订单，已存在，则添加订单与用户的关系（及添加备注）
				TbOrdersEntity entity = tbOrdersService.flatUniqueOrders(tbOrders.getOrderNumber());
				if(null==entity){
					message = "添加成功";
					//根据代理商判断该代理商是否存在，不存在就添加
					TbAgentsEntity agentsEntity = tbOrdersService.agentsExists(tbOrders.getAgentsId().getName());
					//根据目的国查找是否存在，不存在就添加
					TbDestinationCountryEntity contryEntity = tbOrdersService.contryEntityExists(tbOrders.getCountryId().getDestinationCountry());
					//添加订单
					tbOrders.setStatus(1);
					tbOrders.setCreateTime(new Date());
					tbOrders.setAgentsId(agentsEntity);
					tbOrders.setCountryId(contryEntity);
					tbOrdersService.save(tbOrders);
					//添加备注
					tbOrdersService.saveEntity(tbOrders,remark);
					//systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
				}else{
					message = "订单编号已经存在,备注保存成功";
					tbOrdersService.saveEntity(entity,remark);
				}
				systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
			}
		j.setMsg(message);
		return j;
	}

	/**
	 * 订单列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbOrdersEntity tbOrders, HttpServletRequest req) {
		List<TbAgentsEntity> agentsList = systemService.getList(TbAgentsEntity.class);
		req.setAttribute("agentsList", agentsList);
		List<TbChannelEntity> channelList = systemService.getList(TbChannelEntity.class);
		req.setAttribute("channelList", channelList);
		List<TbDestinationCountryEntity> countryList = systemService.getList(TbDestinationCountryEntity.class);
		req.setAttribute("countryList", countryList);
		TSUser user= ResourceUtil.getSessionUserName();
		user = systemService.getEntity(TSUser.class, user.getId());
		
		//根据登陆用户查询是否为货代用户
		if(UserLevelContants.Forwarder.equals(user.getUserLevel().getId())){ //是货代用户则默认代理商
			req.setAttribute("agents", user.getAgents());
		}
		if (StringUtil.isNotEmpty(tbOrders.getId())) {
			tbOrders = tbOrdersService.getEntity(TbOrdersEntity.class, tbOrders.getId());
			req.setAttribute("tbOrdersPage", tbOrders);
			//获取备注
			TbRemarkEntity entity = tbOrdersService.getRemarkEntity(tbOrders.getId());
			req.setAttribute("remark", entity);
		}
		req.setAttribute("statusList", initStatus());
		req.setAttribute("importantList", initImportantList());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowDate = sdf.format(new Date());
		req.setAttribute("nowDate", nowDate);
		return new ModelAndView("jeecg/test/orders/tbOrders");
	}
	
	/**
	 * 
	* 方法用途和描述: 把TbOrders对象的值赋值到t中
	* @param tbOrders 原值对象 
	* @param t 赋值对象
	* @return
	* @author chenliang 新增日期：2013-6-8
	* @since wuliu
	 */
	private TbOrdersEntity copyBeanNotNull2Bean(TbOrdersEntity tbOrders,TbOrdersEntity t){
		if(t==null){
			t = new TbOrdersEntity();
		}
		TbChannelEntity channelId = new TbChannelEntity();
		channelId.setId(tbOrders.getChannelId().getId());
		t.setChannelId(channelId); //设置渠道
//		TbDestinationCountryEntity countryId = new TbDestinationCountryEntity();
//		countryId.setId(tbOrders.getCountryId().getId());
//		t.setCountryId(countryId); //设置目的国
		t.setOrderNumber(tbOrders.getOrderNumber()); //订单号
		t.setImportant(tbOrders.getImportant()); //重要
		//根据代理商判断该代理商是否存在，不存在就添加
		TbAgentsEntity agentsEntity = tbOrdersService.agentsExists(tbOrders.getAgentsId().getName());
		t.setAgentsId(agentsEntity);
		//根据目的国查找是否存在，不存在就添加
		TbDestinationCountryEntity contryEntity = tbOrdersService.contryEntityExists(tbOrders.getCountryId().getDestinationCountry());
		t.setCountryId(contryEntity);
		return t;
	}
	
	/**
	 * 
	* 方法用途和描述: 初始化状态
	* @return
	* @author chenliang 新增日期：2013-5-29
	* @since wuliu
	 */
	private List<AgentVo> initStatus(){
		List<AgentVo> agentsList = new ArrayList<AgentVo>();
		AgentVo vo = new AgentVo();
		vo.setId("1");
		vo.setName("转运");
		agentsList.add(vo);
		
		vo = new AgentVo();
		vo.setId("2");
		vo.setName("异常");
		agentsList.add(vo);
		
		vo = new AgentVo();
		vo.setId("3");
		vo.setName("签收");
		agentsList.add(vo);
		
		return agentsList;
	}

	/**
	 * 
	* 方法用途和描述: 初始化重要性
	* @return
	* @author chenliang 新增日期：2013-5-29
	* @since wuliu
	 */
	private List<AgentVo> initImportantList(){
		List<AgentVo> agentsList = new ArrayList<AgentVo>();
		AgentVo vo = new AgentVo();
		vo.setId("3");
		vo.setName("一般");
		agentsList.add(vo);
		
		vo = new AgentVo();
		vo.setId("2");
		vo.setName("其次");
		agentsList.add(vo);
		
		vo = new AgentVo();
		vo.setId("1");
		vo.setName("重要");
		agentsList.add(vo);
		
		return agentsList;
	}
	
}
