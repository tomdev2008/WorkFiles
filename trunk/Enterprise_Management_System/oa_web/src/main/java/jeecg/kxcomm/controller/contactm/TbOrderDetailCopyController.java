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

import jeecg.kxcomm.entity.contactm.TbOrderDetailCopyEntity;
import jeecg.kxcomm.service.contactm.TbOrderDetailCopyServiceI;

/**   
 * @Title: Controller
 * @Description: 销售订单明细
 * @author zhangdaihao
 * @date 2013-09-24 16:49:35
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbOrderDetailCopyController")
public class TbOrderDetailCopyController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbOrderDetailCopyController.class);

	@Autowired
	private TbOrderDetailCopyServiceI tbOrderDetailCopyService;
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
	 * 销售订单明细列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbOrderDetailCopy")
	public ModelAndView tbOrderDetailCopy(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbOrderDetailCopyList");
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
	public void datagrid(TbOrderDetailCopyEntity tbOrderDetailCopy,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbOrderDetailCopyEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbOrderDetailCopy);
		this.tbOrderDetailCopyService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除销售订单明细
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbOrderDetailCopyEntity tbOrderDetailCopy, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbOrderDetailCopy = systemService.getEntity(TbOrderDetailCopyEntity.class, tbOrderDetailCopy.getId());
		message = "删除成功";
		tbOrderDetailCopyService.delete(tbOrderDetailCopy);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加销售订单明细
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbOrderDetailCopyEntity tbOrderDetailCopy, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbOrderDetailCopy.getId())) {
			message = "更新成功";
			TbOrderDetailCopyEntity t = tbOrderDetailCopyService.get(TbOrderDetailCopyEntity.class, tbOrderDetailCopy.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbOrderDetailCopy, t);
				tbOrderDetailCopyService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbOrderDetailCopyService.save(tbOrderDetailCopy);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 销售订单明细列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbOrderDetailCopyEntity tbOrderDetailCopy, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbOrderDetailCopy.getId())) {
			tbOrderDetailCopy = tbOrderDetailCopyService.getEntity(TbOrderDetailCopyEntity.class, tbOrderDetailCopy.getId());
			req.setAttribute("tbOrderDetailCopyPage", tbOrderDetailCopy);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbOrderDetailCopy");
	}
}
