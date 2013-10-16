package jeecg.kxcomm.controller.systemmanager;
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
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import jeecg.system.pojo.base.TSDepart;
import jeecg.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocVariableEntity;
import jeecg.kxcomm.service.systemmanager.TbContractTemplatesDocVariableServiceI;

/**   
 * @Title: Controller
 * @Description: 合同模板文件变量
 * @author zhangdaihao
 * @date 2013-10-14 18:21:11
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContractTemplatesDocVariableController")
public class TbContractTemplatesDocVariableController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractTemplatesDocVariableController.class);

	@Autowired
	private TbContractTemplatesDocVariableServiceI tbContractTemplatesDocVariableService;
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
	 * 合同模板文件变量列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContractTemplatesDocVariable")
	public ModelAndView tbContractTemplatesDocVariable(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractTemplatesDocVariableList");
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
	public void datagrid(TbContractTemplatesDocVariableEntity tbContractTemplatesDocVariable,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbContractTemplatesDocVariableEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContractTemplatesDocVariable);
		this.tbContractTemplatesDocVariableService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除合同模板文件变量
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContractTemplatesDocVariableEntity tbContractTemplatesDocVariable, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbContractTemplatesDocVariable = systemService.getEntity(TbContractTemplatesDocVariableEntity.class, tbContractTemplatesDocVariable.getId());
		message = "删除成功";
		tbContractTemplatesDocVariableService.delete(tbContractTemplatesDocVariable);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加合同模板文件变量
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContractTemplatesDocVariableEntity tbContractTemplatesDocVariable, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbContractTemplatesDocVariable.getId())) {
			message = "更新成功";
			TbContractTemplatesDocVariableEntity t = tbContractTemplatesDocVariableService.get(TbContractTemplatesDocVariableEntity.class, tbContractTemplatesDocVariable.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbContractTemplatesDocVariable, t);
				tbContractTemplatesDocVariableService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbContractTemplatesDocVariableService.save(tbContractTemplatesDocVariable);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 合同模板文件变量列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContractTemplatesDocVariableEntity tbContractTemplatesDocVariable, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbContractTemplatesDocVariable.getId())) {
			tbContractTemplatesDocVariable = tbContractTemplatesDocVariableService.getEntity(TbContractTemplatesDocVariableEntity.class, tbContractTemplatesDocVariable.getId());
			req.setAttribute("tbContractTemplatesDocVariablePage", tbContractTemplatesDocVariable);
		}
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractTemplatesDocVariable");
	}
}
