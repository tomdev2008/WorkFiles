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
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocEntity;
import jeecg.kxcomm.service.systemmanager.TbContractTemplatesDocServiceI;

/**   
 * @Title: Controller
 * @Description: 合同模板文件
 * @author zhangdaihao
 * @date 2013-10-15 11:10:19
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContractTemplatesDocController")
public class TbContractTemplatesDocController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractTemplatesDocController.class);

	@Autowired
	private TbContractTemplatesDocServiceI tbContractTemplatesDocService;
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
	 * 合同模板文件列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContractTemplatesDoc")
	public ModelAndView tbContractTemplatesDoc(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractTemplatesDocList");
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
	public void datagrid(TbContractTemplatesDocEntity tbContractTemplatesDoc,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbContractTemplatesDocEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContractTemplatesDoc);
		this.tbContractTemplatesDocService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除合同模板文件
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContractTemplatesDocEntity tbContractTemplatesDoc, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbContractTemplatesDoc = systemService.getEntity(TbContractTemplatesDocEntity.class, tbContractTemplatesDoc.getId());
		message = "删除成功";
		tbContractTemplatesDocService.delete(tbContractTemplatesDoc);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加合同模板文件
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContractTemplatesDocEntity tbContractTemplatesDoc, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbContractTemplatesDoc.getId())) {
			message = "更新成功";
			TbContractTemplatesDocEntity t = tbContractTemplatesDocService.get(TbContractTemplatesDocEntity.class, tbContractTemplatesDoc.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbContractTemplatesDoc, t);
				tbContractTemplatesDocService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbContractTemplatesDocService.save(tbContractTemplatesDoc);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 合同模板文件列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContractTemplatesDocEntity tbContractTemplatesDoc, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbContractTemplatesDoc.getId())) {
			tbContractTemplatesDoc = tbContractTemplatesDocService.getEntity(TbContractTemplatesDocEntity.class, tbContractTemplatesDoc.getId());
			req.setAttribute("tbContractTemplatesDocPage", tbContractTemplatesDoc);
		}
		//获取合同文件类型的集合
		List<TbContractDocTypeEntity> docTyleList=systemService.getList(TbContractDocTypeEntity.class);
		req.setAttribute("docTyleList", docTyleList);
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractTemplatesDoc");
	}
}
