package jeecg.kxcomm.controller.systemmanager;

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
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import jeecg.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesEntityEntity;
import jeecg.kxcomm.service.systemmanager.TbContractTemplatesDocServiceI;
import jeecg.kxcomm.service.systemmanager.TbContractTemplatesEntityServiceI;

/**   
 * @Title: Controller
 * @Description: 合同模板
 * @author lizl
 * @date 2013-10-12 11:13:56
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContractTemplatesEntityController")
public class TbContractTemplatesEntityController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractTemplatesEntityController.class);

	@Autowired
	private TbContractTemplatesEntityServiceI tbContractTemplatesEntityService;
	@Autowired
	private TbContractTemplatesDocServiceI tbContractTemplatesDocService;
	@Autowired
	private SystemService systemService;
	private String message;
	private String temple_id;
	private String statsvalues;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTemple_id() {
		return this.temple_id;
	}

	public void setTemple_id(String temple_id) {
		this.temple_id = temple_id;
	}

	public String getStatsvalues() {
		return this.statsvalues;
	}

	public void setStatsvalues(String statsvalues) {
		this.statsvalues = statsvalues;
	}

	/**
	 * 合同模板列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContractTemplatesEntity")
	public ModelAndView tbContractTemplatesEntity(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractTemplatesEntityList");
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
	public void datagrid(TbContractTemplatesEntityEntity tbContractTemplatesEntity,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbContractTemplatesEntityEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContractTemplatesEntity);
		this.tbContractTemplatesEntityService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除合同模板
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContractTemplatesEntityEntity tbContractTemplatesEntity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbContractTemplatesDocService.delMidTempFileEntity(tbContractTemplatesEntity.getId());
		tbContractTemplatesEntity = systemService.getEntity(TbContractTemplatesEntityEntity.class, tbContractTemplatesEntity.getId());
		message = "删除成功";
		tbContractTemplatesEntityService.delete(tbContractTemplatesEntity);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加合同模板
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContractTemplatesEntityEntity tbContractTemplatesEntity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbContractTemplatesEntity.getId())) {
			message = "更新成功";
			TbContractTemplatesEntityEntity t = tbContractTemplatesEntityService.get(TbContractTemplatesEntityEntity.class, tbContractTemplatesEntity.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbContractTemplatesEntity, t);
				tbContractTemplatesEntityService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbContractTemplatesEntityService.save(tbContractTemplatesEntity);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 合同模板列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContractTemplatesEntityEntity tbContractTemplatesEntity, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbContractTemplatesEntity.getId())) {
			tbContractTemplatesEntity = tbContractTemplatesEntityService.getEntity(TbContractTemplatesEntityEntity.class, tbContractTemplatesEntity.getId());
			req.setAttribute("tbContractTemplatesEntityPage", tbContractTemplatesEntity);
		}
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractTemplatesEntity");
	}
	
	/**
	 * 根绝合同模板ID查询相应的合同文件
	 * 
	 * @return
	 */
	@RequestMapping(params = "queryInfo")
	public ModelAndView queryConFileByTemId(HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		String temple_id = request.getParameter("temple_id");
		String statsvalues = request.getParameter("statsvalues");
		request.setAttribute("temple_id", temple_id);
		request.setAttribute("statsvalues", statsvalues);
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbConTempInfoDocList");
	}
}
