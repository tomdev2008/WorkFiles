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

import jeecg.kxcomm.entity.hrm.TbDepartEntity;
import jeecg.kxcomm.service.hrm.TbDepartServiceI;

/**   
 * @Title: Controller
 * @Description:  部门表
 * @author zhangdaihao
 * @date 2013-07-22 16:32:00
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbDepartController")
public class TbDepartController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbDepartController.class);

	@Autowired
	private TbDepartServiceI tbDepartService;
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
	 *  部门表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbDepart")
	public ModelAndView tbDepart(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/hrm/tbDepartList");
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
	public void datagrid(TbDepartEntity tbDepart,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbDepartEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbDepart);
		this.tbDepartService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除 部门表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbDepartEntity tbDepart, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbDepart = systemService.getEntity(TbDepartEntity.class, tbDepart.getId());
		message = "删除成功";
		tbDepartService.delete(tbDepart);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加 部门表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbDepartEntity tbDepart, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbDepart.getId())) {
			message = "更新成功";
			TbDepartEntity t = tbDepartService.get(TbDepartEntity.class, tbDepart.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbDepart, t);
				tbDepartService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbDepartService.save(tbDepart);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 *  部门表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbDepartEntity tbDepart, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbDepart.getId())) {
			tbDepart = tbDepartService.getEntity(TbDepartEntity.class, tbDepart.getId());
			req.setAttribute("tbDepartPage", tbDepart);
		}
		return new ModelAndView("jeecg/kxcomm/hrm/tbDepart");
	}
}
