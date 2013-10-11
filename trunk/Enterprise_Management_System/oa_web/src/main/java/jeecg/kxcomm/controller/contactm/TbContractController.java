package jeecg.kxcomm.controller.contactm;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import jeecg.system.pojo.base.TSDepart;
import jeecg.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.contactm.TbOrderDetailEntity;
import jeecg.kxcomm.page.contactm.TbContractPage;
import jeecg.kxcomm.service.contactm.TbContractServiceI;
import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.entity.hrm.TbCheckingInstanceEntity;
/**   
 * @Title: Controller
 * @Description: 销售合同
 * @author zhangdaihao
 * @date 2013-09-27 17:00:23
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContractController")
public class TbContractController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractController.class);

	@Autowired
	private TbContractServiceI tbContractService;
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
	 * 销售合同列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContract")
	public ModelAndView tbContract(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbContractList");
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
	public void datagrid(TbContractEntity tbContract,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbContractEntity.class, dataGrid);
		
//		//查询条件组装器
//		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContract);
//		this.tbContractService.getDataGridReturn(cq, true);
//		TagUtil.datagrid(response, dataGrid);
		
		
		
		String contractNo = request.getParameter("contractNo");
		
		HqlQuery hqlQuery = new HqlQuery("TbContractEntity.do?datagrid");
		hqlQuery.setCurPage(dataGrid.getPage());
		hqlQuery.setPageSize(dataGrid.getRows());
		hqlQuery.setDataGrid(dataGrid);
		PageList pagelist = this.tbContractService.getPageList(hqlQuery, true,tbContract,contractNo);
//		for(int d = 0; d < pagelist.getResultList().size(); d++) {
//			((TbCheckingInstanceEntity) pagelist.getResultList().get(d)).setEmpName(ctBegin+","+ctEnd);
//		}
		dataGrid.setPage(pagelist.getCurPageNO());
		dataGrid.setTotal(pagelist.getCount());
		dataGrid.setReaults(pagelist.getResultList());
		TagUtil.datagrid(response, dataGrid);
		
	}

	/**
	 * 删除销售合同
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContractEntity tbContract, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbContract = systemService.getEntity(TbContractEntity.class, tbContract.getId());
		message = "删除成功";
		tbContractService.delMain(tbContract);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加销售合同
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContractEntity tbContract,TbContractPage tbContractPage, HttpServletRequest request) {
		List<TbOrderEntity> tbOrderList =  tbContractPage.getTbOrderList();
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbContract.getId())) {
			message = "更新成功";
			tbContractService.updateMain(tbContract, tbOrderList);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} else {
			message = "添加成功";
			tbContractService.addMain(tbContract, tbOrderList);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 销售合同列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContractEntity tbContract, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbContract.getId())) {
			tbContract = tbContractService.getEntity(TbContractEntity.class, tbContract.getId());
			req.setAttribute("tbContractPage", tbContract);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbContract");
	}
	
	
	/**
	 * 加载明细列表[销售订单]
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbOrderList")
	public ModelAndView tbOrderList(TbContractEntity tbContract, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id0 = tbContract.getId();
		//===================================================================================
		//删除-销售订单
	    String hql0 = "from TbOrderEntity where 1 = 1 AND tbContract = ? ";
	    List<TbOrderEntity> tbOrderEntityList = systemService.findHql(hql0,tbContract);
		req.setAttribute("tbOrderList", tbOrderEntityList);
		return new ModelAndView("jeecg/kxcomm/contactm/tbOrderList1");
	}
	
	/**
	 * 明细列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "contractDetail")
	public ModelAndView contractDetail(HttpServletRequest req,String id) {
		String hql = "from TbContractEntity where 1 = 1 AND id = ? ";
		List<TbContractEntity> tbContractEntityList = systemService.findHql(hql,id);
		
		String hql0 = "from TbOrderEntity where 1 = 1 AND tbContract = ? ";
	    List<TbOrderEntity> tbOrderEntityList = systemService.findHql(hql0,tbContractEntityList.get(0));
	    
	    String hql1 = "from TbOrderDetailEntity where 1 = 1 AND tbOrder = ? ";
	    List t = new ArrayList();
	    for(TbOrderEntity tbOrder:tbOrderEntityList){
	    	List<TbOrderDetailEntity> tbOrderDetailList = systemService.findHql(hql1,tbOrder);
	    	for(TbOrderDetailEntity tbOrderDetail:tbOrderDetailList){
	    		t.add(tbOrderDetail);
	    	}
	    	
	    }
		req.setAttribute("tbOrderDetailList", t);
		return new ModelAndView("jeecg/kxcomm/contactm/tbContractDetail");
	}
	
	
}
