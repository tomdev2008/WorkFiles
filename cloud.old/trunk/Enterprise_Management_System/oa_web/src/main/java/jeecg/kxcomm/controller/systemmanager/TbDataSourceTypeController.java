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

import jeecg.kxcomm.entity.systemmanager.TbDataSourceTypeEntity;
import jeecg.kxcomm.service.systemmanager.TbDataSourceTypeServiceI;

/**   
 * @Title: Controller
 * @Description: 数据源分类
 * @author zhangdaihao
 * @date 2013-10-14 15:32:04
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbDataSourceTypeController")
public class TbDataSourceTypeController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbDataSourceTypeController.class);

	@Autowired
	private TbDataSourceTypeServiceI tbDataSourceTypeService;
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
	 * 数据源分类列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbDataSourceType")
	public ModelAndView tbDataSourceType(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbDataSourceTypeList");
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
	public void datagrid(TbDataSourceTypeEntity tbDataSourceType,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbDataSourceTypeEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbDataSourceType);
		this.tbDataSourceTypeService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除数据源分类
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbDataSourceTypeEntity tbDataSourceType, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbDataSourceType = systemService.getEntity(TbDataSourceTypeEntity.class, tbDataSourceType.getId());
		message = "删除成功";
		tbDataSourceTypeService.delete(tbDataSourceType);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加数据源分类
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbDataSourceTypeEntity tbDataSourceType, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbDataSourceType.getId())) {
			message = "更新成功";
			TbDataSourceTypeEntity t = tbDataSourceTypeService.get(TbDataSourceTypeEntity.class, tbDataSourceType.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbDataSourceType, t);
				tbDataSourceTypeService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbDataSourceTypeService.save(tbDataSourceType);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 数据源分类列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbDataSourceTypeEntity tbDataSourceType, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbDataSourceType.getId())) {
			tbDataSourceType = tbDataSourceTypeService.getEntity(TbDataSourceTypeEntity.class, tbDataSourceType.getId());
			req.setAttribute("tbDataSourceTypePage", tbDataSourceType);
		}
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbDataSourceType");
	}
}
