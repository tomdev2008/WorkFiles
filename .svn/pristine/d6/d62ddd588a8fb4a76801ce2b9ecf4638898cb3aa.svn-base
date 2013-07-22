package jeecg.kxcomm.controller.hrm;
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

import jeecg.kxcomm.entity.hrm.TbPermanentAssetsEntity;
import jeecg.kxcomm.service.hrm.TbPermanentAssetsServiceI;

/**   
 * @Title: Controller
 * @Description: 固定资产表
 * @author zhangdaihao
 * @date 2013-07-22 16:35:34
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbPermanentAssetsController")
public class TbPermanentAssetsController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbPermanentAssetsController.class);

	@Autowired
	private TbPermanentAssetsServiceI tbPermanentAssetsService;
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
	 * 固定资产表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbPermanentAssets")
	public ModelAndView tbPermanentAssets(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/hrm/tbPermanentAssetsList");
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
	public void datagrid(TbPermanentAssetsEntity tbPermanentAssets,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbPermanentAssetsEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbPermanentAssets);
		this.tbPermanentAssetsService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除固定资产表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbPermanentAssetsEntity tbPermanentAssets, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbPermanentAssets = systemService.getEntity(TbPermanentAssetsEntity.class, tbPermanentAssets.getId());
		message = "删除成功";
		tbPermanentAssetsService.delete(tbPermanentAssets);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加固定资产表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbPermanentAssetsEntity tbPermanentAssets, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbPermanentAssets.getId())) {
			message = "更新成功";
			TbPermanentAssetsEntity t = tbPermanentAssetsService.get(TbPermanentAssetsEntity.class, tbPermanentAssets.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbPermanentAssets, t);
				tbPermanentAssetsService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbPermanentAssetsService.save(tbPermanentAssets);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 固定资产表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbPermanentAssetsEntity tbPermanentAssets, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbPermanentAssets.getId())) {
			tbPermanentAssets = tbPermanentAssetsService.getEntity(TbPermanentAssetsEntity.class, tbPermanentAssets.getId());
			req.setAttribute("tbPermanentAssetsPage", tbPermanentAssets);
		}
		return new ModelAndView("jeecg/kxcomm/hrm/tbPermanentAssets");
	}
}
