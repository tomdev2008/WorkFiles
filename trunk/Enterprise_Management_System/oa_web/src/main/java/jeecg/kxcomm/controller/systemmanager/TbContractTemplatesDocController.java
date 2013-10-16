package jeecg.kxcomm.controller.systemmanager;
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

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import jeecg.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocEntity;
import jeecg.kxcomm.service.systemmanager.TbContractTemplatesDocServiceI;

/**   
 * @Title: Controller
 * @Description: 合同模板文件管理
 * @author lizl
 * @date 2013-10-14 16:13:25
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContractTemplatesDocController")
public class TbContractTemplatesDocController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractTemplatesDocController.class);

	@Autowired
	private TbContractTemplatesDocServiceI tbContractTemplatesDocService;
	@Autowired
	private SystemService systemService;
	private String message;
	private List<TbContractTemplatesDocEntity> templatesDocEntities;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<TbContractTemplatesDocEntity> getTemplatesDocEntities() {
		return this.templatesDocEntities;
	}

	public void setTemplatesDocEntities(
			List<TbContractTemplatesDocEntity> templatesDocEntities) {
		this.templatesDocEntities = templatesDocEntities;
	}

	/**
	 * 合同模板文件管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContractTemplatesDoc")
	public ModelAndView tbContractTemplatesDoc(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractTemplatesDocList");
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
	public void datagrid(TbContractTemplatesDocEntity tbContractTemplatesDoc,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		
		CriteriaQuery cq = new CriteriaQuery(TbContractTemplatesDocEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContractTemplatesDoc);
		this.tbContractTemplatesDocService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除合同模板文件管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContractTemplatesDocEntity tbContractTemplatesDoc, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbContractTemplatesDoc = systemService.getEntity(TbContractTemplatesDocEntity.class, tbContractTemplatesDoc.getId());
		message = "删除成功";
		tbContractTemplatesDocService.delete(tbContractTemplatesDoc);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加合同模板文件管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContractTemplatesDocEntity tbContractTemplatesDoc, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbContractTemplatesDoc.getId())) {
			message = "更新成功";
			TbContractTemplatesDocEntity t = tbContractTemplatesDocService.get(TbContractTemplatesDocEntity.class, tbContractTemplatesDoc.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbContractTemplatesDoc, t);
				tbContractTemplatesDocService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbContractTemplatesDocService.save(tbContractTemplatesDoc);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 合同模板文件管理列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContractTemplatesDocEntity tbContractTemplatesDoc, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbContractTemplatesDoc.getId())) {
			tbContractTemplatesDoc = tbContractTemplatesDocService.getEntity(TbContractTemplatesDocEntity.class, tbContractTemplatesDoc.getId());
			req.setAttribute("tbContractTemplatesDocPage", tbContractTemplatesDoc);
		}
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractTemplatesDoc");
	}
	
	/**
	 * easyui 获得模板下的所有DOC文件
	 * ModelAndView
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */
	@RequestMapping(params = "queryTempFiledatagrid")
	public void queryTempFiledatagrid(TbContractTemplatesDocEntity tbContractTemplatesDoc,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		String temple_id = request.getParameter("temple_id");
		String statsvalues = request.getParameter("statsvalues");
		//查询条件组装器
		HqlQuery hqlQuery = new HqlQuery("tbCheckingInstance.do?datagrid");
		hqlQuery.setCurPage(dataGrid.getPage());
		hqlQuery.setPageSize(dataGrid.getRows());
		hqlQuery.setDataGrid(dataGrid);
		PageList pagelist = this.tbContractTemplatesDocService.getPageList(hqlQuery, true,tbContractTemplatesDoc,temple_id,statsvalues);
		this.templatesDocEntities = this.tbContractTemplatesDocService.getConTempList(hqlQuery, false, tbContractTemplatesDoc, temple_id);
		List<TbContractTemplatesDocEntity> docEntities = new ArrayList<TbContractTemplatesDocEntity>();
		docEntities = pagelist.getResultList();
		for(int i = 0; i < docEntities.size(); i++) {
			for(int j = 0; j < this.templatesDocEntities.size(); j++) {
				if (this.templatesDocEntities.get(j).getId().trim().equals(docEntities.get(i).getId().trim())) {
					docEntities.get(i).setPath("yes");
				}
			}
		}
		pagelist.setResultList(docEntities);
		dataGrid.setPage(pagelist.getCurPageNO());
		dataGrid.setTotal(pagelist.getCount());
		dataGrid.setReaults(pagelist.getResultList());
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 修改模板和模板文件之间的关系
	 *
	 * @param tbContractTemplatesDoc
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "saveConTempFile")
	public ModelAndView saveConTempFile(TbContractTemplatesDocEntity tbContractTemplatesDoc, HttpServletRequest request) {
		String ids = request.getParameter("ids");
		String contempIds = request.getParameter("contempIds");
		this.tbContractTemplatesDocService.delMidTempFileEntity(contempIds);
		if(ids.indexOf(",")>-1) {
			String[] filesId = ids.split(",");
			for(int i = 0; i < filesId.length; i++) {
				this.tbContractTemplatesDocService.saveMidTempFileEntity(contempIds, filesId[i]);
			}
		} else {
			this.tbContractTemplatesDocService.saveMidTempFileEntity(contempIds, ids);
		}
		request.setAttribute("temple_id",contempIds);
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbConTempInfoDocList");
	}
}