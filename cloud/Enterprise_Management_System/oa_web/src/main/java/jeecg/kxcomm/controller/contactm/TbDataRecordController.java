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

import jeecg.kxcomm.entity.contactm.TbDataRecordEntity;
import jeecg.kxcomm.service.contactm.TbDataRecordServiceI;

/**   
 * @Title: Controller
 * @Description: 数据源详情
 * @author zhangdaihao
 * @date 2013-08-19 10:30:15
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbDataRecordController")
public class TbDataRecordController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbDataRecordController.class);

	@Autowired
	private TbDataRecordServiceI tbDataRecordService;
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
	 * 数据源详情列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbDataRecord")
	public ModelAndView tbDataRecord(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbDataRecordList");
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
	public void datagrid(TbDataRecordEntity tbDataRecord,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbDataRecordEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbDataRecord);
		this.tbDataRecordService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除数据源详情
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbDataRecordEntity tbDataRecord, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbDataRecord = systemService.getEntity(TbDataRecordEntity.class, tbDataRecord.getId());
		message = "删除成功";
		tbDataRecordService.delete(tbDataRecord);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加数据源详情
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbDataRecordEntity tbDataRecord, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbDataRecord.getId())) {
			message = "更新成功";
			TbDataRecordEntity t = tbDataRecordService.get(TbDataRecordEntity.class, tbDataRecord.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbDataRecord, t);
				tbDataRecordService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbDataRecordService.save(tbDataRecord);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 数据源详情列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbDataRecordEntity tbDataRecord, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbDataRecord.getId())) {
			tbDataRecord = tbDataRecordService.getEntity(TbDataRecordEntity.class, tbDataRecord.getId());
			req.setAttribute("tbDataRecordPage", tbDataRecord);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbDataRecord");
	}
}
