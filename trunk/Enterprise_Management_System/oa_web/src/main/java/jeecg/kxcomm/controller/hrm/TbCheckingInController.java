package jeecg.kxcomm.controller.hrm;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
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

import jeecg.kxcomm.entity.hrm.TbCheckingInEntity;
import jeecg.kxcomm.service.hrm.TbCheckingInServiceI;

/**   
 * @Title: Controller
 * @Description: 考勤表
 * @author zhangdaihao
 * @date 2013-07-23 14:39:49
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbCheckingInController")
public class TbCheckingInController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbCheckingInController.class);

	@Autowired
	private TbCheckingInServiceI tbCheckingInService;
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
	 * 考勤表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbCheckingIn")
	public ModelAndView tbCheckingIn(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/hrm/tbCheckingInList");
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
	public void datagrid(TbCheckingInEntity tbCheckingIn,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbCheckingInEntity.class, dataGrid);
		String ctBegin = request.getParameter("happenday_begin");
		String ctEnd = request.getParameter("happenday_end");
		String empIdId = request.getParameter("empId_id");
		System.out.println(ctBegin+"------------"+empIdId+"------------"+ctEnd);
		if(StringUtil.isNotEmpty(ctBegin)&& StringUtil.isNotEmpty(ctEnd)){
			try {
				cq.ge("time", new SimpleDateFormat("yyyy-MM-dd").parse(ctBegin));
				cq.le("time", new SimpleDateFormat("yyyy-MM-dd").parse(ctEnd));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		if(StringUtil.isNotEmpty(empIdId)) {
			cq.eq("empId.id", empIdId);
		}
		cq.add();
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbCheckingIn);
		this.tbCheckingInService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除考勤表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbCheckingInEntity tbCheckingIn, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbCheckingIn = systemService.getEntity(TbCheckingInEntity.class, tbCheckingIn.getId());
		message = "删除成功";
		tbCheckingInService.delete(tbCheckingIn);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加考勤表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbCheckingInEntity tbCheckingIn, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbCheckingIn.getId())) {
			message = "更新成功";
			TbCheckingInEntity t = tbCheckingInService.get(TbCheckingInEntity.class, tbCheckingIn.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbCheckingIn, t);
				tbCheckingInService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbCheckingInService.save(tbCheckingIn);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 考勤表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbCheckingInEntity tbCheckingIn, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbCheckingIn.getId())) {
			tbCheckingIn = tbCheckingInService.getEntity(TbCheckingInEntity.class, tbCheckingIn.getId());
			req.setAttribute("tbCheckingInPage", tbCheckingIn);
		}
		return new ModelAndView("jeecg/kxcomm/hrm/tbCheckingIn");
	}
}
