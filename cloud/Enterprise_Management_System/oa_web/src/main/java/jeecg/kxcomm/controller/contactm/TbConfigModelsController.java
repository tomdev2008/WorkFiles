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

import jeecg.kxcomm.entity.contactm.TbConfigModelsEntity;
import jeecg.kxcomm.service.contactm.TbConfigModelsServiceI;

/**   
 * @Title: Controller
 * @Description: 机型配置
 * @author zhangdaihao
 * @date 2013-08-19 16:17:00
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbConfigModelsController")
public class TbConfigModelsController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbConfigModelsController.class);

	@Autowired
	private TbConfigModelsServiceI tbConfigModelsService;
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
	 * 机型配置列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbConfigModels")
	public ModelAndView tbConfigModels(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbConfigModelsList");
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
	public void datagrid(TbConfigModelsEntity tbConfigModels,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbConfigModelsEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbConfigModels);
		this.tbConfigModelsService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除机型配置
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbConfigModelsEntity tbConfigModels, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbConfigModels = systemService.getEntity(TbConfigModelsEntity.class, tbConfigModels.getId());
		message = "删除成功";
		tbConfigModelsService.delete(tbConfigModels);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加机型配置
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbConfigModelsEntity tbConfigModels, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbConfigModels.getId())) {
			message = "更新成功";
			TbConfigModelsEntity t = tbConfigModelsService.get(TbConfigModelsEntity.class, tbConfigModels.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbConfigModels, t);
				tbConfigModelsService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbConfigModelsService.save(tbConfigModels);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 机型配置列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbConfigModelsEntity tbConfigModels, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbConfigModels.getId())) {
			tbConfigModels = tbConfigModelsService.getEntity(TbConfigModelsEntity.class, tbConfigModels.getId());
			req.setAttribute("tbConfigModelsPage", tbConfigModels);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbConfigModels");
	}
}
