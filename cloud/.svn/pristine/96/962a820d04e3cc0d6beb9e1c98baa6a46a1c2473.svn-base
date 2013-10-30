package jeecg.kxcomm.controller.contactm;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.contactm.TbInventoryEntity;
import jeecg.kxcomm.entity.contactm.TbOrderEntity;
import jeecg.kxcomm.service.contactm.TbInventoryServiceI;
import jeecg.system.service.SystemService;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**   
 * @Title: Controller
 * @Description: 产品库存
 * @author zhangdaihao
 * @date 2013-10-22 11:08:57
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbInventoryController")
public class TbInventoryController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbInventoryController.class);

	@Autowired
	private TbInventoryServiceI tbInventoryService;
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
	 * 产品库存列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbInventory")
	public ModelAndView tbInventory(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbInventoryList");
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
	public void datagrid(TbInventoryEntity tbInventory,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbInventoryEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbInventory);
		this.tbInventoryService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除产品库存
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbInventoryEntity tbInventory, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbInventory = systemService.getEntity(TbInventoryEntity.class, tbInventory.getId());
		message = "删除成功";
		tbInventoryService.delete(tbInventory);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加产品库存
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbInventoryEntity tbInventory, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if(tbInventory.getContractno()!=null && tbInventory.getContractno().equals("null")){
			tbInventory.setContractno(null);
		}
		if(tbInventory.getKxorderno()!=null && tbInventory.getKxorderno().equals("null")){
			tbInventory.setKxorderno(null);
		}
		if (StringUtil.isNotEmpty(tbInventory.getId())) {
			message = "更新成功";
			TbInventoryEntity t = tbInventoryService.get(TbInventoryEntity.class, tbInventory.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbInventory, t);
				tbInventoryService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbInventoryService.save(tbInventory);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 产品库存列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbInventoryEntity tbInventory, HttpServletRequest req) {
		List<TbContractEntity> contractList = systemService.getList(TbContractEntity.class);
		req.setAttribute("contractList", contractList);
		List<TbOrderEntity> orderList = systemService.getList(TbOrderEntity.class);
		req.setAttribute("orderList", orderList);
		if (StringUtil.isNotEmpty(tbInventory.getId())) {
			tbInventory = tbInventoryService.getEntity(TbInventoryEntity.class, tbInventory.getId());
			req.setAttribute("tbInventoryPage", tbInventory);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbInventory");
	}
}
