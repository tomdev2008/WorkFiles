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

import jeecg.kxcomm.entity.systemmanager.TbContractDocTypeEntity;
import jeecg.kxcomm.service.systemmanager.TbContractDocTypeServiceI;

/**   
 * @Title: Controller
 * @Description: 合同文件类型
 * @author zhangdaihao
 * @date 2013-10-14 18:09:49
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContractDocTypeController")
public class TbContractDocTypeController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractDocTypeController.class);

	@Autowired
	private TbContractDocTypeServiceI tbContractDocTypeService;
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
	 * 合同文件类型列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContractDocType")
	public ModelAndView tbContractDocType(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractDocTypeList");
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
	public void datagrid(TbContractDocTypeEntity tbContractDocType,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbContractDocTypeEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContractDocType);
		this.tbContractDocTypeService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除合同文件类型
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContractDocTypeEntity tbContractDocType, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbContractDocType = systemService.getEntity(TbContractDocTypeEntity.class, tbContractDocType.getId());
		message = "删除成功";
		tbContractDocTypeService.delete(tbContractDocType);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加合同文件类型
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContractDocTypeEntity tbContractDocType, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbContractDocType.getId())) {
			message = "更新成功";
			TbContractDocTypeEntity t = tbContractDocTypeService.get(TbContractDocTypeEntity.class, tbContractDocType.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbContractDocType, t);
				tbContractDocTypeService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbContractDocTypeService.save(tbContractDocType);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 合同文件类型列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContractDocTypeEntity tbContractDocType, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbContractDocType.getId())) {
			tbContractDocType = tbContractDocTypeService.getEntity(TbContractDocTypeEntity.class, tbContractDocType.getId());
			req.setAttribute("tbContractDocTypePage", tbContractDocType);
		}
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractDocType");
	}
}
