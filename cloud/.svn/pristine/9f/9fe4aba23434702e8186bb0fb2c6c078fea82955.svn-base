package jeecg.kxcomm.controller.contactm;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.kxcomm.entity.contactm.TbOrderDetailEntity;
import jeecg.kxcomm.entity.contactm.TbPurchaseContractEntity;
import jeecg.kxcomm.entity.contactm.TbPurchaseEntity;
import jeecg.kxcomm.service.contactm.TbPurchaseContractServiceI;
import jeecg.kxcomm.service.contactm.TbPurchaseServiceI;
import jeecg.kxcomm.util.CommonUtil;
import jeecg.kxcomm.util.PathConstants;
import jeecg.system.pojo.base.TSUser;
import jeecg.system.service.SystemService;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.excel.ExcelExportUtil;
import org.jeecgframework.core.util.excel.entity.ExcelTitle;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**   
 * @Title: Controller
 * @Description: 采购订单
 * @author zhangdaihao
 * @date 2013-09-24 16:46:46
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbPurchaseController")
public class TbPurchaseController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbPurchaseController.class);

	@Autowired
	private TbPurchaseServiceI tbPurchaseService;
	@Autowired
	private SystemService systemService;
	private String message;
	private CommonUtil commonUtil =CommonUtil.getInstance();
	
	@Autowired
	private TbPurchaseContractServiceI tbPurchaseContractService;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@RequestMapping(params = "projectTrackingDetail")
	public ModelAndView projectTrackingDetail(TbPurchaseEntity tbPurchase, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbPurchase.getId())) {
			tbPurchase = tbPurchaseService.getEntity(TbPurchaseEntity.class, tbPurchase.getId());
			
			String id = req.getParameter("id");
			req.setAttribute("id",id);
			req.setAttribute("tbPurchasePage", tbPurchase);
			
		}
		return new ModelAndView("jeecg/kxcomm/contactm/projectTracking");
	}
	
	/**
	 * 项目跟踪列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "projectTracking")
	public ModelAndView projectTracking(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/projectTrackingList");
	}
	
	/**
	 * 
	 * 项目跟踪表
	 * 
	 * @param tbPurchase
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @author zhangjh 新增日期：2013-10-20
	 * @since private-kx-system
	 */
	@RequestMapping(params = "projectTrackingDatagrid")
	public void projectTrackingDatagrid(TbPurchaseEntity tbPurchase,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbPurchaseEntity.class, dataGrid);
		boolean addtbOrderDetail = false;
		boolean addtbOrder = false;
		boolean addtbContract = false;
		String area = request.getParameter("area");
		if(area!=null && !"".equals(area)){
			cq.like("area", "%"+area+"%");
			cq.add();
		}
		String tbOrderDetail_price = request.getParameter("tbOrderDetail_price");
		if(tbOrderDetail_price!=null && !"".equals(tbOrderDetail_price)){
			cq.like("tbOrderDetail.price", "%"+tbOrderDetail_price+"%");
			cq.add();
			addtbOrderDetail=true;
			addtbOrderDetail = true;
		}
		String tbOrderDetail_tbOrder_principal = request.getParameter("tbOrderDetail_tbOrder_principal");
		if(tbOrderDetail_tbOrder_principal!=null && !"".equals(tbOrderDetail_tbOrder_principal)){
			cq.like("tbOrder.principal", "%"+tbOrderDetail_tbOrder_principal+"%");
			cq.add();
			addtbOrderDetail=true;
			addtbOrder = true;
		}
		String tbOrderDetail_tbOrder_kxOrderNo = request.getParameter("tbOrderDetail_tbOrder_kxOrderNo");
		if(tbOrderDetail_tbOrder_kxOrderNo!=null && !"".equals(tbOrderDetail_tbOrder_kxOrderNo)){
			cq.like("tbOrder.kxOrderNo","%"+ tbOrderDetail_tbOrder_kxOrderNo+"%");
			cq.add();
			addtbOrderDetail=true;
			addtbOrder = true;
		}
		
		String tbOrderDetail_tbOrder_finalClient = request.getParameter("tbOrderDetail_tbOrder_finalClient");
		if(tbOrderDetail_tbOrder_finalClient!=null && !"".equals(tbOrderDetail_tbOrder_finalClient)){
			cq.like("tbOrder.finalClient", "%"+tbOrderDetail_tbOrder_finalClient+"%");
			cq.add();
			addtbOrderDetail=true;
			addtbOrder = true;
		}
		
		String tbOrderDetail_tbOrder_projectName = request.getParameter("tbOrderDetail_tbOrder_projectName");
		if(tbOrderDetail_tbOrder_projectName!=null && !"".equals(tbOrderDetail_tbOrder_projectName)){
			cq.like("tbOrder.projectName","%"+ tbOrderDetail_tbOrder_projectName+"%");
			cq.add();
			addtbOrderDetail=true;
			addtbOrder = true;
		}
