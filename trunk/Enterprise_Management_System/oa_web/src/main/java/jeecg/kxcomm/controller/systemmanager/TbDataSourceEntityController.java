package jeecg.kxcomm.controller.systemmanager;
import java.util.Date;
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

import jeecg.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import jeecg.kxcomm.entity.systemmanager.TbDataSourceEntityEntity;
import jeecg.kxcomm.entity.systemmanager.TbDataSourceTypeEntity;
import jeecg.kxcomm.service.systemmanager.TbDataSourceEntityServiceI;
import jeecg.kxcomm.vo.systemmanager.DataBean;

/**   
 * @Title: Controller
 * @Description: 数据源
 * @author zhangdaihao
 * @date 2013-10-15 13:40:51
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbDataSourceEntityController")
public class TbDataSourceEntityController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbDataSourceEntityController.class);

	@Autowired
	private TbDataSourceEntityServiceI tbDataSourceEntityService;
	
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
	 * 数据源列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbDataSourceEntity")
	public ModelAndView tbDataSourceEntity(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbDataSourceEntityList");
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
	public void datagrid(TbDataSourceEntityEntity tbDataSourceEntity,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbDataSourceEntityEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbDataSourceEntity);
		this.tbDataSourceEntityService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除数据源
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbDataSourceEntityEntity tbDataSourceEntity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbDataSourceEntity = systemService.getEntity(TbDataSourceEntityEntity.class, tbDataSourceEntity.getId());
		message = "删除成功";
		tbDataSourceEntityService.delete(tbDataSourceEntity);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加数据源
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbDataSourceEntityEntity tbDataSourceEntity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbDataSourceEntity.getId())) {
			message = "更新成功";
			TbDataSourceEntityEntity t = tbDataSourceEntityService.get(TbDataSourceEntityEntity.class, tbDataSourceEntity.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbDataSourceEntity, t);
				tbDataSourceEntityService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			String typeId = request.getParameter("typeId");
			TbDataSourceTypeEntity t = systemService.get(TbDataSourceTypeEntity.class, typeId);
			tbDataSourceEntity.setTbDataSourceType(t);
			tbDataSourceEntity.setCreatetime(new Date());
			message = "添加成功";
			tbDataSourceEntityService.save(tbDataSourceEntity);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 数据源列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbDataSourceEntityEntity tbDataSourceEntity, HttpServletRequest req) {
		List<TbDataSourceTypeEntity> typeList = systemService.getList(TbDataSourceTypeEntity.class);
		req.setAttribute("typeList", typeList);
		if (StringUtil.isNotEmpty(tbDataSourceEntity.getId())) {
			tbDataSourceEntity = tbDataSourceEntityService.getEntity(TbDataSourceEntityEntity.class, tbDataSourceEntity.getId());
			req.setAttribute("tbDataSourceEntityPage", tbDataSourceEntity);
		}
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbDataSourceEntity");
	}
	
	@RequestMapping(params = "dataSourceDetail")
	public ModelAndView dataSourceDetail(HttpServletRequest req) {
		String id = req.getParameter("id");
		req.setAttribute("id", id);
		
		List<DataBean> volist = tbDataSourceEntityService.listDetailDataRecord(id);
		req.setAttribute("volist", volist);
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbDataRecordEntityList");
	} 
}
