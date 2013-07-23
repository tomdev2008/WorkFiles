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

import jeecg.kxcomm.entity.hrm.TbOrgenEntity;
import jeecg.kxcomm.service.hrm.TbOrgenServiceI;

/**   
 * @Title: Controller
 * @Description: 机构表
 * @author zhangdaihao
 * @date 2013-07-23 14:50:12
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbOrgenController")
public class TbOrgenController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbOrgenController.class);

	@Autowired
	private TbOrgenServiceI tbOrgenService;
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
	 * 机构表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbOrgen")
	public ModelAndView tbOrgen(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/hrm/tbOrgenList");
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
	public void datagrid(TbOrgenEntity tbOrgen,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbOrgenEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbOrgen);
		this.tbOrgenService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除机构表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbOrgenEntity tbOrgen, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbOrgen = systemService.getEntity(TbOrgenEntity.class, tbOrgen.getId());
		message = "删除成功";
		tbOrgenService.delete(tbOrgen);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加机构表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbOrgenEntity tbOrgen, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbOrgen.getId())) {
			message = "更新成功";
			TbOrgenEntity t = tbOrgenService.get(TbOrgenEntity.class, tbOrgen.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbOrgen, t);
				tbOrgenService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbOrgenService.save(tbOrgen);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 机构表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbOrgenEntity tbOrgen, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbOrgen.getId())) {
			tbOrgen = tbOrgenService.getEntity(TbOrgenEntity.class, tbOrgen.getId());
			req.setAttribute("tbOrgenPage", tbOrgen);
		}
		return new ModelAndView("jeecg/kxcomm/hrm/tbOrgen");
	}
}