/*		//有错误，还没解决
		String placeOrderDate = request.getParameter("placeOrderDate");
		if(placeOrderDate!=null && !"".equals(placeOrderDate)){
			Date date =CommonUtil.toDate(placeOrderDate, "yyyy-mm-dd");
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.set(Calendar.HOUR, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.MILLISECOND, 0);
			Date rs =calendar.getTime();
			cq.like("placeOrderDate",rs);
			cq.add();
		}
		*/
		
		String tbOrderDetail_tbOrder_tbContract_contractNo = request.getParameter("tbOrderDetail_tbOrder_tbContract_contractNo");
		if(tbOrderDetail_tbOrder_tbContract_contractNo!=null && !"".equals(tbOrderDetail_tbOrder_tbContract_contractNo)){
			cq.like("tbContract.contractNo","%"+ tbOrderDetail_tbOrder_tbContract_contractNo+"%");
			cq.add();
			addtbOrderDetail=true;
			addtbOrder=true;
			addtbContract = true;
		}
		if(addtbOrderDetail){
			cq.createAlias("tbOrderDetail", "tbOrderDetail");	
		}
		if(addtbOrder){
			cq.createAlias("tbOrderDetail.tbOrder", "tbOrder");
		}
		if(addtbContract){
			cq.createAlias("tbOrderDetail.tbOrder.tbContract", "tbContract");
		}
		
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbPurchase);
		this.tbPurchaseService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	@RequestMapping(params = "projectTrackingExport")
	@ResponseBody
	public String projectTrackingExport(HttpServletRequest request){
		List<TbPurchaseEntity> list  = this.tbPurchaseContractService.getList(TbPurchaseEntity.class);
		String fileName = "projectTracking"+System.currentTimeMillis() + ".xls";
		String filePath = PathConstants.CurrentDirectory   + PathConstants.ExportPurchaseContractUrl;
		File file = new File(filePath+fileName);
		OutputStream stream;
		 try{
			 stream = new FileOutputStream(file);
			 ExcelTitle entity = new ExcelTitle("康讯通讯","所有采购汇总","采购清单");
			 HSSFWorkbook  hssf =  ExcelExportUtil.exportExcel(entity, TbPurchaseEntity.class, list);
			 hssf.write(stream);
			 stream.flush();
			 logger.info("导出测试:"+file.getAbsolutePath());
			 stream.close();
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		 return PathConstants.basePath+PathConstants.ExportPurchaseContractUrl+fileName;
	
	}

	/**
	 * 采购订单列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbPurchase")
	public ModelAndView tbPurchase(HttpServletRequest request) {
		String id = request.getParameter("id");
		request.setAttribute("id",id);
		return new ModelAndView("jeecg/kxcomm/contactm/tbPurchaseList");
	}
	
	/**
	 * 
	 * 提供给销售、售后人员查询的某销售订单的采购信息
	 * 
	 * @param request
	 * @return
	 * @author zhangjh 新增日期：2013-11-5
	 * @since private-kx-system
	 */
	@RequestMapping(params = "smallPurchase")
	public ModelAndView smallPurchaseList(HttpServletRequest request) {
		String id = request.getParameter("id");
		request.setAttribute("id",id);
		String hql0 = "from TbPurchaseEntity where 1 = 1 AND tbOrderDetail.id = ? ";
	    List<TbPurchaseEntity> list = systemService.findHql(hql0,id);
	    request.setAttribute("smallPurchaseList", list);
		return new ModelAndView("jeecg/kxcomm/contactm/tbSmallPurchaseList");
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
	public void datagrid(TbPurchaseEntity tbPurchase,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbPurchaseEntity.class, dataGrid);
		
		String id = request.getParameter("orderDetailId");
		
		cq.createAlias("tbOrderDetail", "tbOrderDetail");	
		cq.eq("tbOrderDetail.id", id);
		cq.add();
		
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbPurchase);
		this.tbPurchaseService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除采购订单
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbPurchaseEntity tbPurchase, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try{
			tbPurchase = systemService.getEntity(TbPurchaseEntity.class, tbPurchase.getId());
			message = "删除成功";
			tbPurchaseService.delete(tbPurchase);
		}catch(Exception e){
			message = "删除失败";
		}
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加采购订单
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbPurchaseEntity tbPurchase, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		//修改合同编号
				if(!tbPurchase.getTbPurchaseContract().getContractNo().equals("null")){
//					String contractNo = request.getParameter("cno");
					String hql0 = "from TbPurchaseContractEntity where 1 = 1 AND contractNo = ? ";
				    List<TbPurchaseContractEntity> tbContractList = systemService.findHql(hql0,tbPurchase.getTbPurchaseContract().getContractNo());
				    if(tbContractList.size()>0){
				    	tbPurchase.setTbPurchaseContract(tbContractList.get(0));
					}
				}else{
					tbPurchase.setTbPurchaseContract(null);
				}
		
		TbOrderDetailEntity tbOrderDetail =null;
		//计算总和
		int Number = 0;
		if(tbPurchase.getNumber()!=null&&!"".equals(tbPurchase.getNumber())){
			Number = Integer.parseInt(tbPurchase.getNumber());
		}
		double UnitPrice=0;
		
		if(tbPurchase.getUnitPrice()!=null&&!"".equals(tbPurchase.getUnitPrice())){
			UnitPrice = Double.parseDouble(tbPurchase.getUnitPrice());
		}
		double TotalPrice = Number*UnitPrice;
		tbPurchase.setTotalPrice(""+TotalPrice);
		
		if (StringUtil.isNotEmpty(tbPurchase.getId())) {
			message = "更新成功";
			TbPurchaseEntity t = tbPurchaseService.get(TbPurchaseEntity.class, tbPurchase.getId());
			tbOrderDetail = systemService.get(TbOrderDetailEntity.class, t.getTbOrderDetail().getId());	
			//t.setTbOrderDetail(tbOrderDetail);
			tbPurchase.setTbOrderDetail(tbOrderDetail);
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbPurchase, t);
				tbPurchaseService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			String id = request.getParameter("orderDetailId");			
//			
//			TbOrderDetailEntity orderDetailEntity = new TbOrderDetailEntity();
//			orderDetailEntity.setId(id);
			tbOrderDetail = systemService.getEntity(TbOrderDetailEntity.class, id);				
			
			tbPurchase.setTbOrderDetail(tbOrderDetail);
			//-------------------------------
			message = "添加成功";
			TSUser user= ResourceUtil.getSessionUserName();
			tbPurchase.setCreateUser(user.getRealName());
			tbPurchase.setCreateTime(new Date());
			tbPurchaseService.save(tbPurchase);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		//保存采购总价
		String hql0 = "from TbPurchaseEntity where 1 = 1 AND order_detail_id = ? ";
	    List<TbPurchaseEntity> list = systemService.findHql(hql0,tbOrderDetail.getId());
	    double totalprice=0;
		for(TbPurchaseEntity t:list){
			int num = 0;
			if(t.getNumber()!=null&&!"".equals(t.getNumber())){
				num = Integer.parseInt(t.getNumber());
			}
			double price=0;
			
			if(t.getUnitPrice()!=null&&!"".equals(t.getUnitPrice())){
				price = Double.parseDouble(t.getUnitPrice());
			}
			double sum = num*price;
			String result = commonUtil.numberFormat(""+sum, 4, true);
			totalprice+=Double.parseDouble(result);
		}
		tbOrderDetail.setPurchaseprice(""+totalprice);
		systemService.save(tbOrderDetail);
		return j;
	}

	/**
	 * 采购订单列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbPurchaseEntity tbPurchase, HttpServletRequest req) {
		List<TbPurchaseContractEntity> contractList = tbPurchaseContractService.getList(TbPurchaseContractEntity.class);
		req.setAttribute("contractList", contractList);
		if (StringUtil.isNotEmpty(tbPurchase.getId())) {
			tbPurchase = tbPurchaseService.getEntity(TbPurchaseEntity.class, tbPurchase.getId());
			
			String id = req.getParameter("id");
			req.setAttribute("id",id);
			req.setAttribute("tbPurchasePage", tbPurchase);
			
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbPurchase");
	}
	
	@RequestMapping(params = "getPurchaseById")
	@ResponseBody
	public TbPurchaseEntity getPurchaseById(HttpServletRequest request) {
		
		
		List<TbPurchaseEntity> tbPurchaseList =  new ArrayList<TbPurchaseEntity>();
		
		String ids = request.getParameter("ids");
		String[] primarSouce = ids.split(",");
		for(int i=0;i<primarSouce.length;i++){
			String hql = "from TbPurchaseEntity where 1 = 1 AND tbOrderDetail.id = ? ";
			List<TbPurchaseEntity> tbPurchaseEntityList = systemService.findHql(hql,primarSouce[i]);
			for(TbPurchaseEntity tbPurchase: tbPurchaseEntityList){
				tbPurchaseList.add(tbPurchase);
			}
			
		}
		
		
		if(tbPurchaseList.size()==0){
			return null;
		}else{		
			return tbPurchaseList.get(0);
		}
	}
	
}
