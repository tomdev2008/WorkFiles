package jeecg.kxcomm.controller.contactm;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import jeecg.system.pojo.base.TSDepart;
import jeecg.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import jeecg.kxcomm.entity.contactm.TbConfigModelDataEntity;
import jeecg.kxcomm.entity.contactm.TbConfigModelsEntity;
import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.entity.contactm.TbQuotationsEntity;
import jeecg.kxcomm.entity.systemmanager.TbDataSourceEntityEntity;
import jeecg.kxcomm.entity.systemmanager.TbDataSourceTypeEntity;
import jeecg.kxcomm.service.contactm.TbConfigModelsServiceI;
import jeecg.kxcomm.service.impl.systemmanager.TbDataSourceEntityServiceImpl;
import jeecg.kxcomm.service.systemmanager.TbDataSourceEntityServiceI;
import jeecg.kxcomm.vo.systemmanager.DataBean;

/**   
 * @Title: Controller
 * @Description: 机型配置
 * @author zhangdaihao
 * @date 2013-10-23 16:59:00
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbConfigModelsController")
public class TbConfigModelsController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbConfigModelsController.class);

	@Autowired
	private TbConfigModelsServiceI tbConfigModelsService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private TbDataSourceEntityServiceI tbDataSourceEntityService;// = new TbDataSourceEntityServiceImpl();
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 机型配置列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbConfigModels")
	public ModelAndView tbConfigModels(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbConfigModelsList");
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
	public void datagrid(TbConfigModelsEntity tbConfigModels,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbConfigModelsEntity.class, dataGrid);
		//HttpSession session =  request.getSession();
		//String quotationId = ""+session.getAttribute("quotation");
		String quotationId = request.getParameter("quotation");
		
		cq.createAlias("tbQuotations", "tbQuotations");
		cq.eq("tbQuotations.id",quotationId);
		cq.add();
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbConfigModels);
		this.tbConfigModelsService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除机型配置
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbConfigModelsEntity tbConfigModels, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try{
			tbConfigModels = systemService.getEntity(TbConfigModelsEntity.class, tbConfigModels.getId());
			
			String hql0 = "from TbConfigModelDataEntity where 1 = 1 AND tbConfigModels.id = ? ";
			List<TbConfigModelDataEntity> tbConfigModelDataList = systemService.findHql(hql0, tbConfigModels.getId());
			systemService.deleteAllEntitie(tbConfigModelDataList);
			message = "删除成功";
			tbConfigModelsService.delete(tbConfigModels);
		}catch(Exception e){
			message = "删除失败";
		}
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加机型配置
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbConfigModelsEntity tbConfigModels, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbConfigModels.getId())) {
			message = "更新成功";
			
			TbConfigModelsEntity t = tbConfigModelsService.get(TbConfigModelsEntity.class, tbConfigModels.getId());
			TbQuotationsEntity tbQuotations = systemService.getEntity(TbQuotationsEntity.class, t.getTbQuotations().getId());
			TbDataSourceEntityEntity tbDataSource = systemService.getEntity(TbDataSourceEntityEntity.class, t.getTbDataSource().getId());
			
			tbConfigModels.setTbDataSource(tbDataSource);
			tbConfigModels.setTbQuotations(tbQuotations);
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbConfigModels, t);
				tbConfigModelsService.saveOrUpdate(t);
				
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			String quotationId = request.getParameter("quotationId");
			String name = request.getParameter("name");
			String dataSourceId = request.getParameter("dataSourceId");
			
			TbQuotationsEntity tbQuotations = systemService.getEntity(TbQuotationsEntity.class, quotationId);
			TbDataSourceEntityEntity tbDataSource = systemService.getEntity(TbDataSourceEntityEntity.class, dataSourceId);
			
			tbConfigModels.setName(name);
			tbConfigModels.setType(tbDataSource.getTbDataSourceType().getId());
			tbConfigModels.setTbDataSource(tbDataSource);
			tbConfigModels.setTbQuotations(tbQuotations);
			tbConfigModels.setCreateTime(new Date());
			tbConfigModelsService.save(tbConfigModels);
			
			HttpSession session =  request.getSession();
			session.setAttribute("configId", tbConfigModels.getId());
			
			List<DataBean> volist = tbDataSourceEntityService.listDetailDataRecord(dataSourceId);
			session.setAttribute("volist", volist);
			
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 机型配置列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbConfigModelsEntity tbConfigModels, HttpServletRequest req) {
		List<TbDataSourceTypeEntity> typeList = systemService.getList(TbDataSourceTypeEntity.class);
		req.setAttribute("typeList", typeList);
		if (StringUtil.isNotEmpty(tbConfigModels.getId())) {
			tbConfigModels = tbConfigModelsService.getEntity(TbConfigModelsEntity.class, tbConfigModels.getId());
			req.setAttribute("tbConfigModelsPage", tbConfigModels);
		}
		
		String quotationId = req.getParameter("qid");
		
		req.setAttribute("qid", quotationId);
		//HttpSession session =  req.getSession();
		//session.removeAttribute("quotationId");
		
		return new ModelAndView("jeecg/kxcomm/contactm/tbConfigModels");
	}
	
	
	/**
	 * 机型配置列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "changePageById")
	public ModelAndView changePageById(HttpServletRequest request) {
		HttpSession session =  request.getSession();
		String quotationId = ""+session.getAttribute("quotationId");
		
		request.setAttribute("quotation", quotationId);
		return new ModelAndView("jeecg/kxcomm/contactm/tbConfigModelsList");
	}
	
	@RequestMapping(params = "detail")
	public ModelAndView detail(HttpServletRequest req) {
		String id = req.getParameter("id");
		
		String hql0 = "from TbConfigModelDataEntity where 1 = 1 AND tbConfigModels.id = ? ";
		List<TbConfigModelDataEntity> tbConfigModelDataList = systemService.findHql(hql0, id);
		
	    TbConfigModelsEntity tbConfigModels = systemService.getEntity(TbConfigModelsEntity.class, id);
	    
	    List<DataBean> volist = tbDataSourceEntityService.listDetailDataRecord(tbConfigModels.getTbDataSource().getId());
	    req.setAttribute("configId", id);
		req.setAttribute("volist", volist);
		req.setAttribute("tbConfigModelDataPage", tbConfigModelDataList);
		return new ModelAndView("jeecg/kxcomm/contactm/tbConfigModelDataList");
	}
	
	@RequestMapping(params = "checkDetail")
	public ModelAndView checkDetail(HttpServletRequest req) {
		String id = req.getParameter("id");
		
		String hql0 = "from TbConfigModelDataEntity where 1 = 1 AND tbConfigModels.id = ? ";
		List<TbConfigModelDataEntity> tbConfigModelDataList = systemService.findHql(hql0, id);
		
	    //TbConfigModelsEntity tbConfigModels = systemService.getEntity(TbConfigModelsEntity.class, id);
	    
	    //List<DataBean> volist = tbDataSourceEntityService.listDetailDataRecord(tbConfigModels.getTbDataSource().getId());
	    req.setAttribute("configId", id);
		//req.setAttribute("volist", volist);
		req.setAttribute("tbConfigModelDataPage", tbConfigModelDataList);
		return new ModelAndView("jeecg/kxcomm/contactm/tbConfigModelDataCheckList");
	}
	
}
