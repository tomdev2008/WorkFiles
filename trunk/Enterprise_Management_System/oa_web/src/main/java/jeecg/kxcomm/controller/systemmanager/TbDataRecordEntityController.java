package jeecg.kxcomm.controller.systemmanager;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
import jeecg.kxcomm.entity.systemmanager.TbDataRecordEntityEntity;
import jeecg.kxcomm.entity.systemmanager.TbDataSourceEntityEntity;
import jeecg.kxcomm.entity.systemmanager.TbProductTypeEntity;
import jeecg.kxcomm.service.systemmanager.TbDataRecordEntityServiceI;
import jeecg.kxcomm.service.systemmanager.TbDataSourceEntityServiceI;

/**   
 * @Title: Controller
 * @Description: 数据源详情
 * @author zhangdaihao
 * @date 2013-10-15 15:40:09
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbDataRecordEntityController")
public class TbDataRecordEntityController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbDataRecordEntityController.class);

	@Autowired
	private TbDataRecordEntityServiceI tbDataRecordEntityService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private TbDataSourceEntityServiceI tbDataSourceService;
	
	
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 数据源详情列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbDataRecordEntity")
	public ModelAndView tbDataRecordEntity(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbDataRecordEntityList");
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
	public void datagrid(TbDataRecordEntityEntity tbDataRecordEntity,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbDataRecordEntityEntity.class, dataGrid);
		String dataSourceId = request.getParameter("dataSourceId");
		String productTypeId = request.getParameter("productTypeId");
		
		HqlQuery hqlQuery = new HqlQuery("TbDataRecordEntityEntity.do?datagrid");
		hqlQuery.setCurPage(dataGrid.getPage());
		hqlQuery.setPageSize(dataGrid.getRows());
		hqlQuery.setDataGrid(dataGrid);
		PageList pagelist = this.tbDataRecordEntityService.getPageList(hqlQuery, true,tbDataRecordEntity,dataSourceId,productTypeId);
		
		dataGrid.setPage(pagelist.getCurPageNO());
		dataGrid.setTotal(pagelist.getCount());
		dataGrid.setReaults(pagelist.getResultList());
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除数据源详情
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbDataRecordEntityEntity tbDataRecordEntity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbDataRecordEntity = systemService.getEntity(TbDataRecordEntityEntity.class, tbDataRecordEntity.getId());
		message = "删除成功";
		tbDataRecordEntityService.delete(tbDataRecordEntity);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加数据源详情
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbDataRecordEntityEntity tbDataRecordEntity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbDataRecordEntity.getId())) {
			message = "更新成功";
			TbDataRecordEntityEntity t = tbDataRecordEntityService.get(TbDataRecordEntityEntity.class, tbDataRecordEntity.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbDataRecordEntity, t);
				tbDataRecordEntityService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			String dataSourceId = request.getParameter("dataSourceId");
			String typeId = request.getParameter("typeId");
			TbDataSourceEntityEntity tbDataSource = tbDataRecordEntityService.getEntity(TbDataSourceEntityEntity.class, dataSourceId);
			TbProductTypeEntity tbProductType = tbDataRecordEntityService.getEntity(TbProductTypeEntity.class, typeId);
			tbDataRecordEntity.setTbDataSource(tbDataSource);
			tbDataRecordEntity.setTbProductType(tbProductType);
			message = "添加成功";
			tbDataRecordEntityService.save(tbDataRecordEntity);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 数据源详情列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbDataRecordEntityEntity tbDataRecordEntity, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbDataRecordEntity.getId())) {
			tbDataRecordEntity = tbDataRecordEntityService.getEntity(TbDataRecordEntityEntity.class, tbDataRecordEntity.getId());
			req.setAttribute("tbDataRecordEntityPage", tbDataRecordEntity);
		}
		List<TbDataSourceEntityEntity> tbDataSourceList = tbDataSourceService.getList(TbDataSourceEntityEntity.class);
		List<TbProductTypeEntity> tbProductTypeList = systemService.getList(TbProductTypeEntity.class);
		req.setAttribute("tbDataSourceList", tbDataSourceList);
		req.setAttribute("tbProductTypeList", tbProductTypeList);
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbDataRecordEntity");
	}
	
	@RequestMapping(params = "check")
	public ModelAndView check(TbDataRecordEntityEntity tbDataRecordEntity, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbDataRecordEntity.getId())) {
			tbDataRecordEntity = tbDataRecordEntityService.getEntity(TbDataRecordEntityEntity.class, tbDataRecordEntity.getId());
			req.setAttribute("tbDataRecordEntityPage", tbDataRecordEntity);
		}
		
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbDataRecordCheck");
	}
}
