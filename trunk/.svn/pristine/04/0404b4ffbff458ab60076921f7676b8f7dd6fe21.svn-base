package jeecg.kxcomm.controller.contactm;
import java.util.Date;
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
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import jeecg.system.pojo.base.TSDepart;
import jeecg.system.pojo.base.TSUser;
import jeecg.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import jeecg.kxcomm.entity.contactm.TbCustomerEntityEntity;
import jeecg.kxcomm.entity.contactm.TbProjectEntityEntity;
import jeecg.kxcomm.service.contactm.TbProjectEntityServiceI;

/**   
 * @Title: Controller
 * @Description: 项目
 * @author zhangdaihao
 * @date 2013-08-14 16:16:59
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbProjectEntityController")
public class TbProjectEntityController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbProjectEntityController.class);

	@Autowired
	private TbProjectEntityServiceI tbProjectEntityService;
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
	 * 项目列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbProjectEntity")
	public ModelAndView tbProjectEntity(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbProjectEntityList");
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
	public void datagrid(TbProjectEntityEntity tbProjectEntity,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbProjectEntityEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbProjectEntity);
		this.tbProjectEntityService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除项目
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbProjectEntityEntity tbProjectEntity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbProjectEntity = systemService.getEntity(TbProjectEntityEntity.class, tbProjectEntity.getId());
		message = "删除成功";
		tbProjectEntityService.delete(tbProjectEntity);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加项目
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbProjectEntityEntity tbProjectEntity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		TSUser user = ResourceUtil.getSessionUserName();
		if (StringUtil.isNotEmpty(tbProjectEntity.getId())) {
			message = "更新成功";
			TbProjectEntityEntity t = tbProjectEntityService.get(TbProjectEntityEntity.class, tbProjectEntity.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbProjectEntity, t);
				tbProjectEntityService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbProjectEntity.setCreateTime(new Date());
			tbProjectEntity.setUserId(user.getId());
			tbProjectEntityService.save(tbProjectEntity);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 项目列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbProjectEntityEntity tbProjectEntity, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbProjectEntity.getId())) {
			tbProjectEntity = tbProjectEntityService.getEntity(TbProjectEntityEntity.class, tbProjectEntity.getId());
			req.setAttribute("tbProjectEntityPage", tbProjectEntity);
		}
		List<TbCustomerEntityEntity> tbCustomerList=systemService.getList(TbCustomerEntityEntity.class);
		req.setAttribute("tbCustomerList", tbCustomerList);
		return new ModelAndView("jeecg/kxcomm/contactm/tbProjectEntity");
	}
}
