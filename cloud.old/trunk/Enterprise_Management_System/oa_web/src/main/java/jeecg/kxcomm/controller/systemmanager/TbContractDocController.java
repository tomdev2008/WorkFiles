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

import jeecg.kxcomm.entity.systemmanager.TbContractDocEntity;
import jeecg.kxcomm.service.systemmanager.TbContractDocServiceI;

/**   
 * @Title: Controller
 * @Description: 合同文件
 * @author zhangdaihao
 * @date 2013-10-14 18:34:56
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContractDocController")
public class TbContractDocController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractDocController.class);

	@Autowired
	private TbContractDocServiceI tbContractDocService;
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
	 * 合同文件列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContractDoc")
	public ModelAndView tbContractDoc(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractDocList");
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
	public void datagrid(TbContractDocEntity tbContractDoc,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbContractDocEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContractDoc);
		this.tbContractDocService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除合同文件
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContractDocEntity tbContractDoc, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbContractDoc = systemService.getEntity(TbContractDocEntity.class, tbContractDoc.getId());
		message = "删除成功";
		tbContractDocService.delete(tbContractDoc);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加合同文件
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContractDocEntity tbContractDoc, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbContractDoc.getId())) {
			message = "更新成功";
			TbContractDocEntity t = tbContractDocService.get(TbContractDocEntity.class, tbContractDoc.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbContractDoc, t);
				tbContractDocService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbContractDocService.save(tbContractDoc);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 合同文件列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContractDocEntity tbContractDoc, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbContractDoc.getId())) {
			tbContractDoc = tbContractDocService.getEntity(TbContractDocEntity.class, tbContractDoc.getId());
			req.setAttribute("tbContractDocPage", tbContractDoc);
		}
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractDoc");
	}
}
