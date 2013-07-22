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

import jeecg.kxcomm.entity.hrm.TbPostEntity;
import jeecg.kxcomm.service.hrm.TbPostServiceI;

/**   
 * @Title: Controller
 * @Description: 岗位表
 * @author zhangdaihao
 * @date 2013-07-22 16:32:42
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbPostController")
public class TbPostController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbPostController.class);

	@Autowired
	private TbPostServiceI tbPostService;
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
	 * 岗位表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbPost")
	public ModelAndView tbPost(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/hrm/tbPostList");
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
	public void datagrid(TbPostEntity tbPost,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbPostEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbPost);
		this.tbPostService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除岗位表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbPostEntity tbPost, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbPost = systemService.getEntity(TbPostEntity.class, tbPost.getId());
		message = "删除成功";
		tbPostService.delete(tbPost);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加岗位表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbPostEntity tbPost, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbPost.getId())) {
			message = "更新成功";
			TbPostEntity t = tbPostService.get(TbPostEntity.class, tbPost.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbPost, t);
				tbPostService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbPostService.save(tbPost);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 岗位表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbPostEntity tbPost, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbPost.getId())) {
			tbPost = tbPostService.getEntity(TbPostEntity.class, tbPost.getId());
			req.setAttribute("tbPostPage", tbPost);
		}
		return new ModelAndView("jeecg/kxcomm/hrm/tbPost");
	}
}
