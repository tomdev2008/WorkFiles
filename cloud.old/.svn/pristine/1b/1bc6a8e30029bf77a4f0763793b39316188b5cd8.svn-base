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

import jeecg.kxcomm.entity.contactm.TbCustomerEntityEntity;
import jeecg.kxcomm.service.contactm.TbCustomerEntityServiceI;

/**   
 * @Title: Controller
 * @Description: 客户
 * @author zhangdaihao
 * @date 2013-08-14 16:22:35
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbCustomerEntityController")
public class TbCustomerEntityController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbCustomerEntityController.class);

	@Autowired
	private TbCustomerEntityServiceI tbCustomerEntityService;
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
	 * 客户列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbCustomerEntity")
	public ModelAndView tbCustomerEntity(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbCustomerEntityList");
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
	public void datagrid(TbCustomerEntityEntity tbCustomerEntity,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbCustomerEntityEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbCustomerEntity);
		this.tbCustomerEntityService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除客户
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbCustomerEntityEntity tbCustomerEntity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbCustomerEntity = systemService.getEntity(TbCustomerEntityEntity.class, tbCustomerEntity.getId());
		message = "删除成功";
		tbCustomerEntityService.delete(tbCustomerEntity);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加客户
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbCustomerEntityEntity tbCustomerEntity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbCustomerEntity.getId())) {
			message = "更新成功";
			TbCustomerEntityEntity t = tbCustomerEntityService.get(TbCustomerEntityEntity.class, tbCustomerEntity.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbCustomerEntity, t);
				tbCustomerEntityService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbCustomerEntityService.save(tbCustomerEntity);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 客户列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbCustomerEntityEntity tbCustomerEntity, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbCustomerEntity.getId())) {
			tbCustomerEntity = tbCustomerEntityService.getEntity(TbCustomerEntityEntity.class, tbCustomerEntity.getId());
			req.setAttribute("tbCustomerEntityPage", tbCustomerEntity);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbCustomerEntity");
	}
}
