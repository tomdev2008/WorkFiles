package jeecg.test.controller.orders;
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

import jeecg.test.entity.orders.TbAgentsEntity;
import jeecg.test.service.orders.TbAgentsServiceI;

/**   
 * @Title: Controller
 * @Description: 货代公司
 * @author zhangdaihao
 * @date 2013-06-15 12:49:01
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbAgentsController")
public class TbAgentsController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbAgentsController.class);

	@Autowired
	private TbAgentsServiceI tbAgentsService;
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
	 * 货代公司列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbAgents")
	public ModelAndView tbAgents(HttpServletRequest request) {
		return new ModelAndView("jeecg/test/orders/tbAgentsList");
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
	public void datagrid(TbAgentsEntity tbAgents,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbAgentsEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbAgents);
		this.tbAgentsService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除货代公司
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbAgentsEntity tbAgents, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbAgents = systemService.getEntity(TbAgentsEntity.class, tbAgents.getId());
		message = "删除成功";
		tbAgentsService.delete(tbAgents);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加货代公司
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbAgentsEntity tbAgents, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbAgents.getId())) {
			message = "更新成功";
			TbAgentsEntity t = tbAgentsService.get(TbAgentsEntity.class, tbAgents.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbAgents, t);
				tbAgentsService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbAgentsService.save(tbAgents);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 货代公司列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbAgentsEntity tbAgents, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbAgents.getId())) {
			tbAgents = tbAgentsService.getEntity(TbAgentsEntity.class, tbAgents.getId());
			req.setAttribute("tbAgentsPage", tbAgents);
		}
		return new ModelAndView("jeecg/test/orders/tbAgents");
	}
}
