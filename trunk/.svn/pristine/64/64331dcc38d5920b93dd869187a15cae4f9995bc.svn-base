package jeecg.kxcomm.controller.contactm;
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

import jeecg.kxcomm.entity.contactm.TbDataSourceEntity;
import jeecg.kxcomm.service.contactm.TbDataSourceServiceI;

/**   
 * @Title: Controller
 * @Description: 数据源
 * @author zhangdaihao
 * @date 2013-08-19 10:28:51
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbDataSourceController")
public class TbDataSourceController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbDataSourceController.class);

	@Autowired
	private TbDataSourceServiceI tbDataSourceService;
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
	 * 数据源列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbDataSource")
	public ModelAndView tbDataSource(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbDataSourceList");
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
	public void datagrid(TbDataSourceEntity tbDataSource,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbDataSourceEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbDataSource);
		this.tbDataSourceService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除数据源
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbDataSourceEntity tbDataSource, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbDataSource = systemService.getEntity(TbDataSourceEntity.class, tbDataSource.getId());
		message = "删除成功";
		tbDataSourceService.delete(tbDataSource);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加数据源
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbDataSourceEntity tbDataSource, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbDataSource.getId())) {
			message = "更新成功";
			TbDataSourceEntity t = tbDataSourceService.get(TbDataSourceEntity.class, tbDataSource.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbDataSource, t);
				tbDataSourceService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbDataSourceService.save(tbDataSource);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 数据源列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbDataSourceEntity tbDataSource, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbDataSource.getId())) {
			tbDataSource = tbDataSourceService.getEntity(TbDataSourceEntity.class, tbDataSource.getId());
			req.setAttribute("tbDataSourcePage", tbDataSource);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbDataSource");
	}
}
