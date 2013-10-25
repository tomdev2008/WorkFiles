package jeecg.test.controller.orders;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.system.service.SystemService;
import jeecg.test.entity.orders.TbOrderTrackingEntity;
import jeecg.test.entity.orders.TbOrdersEntity;
import jeecg.test.service.orders.TbOrderTrackingServiceI;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**   
 * @Title: Controller
 * @Description: 订单跟踪信息
 * @author zhangdaihao
 * @date 2013-06-02 17:18:11
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbOrderTrackingController")
public class TbOrderTrackingController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbOrderTrackingController.class);

	@Autowired
	private TbOrderTrackingServiceI tbOrderTrackingService;
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
	 * 订单跟踪信息列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbOrderTracking")
	public ModelAndView tbOrderTracking(HttpServletRequest request) {
		return new ModelAndView("jeecg/test/orders/tbOrderTrackingList");
	}
	
	@RequestMapping(params = "tbOrderTrackingWindow")
	public ModelAndView tbOrderTrackingWindow(TbOrdersEntity tbOrders,HttpServletRequest request) {
		//System.out.println("tbOrders.getId():"+tbOrders.getId());
		HashMap<String , String> map = new HashMap<String, String>();
		map.put("orderId", tbOrders.getId());
		return new ModelAndView("jeecg/test/orders/tbOrderTrackingListWindow","windowMap",map);
	}
	
	@RequestMapping(params = "track")
	public ModelAndView track(TbOrderTrackingEntity tbOrderTracking, HttpServletRequest req, HttpServletResponse response, DataGrid dataGrid) {
		if (StringUtil.isNotEmpty(tbOrderTracking)) {
		
		}
		return new ModelAndView("jeecg/test/orders/tbOrderTrackingListWindow");
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(TbOrderTrackingEntity tbOrderTracking,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbOrderTrackingEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbOrderTracking);
		//System.out.println("tbOrderTrackIng:"+tbOrderTracking.getId());
		if(null!=tbOrderTracking.getOrderId() && !"".equals(tbOrderTracking.getOrderId()) && null!=tbOrderTracking.getOrderId().getId()){
			cq.createAlias("orderId", "tbOrders");
			cq.eq("orderId.id", tbOrderTracking.getOrderId().getId());
			cq.add();
		}
		this.tbOrderTrackingService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	@RequestMapping(params = "queryTrack")
	@ResponseBody
	public AjaxJson queryTrack(String orderNumber, HttpServletRequest req) {
		AjaxJson j = new AjaxJson();
		if(orderNumber==null){
			j.setMsg("error");
			return j;
		}
		List<TbOrderTrackingEntity> pagelist =tbOrderTrackingService.findByQueryString("select u from TbOrderTrackingEntity u where u.orderId.orderNumber ="+orderNumber);
		j.setMsg("ok");
		j.setObj(pagelist);
		return j;
	}

	/**
	 * 删除订单跟踪信息
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbOrderTrackingEntity tbOrderTracking, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbOrderTracking = systemService.getEntity(TbOrderTrackingEntity.class, tbOrderTracking.getId());
		message = "删除成功";
		tbOrderTrackingService.delete(tbOrderTracking);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加订单跟踪信息
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbOrderTrackingEntity tbOrderTracking, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbOrderTracking.getId())) {
			message = "更新成功";
			TbOrderTrackingEntity t = tbOrderTrackingService.get(TbOrderTrackingEntity.class, tbOrderTracking.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbOrderTracking, t);
				tbOrderTrackingService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbOrderTrackingService.save(tbOrderTracking);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 订单跟踪信息列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbOrderTrackingEntity tbOrderTracking, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbOrderTracking.getId())) {
			tbOrderTracking = tbOrderTrackingService.getEntity(TbOrderTrackingEntity.class, tbOrderTracking.getId());
			req.setAttribute("tbOrderTrackingPage", tbOrderTracking);
		}
		return new ModelAndView("jeecg/test/orders/tbOrderTracking");
	}
}
