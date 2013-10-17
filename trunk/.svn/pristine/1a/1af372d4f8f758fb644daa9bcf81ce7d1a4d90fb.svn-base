package jeecg.kxcomm.controller.contactm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.kxcomm.entity.contactm.TbOrderDetailEntity;
import jeecg.kxcomm.service.contactm.TbOrderDetailServiceI;
import jeecg.system.service.SystemService;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
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
 * @Description: 销售订单明细
 * @author zhangdaihao
 * @date 2013-09-24 16:49:35
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbOrderDetailController")
public class TbOrderDetailController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbOrderDetailController.class);

	@Autowired
	private TbOrderDetailServiceI tbOrderDetailService;
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
	 * 销售订单明细列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbOrderDetail")
	public ModelAndView tbOrderDetailCopy(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbOrderDetailCopyList");
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
	public void datagrid(TbOrderDetailEntity tbOrderDetail,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbOrderDetailEntity.class, dataGrid);
		//查询条件组装器
		String kxOrderNo = request.getParameter("kxOrderNo");
		String projectName = request.getParameter("projectName");
		String client = request.getParameter("client");
		String finalClient = request.getParameter("finalClient");
		String principal = request.getParameter("principal");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String supplier = request.getParameter("supplier");
		String saleContractNo = request.getParameter("saleContractNo");
		String purchaser = request.getParameter("purchaser");
		
//		
//		cq.createAlias("tbOrder", "tbOrder");
//		cq.isNotNull("tbOrder.kxOrderNo");	
//		cq.eq("tbOrder.kxOrderNo", kxOrderNo);
//		cq.add();
//			
//		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbOrderDetail);
//		this.tbOrderDetailService.getDataGridReturn(cq, true);
//		TagUtil.datagrid(response, dataGrid);
		
		HqlQuery hqlQuery = new HqlQuery("TbOrderDetailEntity.do?datagrid");
		hqlQuery.setCurPage(dataGrid.getPage());
		hqlQuery.setPageSize(dataGrid.getRows());
		hqlQuery.setDataGrid(dataGrid);
		PageList pagelist = this.tbOrderDetailService.getPageList(hqlQuery, true,tbOrderDetail,kxOrderNo, projectName , client , finalClient , principal , name, type , supplier , saleContractNo , purchaser  );

		dataGrid.setPage(pagelist.getCurPageNO());
		dataGrid.setTotal(pagelist.getCount());
		dataGrid.setReaults(pagelist.getResultList());
		TagUtil.datagrid(response, dataGrid);
	}
	
	

	/**
	 * 删除销售订单明细
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbOrderDetailEntity tbOrderDetail, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbOrderDetail = systemService.getEntity(TbOrderDetailEntity.class, tbOrderDetail.getId());
		message = "删除成功";
		tbOrderDetailService.delete(tbOrderDetail);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加销售订单明细
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbOrderDetailEntity tbOrderDetail, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbOrderDetail.getId())) {
			message = "更新成功";
			TbOrderDetailEntity t = tbOrderDetailService.get(TbOrderDetailEntity.class, tbOrderDetail.getId());
			try {
				t.setStatus(tbOrderDetail.getStatus());
//				MyBeanUtils.copyBeanNotNull2Bean(tbOrderDetail, t);
				tbOrderDetailService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbOrderDetailService.save(tbOrderDetail);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 销售订单明细列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbOrderDetailEntity tbOrderDetail, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbOrderDetail.getId())) {
			tbOrderDetail = tbOrderDetailService.getEntity(TbOrderDetailEntity.class, tbOrderDetail.getId());
			req.setAttribute("tbOrderDetailCopyPage", tbOrderDetail);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbOrderDetailCopy");
	}
}
