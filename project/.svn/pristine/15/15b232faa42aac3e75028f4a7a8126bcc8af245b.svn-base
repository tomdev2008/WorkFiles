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

import jeecg.test.entity.orders.TbUserLevelEntity;
import jeecg.test.service.orders.TbUserLevelServiceI;

/**   
 * @Title: Controller
 * @Description: 用户级别
 * @author zhangdaihao
 * @date 2013-06-15 12:47:21
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbUserLevelController")
public class TbUserLevelController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbUserLevelController.class);

	@Autowired
	private TbUserLevelServiceI tbUserLevelService;
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
	 * 用户级别列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbUserLevel")
	public ModelAndView tbUserLevel(HttpServletRequest request) {
		return new ModelAndView("jeecg/test/orders/tbUserLevelList");
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
	public void datagrid(TbUserLevelEntity tbUserLevel,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbUserLevelEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbUserLevel);
		this.tbUserLevelService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除用户级别
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbUserLevelEntity tbUserLevel, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbUserLevel = systemService.getEntity(TbUserLevelEntity.class, tbUserLevel.getId());
		message = "删除成功";
		tbUserLevelService.delete(tbUserLevel);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加用户级别
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbUserLevelEntity tbUserLevel, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbUserLevel.getId())) {
			message = "更新成功";
			TbUserLevelEntity t = tbUserLevelService.get(TbUserLevelEntity.class, tbUserLevel.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbUserLevel, t);
				tbUserLevelService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbUserLevelService.save(tbUserLevel);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 用户级别列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbUserLevelEntity tbUserLevel, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbUserLevel.getId())) {
			tbUserLevel = tbUserLevelService.getEntity(TbUserLevelEntity.class, tbUserLevel.getId());
			req.setAttribute("tbUserLevelPage", tbUserLevel);
		}
		return new ModelAndView("jeecg/test/orders/tbUserLevel");
	}
}
