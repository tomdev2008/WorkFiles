package jeecg.kxcomm.controller.hrm;
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

import jeecg.kxcomm.entity.hrm.TbEmployeeEntity;
import jeecg.kxcomm.service.hrm.TbEmployeeServiceI;

/**   
 * @Title: Controller
 * @Description: 员工表
 * @author zhangdaihao
 * @date 2013-07-23 14:49:04
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbEmployeeController")
public class TbEmployeeController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbEmployeeController.class);

	@Autowired
	private TbEmployeeServiceI tbEmployeeService;
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
	 * 员工表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbEmployee")
	public ModelAndView tbEmployee(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/hrm/tbEmployeeList");
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
	public void datagrid(TbEmployeeEntity tbEmployee,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbEmployeeEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbEmployee);
		this.tbEmployeeService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除员工表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbEmployeeEntity tbEmployee, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbEmployee = systemService.getEntity(TbEmployeeEntity.class, tbEmployee.getId());
		message = "删除成功";
		tbEmployeeService.delete(tbEmployee);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加员工表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbEmployeeEntity tbEmployee, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbEmployee.getId())) {
			message = "更新成功";
			TbEmployeeEntity t = tbEmployeeService.get(TbEmployeeEntity.class, tbEmployee.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbEmployee, t);
				tbEmployeeService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbEmployeeService.save(tbEmployee);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 员工表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbEmployeeEntity tbEmployee, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbEmployee.getId())) {
			tbEmployee = tbEmployeeService.getEntity(TbEmployeeEntity.class, tbEmployee.getId());
			req.setAttribute("tbEmployeePage", tbEmployee);
		}
		return new ModelAndView("jeecg/kxcomm/hrm/tbEmployee");
	}
}
