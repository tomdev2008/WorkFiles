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

import jeecg.kxcomm.entity.hrm.TbCheckingInstanceEntity;
import jeecg.kxcomm.service.hrm.TbCheckingInstanceServiceI;

/**   
 * @Title: Controller
 * @Description: 考勤统计表
 * @author zhangdaihao
 * @date 2013-07-23 14:59:53
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbCheckingInstanceController")
public class TbCheckingInstanceController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbCheckingInstanceController.class);

	@Autowired
	private TbCheckingInstanceServiceI tbCheckingInstanceService;
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
	 * 考勤统计表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbCheckingInstance")
	public ModelAndView tbCheckingInstance(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/hrm/tbCheckingInstanceList");
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
	public void datagrid(TbCheckingInstanceEntity tbCheckingInstance,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbCheckingInstanceEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbCheckingInstance);
		this.tbCheckingInstanceService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除考勤统计表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbCheckingInstanceEntity tbCheckingInstance, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbCheckingInstance = systemService.getEntity(TbCheckingInstanceEntity.class, tbCheckingInstance.getId());
		message = "删除成功";
		tbCheckingInstanceService.delete(tbCheckingInstance);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加考勤统计表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbCheckingInstanceEntity tbCheckingInstance, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbCheckingInstance.getId())) {
			message = "更新成功";
			TbCheckingInstanceEntity t = tbCheckingInstanceService.get(TbCheckingInstanceEntity.class, tbCheckingInstance.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbCheckingInstance, t);
				tbCheckingInstanceService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbCheckingInstanceService.save(tbCheckingInstance);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 考勤统计表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbCheckingInstanceEntity tbCheckingInstance, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbCheckingInstance.getId())) {
			tbCheckingInstance = tbCheckingInstanceService.getEntity(TbCheckingInstanceEntity.class, tbCheckingInstance.getId());
			req.setAttribute("tbCheckingInstancePage", tbCheckingInstance);
		}
		return new ModelAndView("jeecg/kxcomm/hrm/tbCheckingInstance");
	}
}
