package jeecg.kxcomm.controller.contactm;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import jeecg.system.pojo.base.TSDepart;
import jeecg.system.pojo.base.TSUser;
import jeecg.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.contactm.TbCustomerEntityEntity;
import jeecg.kxcomm.entity.contactm.TbInvoiceEntity;
import jeecg.kxcomm.service.contactm.TbInvoiceServiceI;

/**   
 * @Title: Controller
 * @Description: 销售发票管理
 * @author zhangdaihao
 * @date 2013-10-26 13:05:48
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbInvoiceController")
public class TbInvoiceController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbInvoiceController.class);

	@Autowired
	private TbInvoiceServiceI tbInvoiceService;
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
	 * 销售发票管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbInvoice")
	public ModelAndView tbInvoice(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbInvoiceList");
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
	public void datagrid(TbInvoiceEntity tbInvoice,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbInvoiceEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbInvoice);
		this.tbInvoiceService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除销售发票管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbInvoiceEntity tbInvoice, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbInvoice = systemService.getEntity(TbInvoiceEntity.class, tbInvoice.getId());
		message = "删除成功";
		tbInvoiceService.delete(tbInvoice);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加销售发票管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbInvoiceEntity tbInvoice, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbInvoice.getId())) {
			message = "更新成功";
			TbInvoiceEntity t = tbInvoiceService.get(TbInvoiceEntity.class, tbInvoice.getId());
			TSUser tsUser = ResourceUtil.getSessionUserName();
			tbInvoice.setCreatorId(tsUser);
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbInvoice, t);
				tbInvoiceService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			TSUser tsUser = ResourceUtil.getSessionUserName();
			tbInvoice.setCreatorId(tsUser);
			tbInvoice.setStatus("2");
			this.tbInvoiceService.save(tbInvoice);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 销售发票管理列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbInvoiceEntity tbInvoice, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbInvoice.getId())) {
			tbInvoice = this.tbInvoiceService.getEntity(TbInvoiceEntity.class, tbInvoice.getId());
			req.setAttribute("tbInvoicePage", tbInvoice);
		}
		List<TbCustomerEntityEntity> customerList = this.tbInvoiceService.getList(TbCustomerEntityEntity.class);
		List<TbContractEntity> contractList = this.tbInvoiceService.getList(TbContractEntity.class);
		req.setAttribute("customerList",customerList);
		req.setAttribute("contractList",contractList);
		return new ModelAndView("jeecg/kxcomm/contactm/tbInvoice");
	}
	
	/**
	 * 添加销售发票管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "queryContractInfoById")
	@ResponseBody
	public AjaxJson queryContractInfoById(TbInvoiceEntity tbInvoice, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String endid = request.getParameter("codsid");
		if (StringUtil.isNotEmpty(endid)) {
			TbContractEntity t = this.tbInvoiceService.get(TbContractEntity.class, endid);
			request.setAttribute("contract",t);
		}
		return j;
	}
}
