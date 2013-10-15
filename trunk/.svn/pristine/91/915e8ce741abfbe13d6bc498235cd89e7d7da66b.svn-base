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

import jeecg.kxcomm.entity.systemmanager.TbContactTemplatesDocTypeRelationshipEntity;
import jeecg.kxcomm.service.systemmanager.TbContactTemplatesDocTypeRelationshipServiceI;

/**   
 * @Title: Controller
 * @Description: 合同模版文件与文件类型多对多关联表
 * @author zhangdaihao
 * @date 2013-10-14 18:29:26
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContactTemplatesDocTypeRelationshipController")
public class TbContactTemplatesDocTypeRelationshipController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContactTemplatesDocTypeRelationshipController.class);

	@Autowired
	private TbContactTemplatesDocTypeRelationshipServiceI tbContactTemplatesDocTypeRelationshipService;
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
	 * 合同模版文件与文件类型多对多关联表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContactTemplatesDocTypeRelationship")
	public ModelAndView tbContactTemplatesDocTypeRelationship(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContactTemplatesDocTypeRelationshipList");
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
	public void datagrid(TbContactTemplatesDocTypeRelationshipEntity tbContactTemplatesDocTypeRelationship,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbContactTemplatesDocTypeRelationshipEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContactTemplatesDocTypeRelationship);
		this.tbContactTemplatesDocTypeRelationshipService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除合同模版文件与文件类型多对多关联表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContactTemplatesDocTypeRelationshipEntity tbContactTemplatesDocTypeRelationship, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbContactTemplatesDocTypeRelationship = systemService.getEntity(TbContactTemplatesDocTypeRelationshipEntity.class, tbContactTemplatesDocTypeRelationship.getId());
		message = "删除成功";
		tbContactTemplatesDocTypeRelationshipService.delete(tbContactTemplatesDocTypeRelationship);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加合同模版文件与文件类型多对多关联表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContactTemplatesDocTypeRelationshipEntity tbContactTemplatesDocTypeRelationship, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbContactTemplatesDocTypeRelationship.getId())) {
			message = "更新成功";
			TbContactTemplatesDocTypeRelationshipEntity t = tbContactTemplatesDocTypeRelationshipService.get(TbContactTemplatesDocTypeRelationshipEntity.class, tbContactTemplatesDocTypeRelationship.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbContactTemplatesDocTypeRelationship, t);
				tbContactTemplatesDocTypeRelationshipService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbContactTemplatesDocTypeRelationshipService.save(tbContactTemplatesDocTypeRelationship);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 合同模版文件与文件类型多对多关联表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContactTemplatesDocTypeRelationshipEntity tbContactTemplatesDocTypeRelationship, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbContactTemplatesDocTypeRelationship.getId())) {
			tbContactTemplatesDocTypeRelationship = tbContactTemplatesDocTypeRelationshipService.getEntity(TbContactTemplatesDocTypeRelationshipEntity.class, tbContactTemplatesDocTypeRelationship.getId());
			req.setAttribute("tbContactTemplatesDocTypeRelationshipPage", tbContactTemplatesDocTypeRelationship);
		}
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContactTemplatesDocTypeRelationship");
	}
}
