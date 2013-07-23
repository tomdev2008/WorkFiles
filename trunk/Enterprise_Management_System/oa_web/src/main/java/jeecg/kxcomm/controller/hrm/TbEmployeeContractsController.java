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

import jeecg.kxcomm.entity.hrm.TbEmployeeContractsEntity;
import jeecg.kxcomm.service.hrm.TbEmployeeContractsServiceI;

/**   
 * @Title: Controller
 * @Description: 员工合同表
 * @author zhangdaihao
 * @date 2013-07-23 14:49:41
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbEmployeeContractsController")
public class TbEmployeeContractsController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbEmployeeContractsController.class);

	@Autowired
	private TbEmployeeContractsServiceI tbEmployeeContractsService;
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
	 * 员工合同表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbEmployeeContracts")
	public ModelAndView tbEmployeeContracts(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/hrm/tbEmployeeContractsList");
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
	public void datagrid(TbEmployeeContractsEntity tbEmployeeContracts,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbEmployeeContractsEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbEmployeeContracts);
		this.tbEmployeeContractsService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除员工合同表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbEmployeeContractsEntity tbEmployeeContracts, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbEmployeeContracts = systemService.getEntity(TbEmployeeContractsEntity.class, tbEmployeeContracts.getId());
		message = "删除成功";
		tbEmployeeContractsService.delete(tbEmployeeContracts);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加员工合同表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbEmployeeContractsEntity tbEmployeeContracts, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbEmployeeContracts.getId())) {
			message = "更新成功";
			TbEmployeeContractsEntity t = tbEmployeeContractsService.get(TbEmployeeContractsEntity.class, tbEmployeeContracts.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbEmployeeContracts, t);
				tbEmployeeContractsService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbEmployeeContractsService.save(tbEmployeeContracts);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 员工合同表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbEmployeeContractsEntity tbEmployeeContracts, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbEmployeeContracts.getId())) {
			tbEmployeeContracts = tbEmployeeContractsService.getEntity(TbEmployeeContractsEntity.class, tbEmployeeContracts.getId());
			req.setAttribute("tbEmployeeContractsPage", tbEmployeeContracts);
		}
		return new ModelAndView("jeecg/kxcomm/hrm/tbEmployeeContracts");
	}
}
