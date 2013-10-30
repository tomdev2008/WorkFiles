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

import jeecg.kxcomm.entity.systemmanager.TbCityEntity;
import jeecg.kxcomm.service.systemmanager.TbCityServiceI;

/**   
 * @Title: Controller
 * @Description: 区域\地势管理
 * @author zhangdaihao
 * @date 2013-10-17 11:16:33
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbCityController")
public class TbCityController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbCityController.class);

	@Autowired
	private TbCityServiceI tbCityService;
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
	 * 区域\地势管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbCity")
	public ModelAndView tbCity(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbCityList");
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
	public void datagrid(TbCityEntity tbCity,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbCityEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbCity);
		this.tbCityService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除区域\地势管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbCityEntity tbCity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbCity = systemService.getEntity(TbCityEntity.class, tbCity.getId());
		message = "删除成功";
		tbCityService.delete(tbCity);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加区域\地势管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbCityEntity tbCity, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbCity.getId())) {
			message = "更新成功";
			TbCityEntity t = tbCityService.get(TbCityEntity.class, tbCity.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbCity, t);
				tbCityService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbCityService.save(tbCity);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 区域\地势管理列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbCityEntity tbCity, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbCity.getId())) {
			tbCity = tbCityService.getEntity(TbCityEntity.class, tbCity.getId());
			req.setAttribute("tbCityPage", tbCity);
		}
		List<TbCityEntity> cityList = systemService.findByProperty(TbCityEntity.class,"cityType","1");
		TbCityEntity cityEntity = new TbCityEntity();
		cityEntity.setId("0");
		cityEntity.setName("无");
		cityList.add(0,cityEntity);
		req.setAttribute("cityList",cityList);
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbCity");
	}
}
