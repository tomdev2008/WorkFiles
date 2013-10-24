package jeecg.kxcomm.controller.contactm;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.kxcomm.entity.contactm.TbPurchaseContractEntity;
import jeecg.kxcomm.entity.contactm.TbPurchaseEntity;
import jeecg.kxcomm.page.contactm.TbPurchaseContractPage;
import jeecg.kxcomm.service.contactm.TbPurchaseContractServiceI;
import jeecg.system.service.SystemService;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
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
 * @Description: 采购合同
 * @author zhangdaihao
 * @date 2013-09-29 09:48:29
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbPurchaseContractController")
public class TbPurchaseContractController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbPurchaseContractController.class);

	@Autowired
	private TbPurchaseContractServiceI tbPurchaseContractService;
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
	 * 采购合同列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbPurchaseContract")
	public ModelAndView tbPurchaseContract(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbPurchaseContractList");
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
	public void datagrid(TbPurchaseContractEntity tbPurchaseContract,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbPurchaseContractEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbPurchaseContract);
		this.tbPurchaseContractService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除采购合同
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbPurchaseContractEntity tbPurchaseContract, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try{
			tbPurchaseContract = systemService.getEntity(TbPurchaseContractEntity.class, tbPurchaseContract.getId());
			message = "删除成功";
			tbPurchaseContractService.delMain(tbPurchaseContract);
		}catch(Exception e){
			message = "删除失败";
		}
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		j.setMsg(message);
		return j;
	}


//	/**
//	 * 添加采购合同
//	 * 
//	 * @param ids
//	 * @return
//	 */
//	@RequestMapping(params = "save")
//	@ResponseBody
//	public AjaxJson save(TbPurchaseContractEntity tbPurchaseContract, HttpServletRequest request) {
//		AjaxJson j = new AjaxJson();
//		if (StringUtil.isNotEmpty(tbPurchaseContract.getId())) {
//			message = "更新成功";
//			TbPurchaseContractEntity t = tbPurchaseContractService.get(TbPurchaseContractEntity.class, tbPurchaseContract.getId());
//			try {
//				MyBeanUtils.copyBeanNotNull2Bean(tbPurchaseContract, t);
//				tbPurchaseContractService.saveOrUpdate(t);
//				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		} else {
//			message = "添加成功";
//			tbPurchaseContractService.save(tbPurchaseContract);
//			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
//		}
//		
//		return j;
//	}

	/**
	 * 采购合同列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbPurchaseContractEntity tbPurchaseContract, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbPurchaseContract.getId())) {
			tbPurchaseContract = tbPurchaseContractService.getEntity(TbPurchaseContractEntity.class, tbPurchaseContract.getId());
			req.setAttribute("tbPurchaseContractPage", tbPurchaseContract);
			String hql0 = "from TbPurchaseEntity where 1 = 1  AND tbPurchaseContract.id ='" +tbPurchaseContract.getId()+"'";
		    List<TbPurchaseEntity> tbPurchaseEntityList = systemService.findHql(hql0);
			req.setAttribute("tbPurchaseList", tbPurchaseEntityList);
		}else{
			String hql0 = "from TbPurchaseEntity where 1 = 1 AND tbPurchaseContract = null AND tbOrderDetail.tbOrder.id is not null";
		    List<TbPurchaseEntity> tbPurchaseEntityList = systemService.findHql(hql0);
			req.setAttribute("tbPurchaseList", tbPurchaseEntityList);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbPurchaseContract");
	}
	
	/**
	 * 加载明细列表[采购订单]
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbPurchaseList")
	public ModelAndView tbPurchaseList(TbPurchaseContractEntity tbPurchaseContract, HttpServletRequest req) {
	
		//===================================================================================
		//获取参数
		Object id0 = tbPurchaseContract.getId();
		//===================================================================================
		//删除-采购订单
	    String hql0 = "from TbPurchaseEntity where 1 = 1 AND tbPurchaseContract = null ";
	    List<TbPurchaseEntity> tbPurchaseEntityList = systemService.findHql(hql0);
		req.setAttribute("tbPurchaseList", tbPurchaseEntityList);
		return new ModelAndView("jeecg/kxcomm/contactm/tbPurchaseDetail");
	}
	
	
	/**
	 * 采购订单列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "purchaseContractDetail")
	public ModelAndView purchaseContractDetail(HttpServletRequest request) {
		String id = request.getParameter("id");
		request.setAttribute("id",id);
		return new ModelAndView("jeecg/kxcomm/contactm/tbPurchaseContractDetail");
	}
	
	/**
	 * 明细列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "detail")
	public void detail(TbPurchaseContractEntity tbPurchaseContract,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		TbPurchaseEntity tbPurchase = new TbPurchaseEntity();
		CriteriaQuery cq = new CriteriaQuery(TbPurchaseEntity.class, dataGrid);
		String id = request.getParameter("PurchaseContractlId");
		cq.createAlias("tbPurchaseContract", "tbPurchaseContract");	
		if(id!=null && !"".equals(id)){
			cq.eq("tbPurchaseContract.id", id);
			cq.add();
		}
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbPurchase);
		this.tbPurchaseContractService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	//------------------------------------
	/**
	 * 添加采购合同
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbPurchaseContractEntity tbPurchaseContract,TbPurchaseContractPage tbPurchaseContractPage, HttpServletRequest request) {
		List<TbPurchaseEntity> tbPurchaseList =  new ArrayList<TbPurchaseEntity>();
		
		AjaxJson j = new AjaxJson();
		String ids = request.getParameter("ids");
		String[] primarSouce = ids.split(",");
		for(int i=0;i<primarSouce.length;i++){
			TbPurchaseEntity tbPurchaseEntity = systemService.getEntity(TbPurchaseEntity.class, primarSouce[i]);
			tbPurchaseList.add(tbPurchaseEntity);
		}
		
		if (StringUtil.isNotEmpty(tbPurchaseContract.getId())) {
			message = "更新成功";
			tbPurchaseContractService.updateMain(tbPurchaseContract, tbPurchaseList);
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} else {
			message = "添加成功";
			tbPurchaseContractService.addMain(tbPurchaseContract, tbPurchaseList);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}
	
	@RequestMapping(params = "getPurchaseContractByContractNo")
	@ResponseBody
	public TbPurchaseContractEntity getPurchaseContractByContractNo(HttpServletRequest request) {
		
		String contractNo = request.getParameter("contractNo");
		String hql = "from TbPurchaseContractEntity where 1 = 1 AND contractNo = ? ";
		List<TbPurchaseContractEntity> tbPurchaseContractList = systemService.findHql(hql,contractNo);
		
		if(tbPurchaseContractList.size()==0){
			return null;
		}else{		
			return tbPurchaseContractList.get(0);
		}
	}
}
