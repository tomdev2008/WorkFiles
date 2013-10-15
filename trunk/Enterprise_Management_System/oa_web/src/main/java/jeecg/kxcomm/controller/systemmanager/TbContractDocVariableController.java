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

import jeecg.kxcomm.entity.systemmanager.TbContractDocVariableEntity;
import jeecg.kxcomm.service.systemmanager.TbContractDocVariableServiceI;

/**   
 * @Title: Controller
 * @Description: 合同文件变量
 * @author zhangdaihao
 * @date 2013-10-14 18:38:45
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContractDocVariableController")
public class TbContractDocVariableController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractDocVariableController.class);

	@Autowired
	private TbContractDocVariableServiceI tbContractDocVariableService;
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
	 * 合同文件变量列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContractDocVariable")
	public ModelAndView tbContractDocVariable(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractDocVariableList");
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
	public void datagrid(TbContractDocVariableEntity tbContractDocVariable,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbContractDocVariableEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContractDocVariable);
		this.tbContractDocVariableService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除合同文件变量
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContractDocVariableEntity tbContractDocVariable, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbContractDocVariable = systemService.getEntity(TbContractDocVariableEntity.class, tbContractDocVariable.getId());
		message = "删除成功";
		tbContractDocVariableService.delete(tbContractDocVariable);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加合同文件变量
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContractDocVariableEntity tbContractDocVariable, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbContractDocVariable.getId())) {
			message = "更新成功";
			TbContractDocVariableEntity t = tbContractDocVariableService.get(TbContractDocVariableEntity.class, tbContractDocVariable.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbContractDocVariable, t);
				tbContractDocVariableService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbContractDocVariableService.save(tbContractDocVariable);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 合同文件变量列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContractDocVariableEntity tbContractDocVariable, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbContractDocVariable.getId())) {
			tbContractDocVariable = tbContractDocVariableService.getEntity(TbContractDocVariableEntity.class, tbContractDocVariable.getId());
			req.setAttribute("tbContractDocVariablePage", tbContractDocVariable);
		}
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractDocVariable");
	}
}
