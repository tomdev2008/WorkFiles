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

import jeecg.kxcomm.entity.contactm.TbQuotationsDataEntity;
import jeecg.kxcomm.service.contactm.TbQuotationsDataServiceI;

/**   
 * @Title: Controller
 * @Description: 报价总表
 * @author zhangdaihao
 * @date 2013-10-24 10:18:53
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbQuotationsDataController")
public class TbQuotationsDataController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbQuotationsDataController.class);

	@Autowired
	private TbQuotationsDataServiceI tbQuotationsDataService;
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
	 * 报价总表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbQuotationsData")
	public ModelAndView tbQuotationsData(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbQuotationsDataList");
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
	public void datagrid(TbQuotationsDataEntity tbQuotationsData,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbQuotationsDataEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbQuotationsData);
		this.tbQuotationsDataService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除报价总表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbQuotationsDataEntity tbQuotationsData, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbQuotationsData = systemService.getEntity(TbQuotationsDataEntity.class, tbQuotationsData.getId());
		message = "删除成功";
		tbQuotationsDataService.delete(tbQuotationsData);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加报价总表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbQuotationsDataEntity tbQuotationsData, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbQuotationsData.getId())) {
			message = "更新成功";
			TbQuotationsDataEntity t = tbQuotationsDataService.get(TbQuotationsDataEntity.class, tbQuotationsData.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbQuotationsData, t);
				tbQuotationsDataService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbQuotationsDataService.save(tbQuotationsData);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 报价总表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbQuotationsDataEntity tbQuotationsData, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbQuotationsData.getId())) {
			tbQuotationsData = tbQuotationsDataService.getEntity(TbQuotationsDataEntity.class, tbQuotationsData.getId());
			req.setAttribute("tbQuotationsDataPage", tbQuotationsData);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbQuotationsData");
	}
}
