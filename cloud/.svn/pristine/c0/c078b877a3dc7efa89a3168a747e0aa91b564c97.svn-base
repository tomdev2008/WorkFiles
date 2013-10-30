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

import jeecg.kxcomm.entity.contactm.TbContractTemporaryEntity;
import jeecg.kxcomm.service.contactm.TbContractTemporaryServiceI;

/**   
 * @Title: Controller
 * @Description: 临时合同
 * @author zhangdaihao
 * @date 2013-09-13 14:12:00
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContractTemporaryController")
public class TbContractTemporaryController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractTemporaryController.class);

	@Autowired
	private TbContractTemporaryServiceI tbContractTemporaryService;
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
	 * 临时合同列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContractTemporary")
	public ModelAndView tbContractTemporary(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbContractTemporaryList");
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
	public void datagrid(TbContractTemporaryEntity tbContractTemporary,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbContractTemporaryEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContractTemporary);
		this.tbContractTemporaryService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除临时合同
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContractTemporaryEntity tbContractTemporary, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbContractTemporary = systemService.getEntity(TbContractTemporaryEntity.class, tbContractTemporary.getId());
		message = "删除成功";
		tbContractTemporaryService.delete(tbContractTemporary);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加临时合同
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContractTemporaryEntity tbContractTemporary, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbContractTemporary.getId())) {
			message = "更新成功";
			TbContractTemporaryEntity t = tbContractTemporaryService.get(TbContractTemporaryEntity.class, tbContractTemporary.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbContractTemporary, t);
				tbContractTemporaryService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbContractTemporaryService.save(tbContractTemporary);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 临时合同列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContractTemporaryEntity tbContractTemporary, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbContractTemporary.getId())) {
			tbContractTemporary = tbContractTemporaryService.getEntity(TbContractTemporaryEntity.class, tbContractTemporary.getId());
			req.setAttribute("tbContractTemporaryPage", tbContractTemporary);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbContractTemporary");
	}
}
