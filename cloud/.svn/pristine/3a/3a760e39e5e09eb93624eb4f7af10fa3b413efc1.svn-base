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

import jeecg.kxcomm.entity.contactm.TbConfigModelDataEntity;
import jeecg.kxcomm.service.contactm.TbConfigModelDataServiceI;

/**   
 * @Title: Controller
 * @Description: 配置单
 * @author zhangdaihao
 * @date 2013-09-16 14:47:59
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbConfigModelDataController")
public class TbConfigModelDataController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbConfigModelDataController.class);

	@Autowired
	private TbConfigModelDataServiceI tbConfigModelDataService;
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
	 * 配置单列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbConfigModelData")
	public ModelAndView tbConfigModelData(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbConfigModelDataList");
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
	public void datagrid(TbConfigModelDataEntity tbConfigModelData,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbConfigModelDataEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbConfigModelData);
		this.tbConfigModelDataService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除配置单
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbConfigModelDataEntity tbConfigModelData, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbConfigModelData = systemService.getEntity(TbConfigModelDataEntity.class, tbConfigModelData.getId());
		message = "删除成功";
		tbConfigModelDataService.delete(tbConfigModelData);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加配置单
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbConfigModelDataEntity tbConfigModelData, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbConfigModelData.getId())) {
			message = "更新成功";
			TbConfigModelDataEntity t = tbConfigModelDataService.get(TbConfigModelDataEntity.class, tbConfigModelData.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbConfigModelData, t);
				tbConfigModelDataService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbConfigModelDataService.save(tbConfigModelData);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 配置单列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbConfigModelDataEntity tbConfigModelData, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbConfigModelData.getId())) {
			tbConfigModelData = tbConfigModelDataService.getEntity(TbConfigModelDataEntity.class, tbConfigModelData.getId());
			req.setAttribute("tbConfigModelDataPage", tbConfigModelData);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbConfigModelData");
	}
}
