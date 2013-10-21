package jeecg.kxcomm.controller.contactm;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.contactm.TbContractReceiveMoneyEntity;
import jeecg.kxcomm.service.contactm.TbContractReceiveMoneyServiceI;
import jeecg.kxcomm.service.contactm.TbContractServiceI;
import jeecg.system.pojo.base.TSUser;
import jeecg.system.service.SystemService;

import org.apache.log4j.Logger;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**   
 * @Title: Controller
 * @Description: 合同回款
 * @author zhangdaihao
 * @date 2013-10-19 22:04:24
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContractReceiveMoneyController")
public class TbContractReceiveMoneyController extends BaseController {
	@Autowired
	private TbContractServiceI tbContractService;
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractReceiveMoneyController.class);

	@Autowired
	private TbContractReceiveMoneyServiceI tbContractReceiveMoneyService;
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
	 * 合同回款列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContractReceiveMoney")
	public ModelAndView tbContractReceiveMoney(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/contactm/tbContractReceiveMoneyList");
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
	public void datagrid(TbContractReceiveMoneyEntity tbContractReceiveMoney,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbContractReceiveMoneyEntity.class, dataGrid);
		String receiveMoney = request.getParameter("receiveMoney");
		String tbContract_contractNo = request.getParameter("tbContract_contractNo");
		String moneyType = request.getParameter("moneyType");
		String notReceiveMoney = request.getParameter("notReceiveMoney");
		String remark = request.getParameter("remark");
		String receivedate = request.getParameter("receivedate");
		if(receiveMoney!=null && !"".equals(receiveMoney)){
			cq.add(Restrictions.eq("receiveMoney", receiveMoney));
		}
		if(tbContract_contractNo!=null && !"".equals(tbContract_contractNo)){
			TbContractEntity tbContract = null;
			String hql0 = "from TbContractEntity where 1 = 1 AND contractNo = ? ";
		    List<TbContractEntity> tbContractList = systemService.findHql(hql0,tbContract_contractNo);
		    if(tbContractList.size()>0){
		    	tbContract = tbContractList.get(0);
			}
		    cq.add(Restrictions.eq("tbContract", tbContract));
		}
		if(moneyType!=null && !"".equals(moneyType)){
			cq.add(Restrictions.eq("moneyType", moneyType));
		}
		if(notReceiveMoney!=null && !"".equals(notReceiveMoney)){
			cq.add(Restrictions.eq("notReceiveMoney", notReceiveMoney));
		}
		if(remark!=null && !"".equals(remark)){
			cq.add(Restrictions.eq("remark", remark));
		}
		if(receivedate!=null && !"".equals(receivedate)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try{
				Date date = sdf.parse(receivedate);
				cq.add(Restrictions.eq("receivedate", date));
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContractReceiveMoney);
		this.tbContractReceiveMoneyService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除合同回款
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContractReceiveMoneyEntity tbContractReceiveMoney, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		tbContractReceiveMoney = systemService.getEntity(TbContractReceiveMoneyEntity.class, tbContractReceiveMoney.getId());
		message = "删除成功";
		tbContractReceiveMoneyService.delete(tbContractReceiveMoney);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加合同回款
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContractReceiveMoneyEntity tbContractReceiveMoney, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(tbContractReceiveMoney.getId())) {
			message = "更新成功";
			TbContractReceiveMoneyEntity t = tbContractReceiveMoneyService.get(TbContractReceiveMoneyEntity.class, tbContractReceiveMoney.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbContractReceiveMoney, t);
				tbContractReceiveMoneyService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbContractReceiveMoney.setCreateTime(new Date());
			TSUser user= ResourceUtil.getSessionUserName();
			tbContractReceiveMoney.setCreateUser(user.getRealName());
			tbContractReceiveMoneyService.save(tbContractReceiveMoney);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}

	/**
	 * 合同回款列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContractReceiveMoneyEntity tbContractReceiveMoney, HttpServletRequest req) {
		List<TbContractEntity> contractList = tbContractService.getList(TbContractEntity.class);
		req.setAttribute("contractList", contractList);
		if (StringUtil.isNotEmpty(tbContractReceiveMoney.getId())) {
			tbContractReceiveMoney = tbContractReceiveMoneyService.getEntity(TbContractReceiveMoneyEntity.class, tbContractReceiveMoney.getId());
			req.setAttribute("tbContractReceiveMoneyPage", tbContractReceiveMoney);
		}
		return new ModelAndView("jeecg/kxcomm/contactm/tbContractReceiveMoney");
	}
}
