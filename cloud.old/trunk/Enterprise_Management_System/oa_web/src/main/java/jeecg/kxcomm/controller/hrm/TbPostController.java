package jeecg.kxcomm.controller.hrm;
import java.util.ArrayList;
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
import org.jeecgframework.core.common.model.json.ComboTree;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ExceptionUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.tag.vo.easyui.ComboTreeModel;

import jeecg.system.pojo.base.TSDepart;
import jeecg.system.pojo.base.TSFunction;
import jeecg.system.pojo.base.TSRole;
import jeecg.system.pojo.base.TSRoleFunction;
import jeecg.system.service.SystemService;

import org.jeecgframework.core.util.MyBeanUtils;

import jeecg.kxcomm.entity.hrm.TbEmployeeEntity;
import jeecg.kxcomm.entity.hrm.TbPostCityRelationshipEntity;
import jeecg.kxcomm.entity.hrm.TbPostEntity;
import jeecg.kxcomm.entity.systemmanager.TbCityEntity;
import jeecg.kxcomm.service.hrm.TbPostServiceI;

/**   
 * @Title: Controller
 * @Description: 岗位表
 * @author lizl
 * @date 2013-07-23 14:51:29
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
		List<TbEmployeeEntity> employeeEntities = this.tbPostService.checkPostCanDel(tbPost.getId());
		if(0 < employeeEntities.size()) {
			this.message = "该岗位已被使用，不可删除";
		} else {
			this.tbPostService.deleteMidEntityById(tbPost.getId());
			tbPost = this.systemService.getEntity(TbPostEntity.class, tbPost.getId());
			this.message = "删除成功";
			this.tbPostService.delete(tbPost);
			this.systemService.addLog(this.message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		}
		j.setMsg(this.message);
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
		System.out.println("departmentId:   "+tbPost.getDeptId().getId());
		if(null != tbPost && null != tbPost.getDeptId().getId()) {
			String[] end = tbPost.getDeptId().getId().split(",");
			tbPost.getDeptId().setId(end[0]);
		}
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
		List<TSDepart> departList = systemService.getList(TSDepart.class);
		List<TbPostEntity> postList = systemService.getList(TbPostEntity.class);
		req.setAttribute("departList", departList);
		TbPostEntity entity = new TbPostEntity();
		entity.setId("0");
		entity.setPostName("无");
		postList.add(0,entity);
		req.setAttribute("postList", postList);
		return new ModelAndView("jeecg/kxcomm/hrm/tbPost");
	}
	
	/**
	 * 地市列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "fun")
	public ModelAndView fun(HttpServletRequest request) {
		String postId = request.getParameter("postId");
		request.setAttribute("postId", postId);
		return new ModelAndView("jeecg/kxcomm/hrm/tbPostSet");
	}
	
	/**
	 * 设置地市
	 * 
	 * @param role
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 * @return
	 */
	@RequestMapping(params = "setAuthority")
	@ResponseBody
	public List<ComboTree> setAuthority(TbPostEntity tbPost, HttpServletRequest request,ComboTree comboTree) {
		CriteriaQuery cq = new CriteriaQuery(TbCityEntity.class);
		String postId = request.getParameter("postId");
		tbPost = this.systemService.get(TbPostEntity.class, postId);
		List<TbPostCityRelationshipEntity> roleFunctionList = null;
		if (tbPost != null) {
			roleFunctionList = this.systemService.findByProperty(TbPostCityRelationshipEntity.class, "postId.id", tbPost.getId());
		}
		List<TbCityEntity> functionList = this.systemService.getListByCriteriaQuery(cq,false);
		List<TbCityEntity> upCityEntities = new ArrayList<TbCityEntity>();
		List<TbCityEntity> endCityEntities = new ArrayList<TbCityEntity>();
		List<ComboTree> comboTrees = new ArrayList<ComboTree>();
		ComboTree tree = null;
		ComboTree endtree = null;
		for (TbCityEntity entity : functionList) {
			if("1".equals(entity.getCityType())) {
				upCityEntities.add(entity);
			} else {
				endCityEntities.add(entity);
			}
		}
		List<ComboTree> upcomboTrees = null;
		for(TbCityEntity entityup : upCityEntities) {
			upcomboTrees = new ArrayList<ComboTree>();
			tree = new ComboTree();
			tree.setId(entityup.getId());
			tree.setText(entityup.getName());
			tree.setState("open");
			for(TbCityEntity entityend : endCityEntities) {
				if(entityup.getId().equals(entityend.getParentId())) {
					endtree = new ComboTree();
					endtree.setId(entityend.getId());
					endtree.setText(entityend.getName());
					endtree.setState("close");
					upcomboTrees.add(endtree);
				}
			}
			tree.setChildren(upcomboTrees);
			comboTrees.add(tree);
		}
		for(int i= 0 ; i < comboTrees.size(); i++) {
			for(int j =0; j < roleFunctionList.size(); j++) {
				//如果ID相等
//				if(comboTrees.get(i).getId().equals(roleFunctionList.get(j).getCityId().getId())) {
//					comboTrees.get(i).setChecked(true);
//				}
				for(int s = 0; s < comboTrees.get(i).getChildren().size(); s++) {
					if(comboTrees.get(i).getChildren().get(s).getId().equals(roleFunctionList.get(j).getCityId().getId())) {
						comboTrees.get(i).getChildren().get(s).setChecked(true);
					}
				}
			}
		}
		request.setAttribute("postId",postId);
		return comboTrees;
	}
	
	/**
	 * 地市关系修改
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "updateAuthority")
	@ResponseBody
	public AjaxJson updateAuthority(HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try{
			//删除岗位地市关系
			String postId =request.getParameter("postId");
			TbPostEntity delpostid = new TbPostEntity();
			delpostid.setId(postId);
			this.tbPostService.deleteMidEntityById(delpostid.getId());
			String postcitys = request.getParameter("postcitys");
			if(postcitys.indexOf(",") < -1) {
				TbPostCityRelationshipEntity roleFunction = new TbPostCityRelationshipEntity();
				TbCityEntity cityEntity = new TbCityEntity();
				TbPostEntity postEntity = new TbPostEntity();
				cityEntity.setId(postcitys);
				postEntity.setId(postId);
				roleFunction.setCityId(cityEntity);
				roleFunction.setPostId(postEntity);
				this.systemService.save(roleFunction);
			} else {
				String[] cityids = postcitys.split(",");
				TbPostCityRelationshipEntity roleFunction =  null;
				TbCityEntity cityEntity = null;
				TbPostEntity postEntity = null;
				for(int i = 0;i < cityids.length; i++) {
					roleFunction = new TbPostCityRelationshipEntity();
					cityEntity = new TbCityEntity();
					postEntity = new TbPostEntity();
					cityEntity.setId(cityids[i]);
					postEntity.setId(postId);
					roleFunction.setCityId(cityEntity);
					roleFunction.setPostId(postEntity);
					this.systemService.save(roleFunction);
				}
			}
			j.setMsg("地市更新成功");			
		}catch (Exception e){
            logger.error(ExceptionUtil.getExceptionMessage(e));    
			j.setMsg("地市更新失败");			
		}
		return j;
	}
}
