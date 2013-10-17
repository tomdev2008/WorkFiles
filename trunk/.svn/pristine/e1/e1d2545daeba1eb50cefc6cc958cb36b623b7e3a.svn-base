package jeecg.kxcomm.controller.contactm;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.contactm.TbOrderDetailEntity;
import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.page.contactm.TbOrderPage;
import jeecg.kxcomm.service.contactm.TbContractServiceI;
import jeecg.kxcomm.service.contactm.TbOrderServiceI;
import jeecg.system.service.SystemService;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
/**   
 * @Title: Controller
 * @Description: 销售订单
 * @author zhangdaihao
 * @date 2013-09-22 10:50:44
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbOrderController")
public class TbOrderController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbOrderController.class);

	@Autowired
	private TbOrderServiceI tbOrderService;
	@Autowired
	private SystemService systemService;
	private String message;
	
	@Autowired
	private TbContractServiceI tbContractService;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 销售订单列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbOrder")
	public ModelAndView tbOrder(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbOrderList");
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
	public void datagrid(TbOrderEntity tbOrder,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbOrderEntity.class, dataGrid);
		
//		//查询条件组装器
//		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbOrder);
//		this.tbOrderService.getDataGridReturn(cq, true);
//		TagUtil.datagrid(response, dataGrid);
		
		String kxOrderNo = request.getParameter("kxOrderNo");
		String projectName = request.getParameter("projectName");
		String contractNo = request.getParameter("tbContract_contractNo");
		String client = request.getParameter("client");
		String principal = request.getParameter("principal");
		String status = request.getParameter("status");
		
		HqlQuery hqlQuery = new HqlQuery("TbOrderEntity.do?datagrid");
		hqlQuery.setCurPage(dataGrid.getPage());
		hqlQuery.setPageSize(dataGrid.getRows());
		hqlQuery.setDataGrid(dataGrid);
		PageList pagelist = this.tbOrderService.getPageList(hqlQuery, true,tbOrder,kxOrderNo,projectName,contractNo,client,principal,status);
//		for(int d = 0; d < pagelist.getResultList().size(); d++) {
//			((TbCheckingInstanceEntity) pagelist.getResultList().get(d)).setEmpName(ctBegin+","+ctEnd);
//		}
		dataGrid.setPage(pagelist.getCurPageNO());
		dataGrid.setTotal(pagelist.getCount());
		dataGrid.setReaults(pagelist.getResultList());
		TagUtil.datagrid(response, dataGrid);
	}
	
	
	/**
	 * 删除销售订单
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbOrderEntity tbOrder, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbOrder = systemService.getEntity(TbOrderEntity.class, tbOrder.getId());
		message = "删除成功";
		tbOrderService.delMain(tbOrder);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加销售订单
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbOrderEntity tbOrder,TbOrderPage tbOrderPage, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		//判断销售订单是否唯一
		
		//修改合同编号
		List<TbOrderDetailEntity> tbOrderDetailList =  tbOrderPage.getTbOrderDetailList();
		if(!tbOrder.getContractNo().equals("null")){
//			String contractNo = request.getParameter("cno");
			String hql0 = "from TbContractEntity where 1 = 1 AND contractNo = ? ";
		    List<TbContractEntity> tbContractList = systemService.findHql(hql0,tbOrder.getContractNo());
		    if(tbContractList.size()>0){
				tbOrder.setTbContract(tbContractList.get(0));
			}
		}else{
			tbOrder.setTbContract(null);
			tbOrder.setContractNo(null);
		}
		
		if (StringUtil.isNotEmpty(tbOrder.getId())) {
			message = "更新成功";
			tbOrderService.updateMain(tbOrder, tbOrderDetailList);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} else {
//			String hqlOrder = "from TbOrderEntity where 1 = 1 AND kxOrderNo = ? ";
//		    List<TbOrderEntity> tbOrderList = systemService.findHql(hqlOrder,tbOrder.getKxOrderNo());
//		    if(tbOrderList.size()>0){
//				j.setMsg("操作失败:销售订单编号重复!");
//				return j;
//			}
		    message = "添加成功";
			tbOrderService.addMain(tbOrder, tbOrderDetailList);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 销售订单列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbOrderEntity tbOrder, HttpServletRequest req) {
		List<TbContractEntity> contractList = tbContractService.getList(TbContractEntity.class);
		req.setAttribute("contractList", contractList);
		if (StringUtil.isNotEmpty(tbOrder.getId())) {
			tbOrder = tbOrderService.getEntity(TbOrderEntity.class, tbOrder.getId());
			req.setAttribute("tbOrderPage", tbOrder);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbOrder");
	}
	
	
	/**
	 * 加载明细列表[产品明细]
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbOrderDetailList")
	public ModelAndView tbOrderDetailList(TbOrderEntity tbOrder, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id0 = tbOrder.getId();
		//===================================================================================
		//删除-产品明细
	    String hql0 = "from TbOrderDetailEntity where 1 = 1 AND tbOrder = ? ";
	    List<TbOrderDetailEntity> tbOrderDetailEntityList = systemService.findHql(hql0,tbOrder);
		req.setAttribute("tbOrderDetailList", tbOrderDetailEntityList);
		return new ModelAndView("jeecg/kxcomm/contactm/tbOrderDetailList");
	}
	
	/**
	 * 明细列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "orderDetail")
	public ModelAndView orderDetail(HttpServletRequest req,String id) {
		String hql = "from TbOrderEntity where 1 = 1 AND id = ? ";
		List<TbOrderEntity> tbOrderEntityList = systemService.findHql(hql,id);
		String hql0 = "from TbOrderDetailEntity where 1 = 1 AND tbOrder.id = ? ";
		List<TbOrderDetailEntity> tbOrderDetailEntityList = systemService.findHql(hql0,tbOrderEntityList.get(0).getId());
		req.setAttribute("tbOrderDetailList", tbOrderDetailEntityList);
		
		return new ModelAndView("jeecg/kxcomm/contactm/tbOrderDetail");
	} 
	
	@RequestMapping(params = "getOrderByKxOrderNo")
	@ResponseBody
	public List getOrderByKxOrderNo(HttpServletRequest request) {
		
		String kxOrderNo = request.getParameter("kxOrderNo");
		String hql = "from TbOrderEntity where 1 = 1 AND kxOrderNo = ? ";
		List<TbOrderEntity> tbOrderEntityList = systemService.findHql(hql,kxOrderNo);
		
		return tbOrderEntityList;
	}
	
}
