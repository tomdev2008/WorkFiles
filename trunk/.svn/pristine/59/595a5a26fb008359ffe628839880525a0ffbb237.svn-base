package jeecg.kxcomm.controller.systemmanager;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.persistence.Id;
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

import jeecg.kxcomm.entity.contactm.TbPurchaseEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocVariableEntity;
import jeecg.kxcomm.service.systemmanager.TbContractTemplatesDocVariableServiceI;
import jeecg.kxcomm.util.WordTools;
import jeecg.kxcomm.vo.systemmanager.TemplatesDocVariableVo;

/**   
 * @Title: Controller
 * @Description: 合同模板文件变量
 * @author zhangdaihao
 * @date 2013-10-14 18:21:11
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContractTemplatesDocVariableController")
public class TbContractTemplatesDocVariableController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractTemplatesDocVariableController.class);
	@Autowired
	private TbContractTemplatesDocVariableServiceI tbContractTemplatesDocVariableService;
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
	 * 合同模板文件变量列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContractTemplatesDocVariable")
	public ModelAndView tbContractTemplatesDocVariable(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractTemplatesDocVariableList");
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
	public void datagrid(TbContractTemplatesDocVariableEntity tbContractTemplatesDocVariable,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbContractTemplatesDocVariableEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContractTemplatesDocVariable);
		this.tbContractTemplatesDocVariableService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除合同模板文件变量
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContractTemplatesDocVariableEntity tbContractTemplatesDocVariable, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String ids = request.getParameter("ids");
		String[] primar = ids.split(",");
		try {
			for(int i=0;i<primar.length;i++){
				tbContractTemplatesDocVariable = systemService.getEntity(TbContractTemplatesDocVariableEntity.class, primar[i]);
				tbContractTemplatesDocVariableService.delete(tbContractTemplatesDocVariable);
				message = "删除成功";
				systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
				}
		} catch (Exception e) {
		  message="删除失败";
		}
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加合同模板文件变量
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContractTemplatesDocVariableEntity tbContractTemplatesDocVariable,HttpServletRequest request,TemplatesDocVariableVo vo) {
		AjaxJson j = new AjaxJson();
	/*	Enumeration eb = request.getParameterNames();
		while(eb.hasMoreElements()){
			System.out.println((String)eb.nextElement());
			
		}*/
		List<TbContractTemplatesDocVariableEntity> docVariableList=new ArrayList<TbContractTemplatesDocVariableEntity>();
	  List<TbContractTemplatesDocVariableEntity> tbContractTemplatesDocVariableList=vo.getTbContractTemplatesDocVariableList();
	  
		  //合同模板文件ID
		  String templatesdocId=tbContractTemplatesDocVariable.getTemplatesdocId().getId();
		  try {
			if(StringUtil.isNotEmpty(templatesdocId))  //判断是否有合同模板文件ID
			{
		  TbContractTemplatesDocEntity tbDoc=systemService.getEntity(TbContractTemplatesDocEntity.class,templatesdocId);
		//获取文件地址
			String docPath=request.getSession().getServletContext().getRealPath("upload")+"\\"+tbDoc.getPath();
		//检查合同模板文件变量是否与word文档里的变量名一致
			WordTools tools = WordTools.getInstance();
			HashMap<String , TbContractTemplatesDocVariableEntity> table = tools.checkVariable(docPath, tbContractTemplatesDocVariableList);  
		//如果一致就做保存操作
			if(table.size()==tbContractTemplatesDocVariableList.size()){
			//修改（先删除所有变量，再做保存）
				docVariableList=tbContractTemplatesDocVariableService.getTemplatesDocVariable(tbContractTemplatesDocVariable.getTemplatesdocId().getId());
				for (TbContractTemplatesDocVariableEntity variable:docVariableList) {
					TbContractTemplatesDocVariableEntity tb=systemService.getEntity(TbContractTemplatesDocVariableEntity.class, variable.getId());
					tbContractTemplatesDocVariableService.delete(tb);  //删除合同模板文件下所有的变量
			  }
	    //保存
		for (TbContractTemplatesDocVariableEntity contractTemplatesDocVariable:tbContractTemplatesDocVariableList) {
			if(contractTemplatesDocVariable.getVariablename()==null || contractTemplatesDocVariable.getVariablename().equals("")|| contractTemplatesDocVariable.getDescription()==null || contractTemplatesDocVariable.getDescription().equals(""))
			{
				continue;
			}else
			{
			TbContractTemplatesDocVariableEntity docVariableEntity=new TbContractTemplatesDocVariableEntity();
			docVariableEntity.setVariablename(contractTemplatesDocVariable.getVariablename());
			docVariableEntity.setDescription(contractTemplatesDocVariable.getDescription());
			TbContractTemplatesDocEntity tbContractTemplatesDocEntity=new TbContractTemplatesDocEntity();
			tbContractTemplatesDocEntity.setId(contractTemplatesDocVariable.getTemplatesdocId().getId());
			docVariableEntity.setTemplatesdocId(tbContractTemplatesDocEntity);
			tbContractTemplatesDocVariableService.save(docVariableEntity);
			message = "添加成功";
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
			}
		}
			}
			else {
				message="变量名与word文档里不一致";
			}
	   }
			} catch (Exception e) {
				message="操作有误";
			}
		j.setMsg(message);
		return j;
	}

	/**
	 * 合同模板文件变量列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContractTemplatesDocVariableEntity tbContractTemplatesDocVariable, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbContractTemplatesDocVariable.getId())) {
			tbContractTemplatesDocVariable = tbContractTemplatesDocVariableService.getEntity(TbContractTemplatesDocVariableEntity.class, tbContractTemplatesDocVariable.getId());
			req.setAttribute("tbContractTemplatesDocVariablePage", tbContractTemplatesDocVariable);
		}
	//	List<TbContractTemplatesDocVariableEntity> tbContractTemplatesDocVariableList=new ArrayList<TbContractTemplatesDocVariableEntity>();
		
		String templeDocId = req.getParameter("id");
		req.setAttribute("templeDocId", templeDocId);
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractTemplatesDocVariable");
	}
	
	
	/**
	 * 合同模板文件变量列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbVariableDoc")
	public ModelAndView tbVariableDoc(HttpServletRequest request) {
		String templeDocId=request.getParameter("templeDocId");
		request.setAttribute("templeDocId", templeDocId);
		List<TbContractTemplatesDocVariableEntity> tbContractTemplatesDocVariableList=new ArrayList<TbContractTemplatesDocVariableEntity>();
		if(StringUtil.isNotEmpty(templeDocId))
		{
			tbContractTemplatesDocVariableList=tbContractTemplatesDocVariableService.getTemplatesDocVariable(templeDocId);
		    request.setAttribute("tbContractTemplatesDocVariableList", tbContractTemplatesDocVariableList);
		}
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbVariableDoc");
	}
}
