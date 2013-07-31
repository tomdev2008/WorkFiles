package jeecg.kxcomm.controller.hrm;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.jeecgframework.core.util.ExceptionUtil;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.jeecgframework.tag.core.easyui.TagUtil;
import jeecg.system.pojo.base.TSUser;
import jeecg.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import jeecg.kxcomm.entity.hrm.TbCheckingInEntity;
import jeecg.kxcomm.entity.hrm.TbCheckingInstanceEntity;
import jeecg.kxcomm.entity.hrm.TbEmployeeEntity;
import jeecg.kxcomm.service.hrm.TbCheckingInServiceI;
import jeecg.kxcomm.service.hrm.TbCheckingInstanceServiceI;
import jeecg.kxcomm.service.hrm.TbEmployeeServiceI;
import jeecg.kxcomm.util.BusinessUtil;

/**   
 * @Title: Controller
 * @Description: 考勤统计表
 * @author zhangdaihao
 * @date 2013-07-23 14:59:53
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbCheckingInstanceController")
public class TbCheckingInstanceController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbCheckingInstanceController.class);

	@Autowired
	private TbCheckingInstanceServiceI tbCheckingInstanceService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private TbEmployeeServiceI tbEmployeeService;
	@Autowired
	private TbCheckingInServiceI tbCheckingInService;
	private String message;
	private String ids;		//事项类型：迟到，早退，旷工
	private String empids;	//员工ID集合

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getIds() {
		return this.ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getEmpids() {
		return this.empids;
	}

	public void setEmpids(String empids) {
		this.empids = empids;
	}

	/**
	 * 考勤统计表列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbCheckingInstance")
	public ModelAndView tbCheckingInstance(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/hrm/tbCheckingInstanceList");
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
	public void datagrid(TbCheckingInstanceEntity tbCheckingInstance,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbCheckingInstanceEntity.class, dataGrid);
		//查询条件组装器
		String ctBegin = request.getParameter("happenday_begin");
		String ctEnd = request.getParameter("happenday_end");
		String empName = request.getParameter("empId_empName");
//		if(StringUtil.isNotEmpty(ctBegin)&& StringUtil.isNotEmpty(ctEnd)){
//			try {
//				cq.ge("happenday", new SimpleDateFormat("yyyy-MM-dd").parse(ctBegin));
//				cq.le("happenday", new SimpleDateFormat("yyyy-MM-dd").parse(ctEnd));
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		} 
//		if(StringUtil.isNotEmpty(empName)) {
//			cq.like("TbEmployeeEntity.empName", empName);
//		}
//		cq.add();
//		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbCheckingInstance);
//		this.tbCheckingInstanceService.getDataGridReturn(cq, true);
		//查询条件组装器
		HqlQuery hqlQuery = new HqlQuery("tbCheckingInstance.do?datagrid");
		hqlQuery.setCurPage(dataGrid.getPage());
		hqlQuery.setPageSize(dataGrid.getRows());
		hqlQuery.setDataGrid(dataGrid);
		PageList pagelist = this.tbCheckingInstanceService.getPageList(hqlQuery, true,tbCheckingInstance,ctBegin,ctEnd,empName);
		for(int d = 0; d < pagelist.getResultList().size(); d++) {
			((TbCheckingInstanceEntity) pagelist.getResultList().get(d)).setEmpName(ctBegin+","+ctEnd);
		}
		dataGrid.setPage(pagelist.getCurPageNO());
		dataGrid.setTotal(pagelist.getCount());
		dataGrid.setReaults(pagelist.getResultList());
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除考勤统计表
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbCheckingInstanceEntity tbCheckingInstance, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String happenday = request.getParameter("empName");
		String empId_id = request.getParameter("empId_id");
		String hptime = request.getParameter("happenday");
		String[] times = happenday.split(",");
		if(1 < times.length) {
			System.out.println(times[0]+"------------"+empId_id+"------------"+times[1]);
		}
		tbCheckingInService.delDataByTimeAndEmp(times,empId_id,hptime);
		tbCheckingInstance = systemService.getEntity(TbCheckingInstanceEntity.class, tbCheckingInstance.getId());
		message = "删除成功";
		tbCheckingInstanceService.delete(tbCheckingInstance);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加考勤统计表
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbCheckingInstanceEntity tbCheckingInstance, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		this.ids = request.getParameter("ids");
		String[] primarSouce = this.ids.split(",");
		if (StringUtil.isNotEmpty(tbCheckingInstance.getId())) {
			message = "更新成功";
			TbCheckingInstanceEntity t = tbCheckingInstanceService.get(TbCheckingInstanceEntity.class, tbCheckingInstance.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbCheckingInstance, t);
				t.setEmpDue(Integer.parseInt(primarSouce[0]));
				t.setEmpActual(Integer.parseInt(primarSouce[1]));
				t.setNeglectWork(Integer.parseInt(primarSouce[2]));
				t.setEmpLate(Integer.parseInt(primarSouce[3]));
				t.setLeaveEarly(Integer.parseInt(primarSouce[4]));
				t.setOvertime(Integer.parseInt(primarSouce[5]));
				t.setEmpLeave(Integer.parseInt(primarSouce[6]));
				t.setEmpAway(Integer.parseInt(primarSouce[7]));
				t.setWeekendOvertime(Integer.parseInt(primarSouce[8]));
				t.setHappenday(tbCheckingInstance.getHappenday());
				System.out.println(t.toString());
				tbCheckingInstanceService.saveOrUpdate(t);
				tbCheckingInstanceService.delMiddleDatas(tbCheckingInstance);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			this.empids = tbCheckingInstance.getEmpId().getId();
			String[] emploSouce = this.empids.split(",");
			message = "添加成功";
			TbCheckingInstanceEntity entity = null;
			for(int k = 0; k < emploSouce.length; k++) {
				entity = new TbCheckingInstanceEntity();
				TbEmployeeEntity employeeEntity = new TbEmployeeEntity();
				employeeEntity.setId(emploSouce[k]);
				entity.setEmpId(employeeEntity);
				entity.setEmpDue(Integer.parseInt(primarSouce[0]));
				entity.setEmpActual(Integer.parseInt(primarSouce[1]));
				entity.setNeglectWork(Integer.parseInt(primarSouce[2]));
				entity.setEmpLate(Integer.parseInt(primarSouce[3]));
				entity.setLeaveEarly(Integer.parseInt(primarSouce[4]));
				entity.setOvertime(Integer.parseInt(primarSouce[5]));
				entity.setEmpLeave(Integer.parseInt(primarSouce[6]));
				entity.setEmpAway(Integer.parseInt(primarSouce[7]));
				entity.setWeekendOvertime(Integer.parseInt(primarSouce[8]));
				entity.setHappenday(tbCheckingInstance.getHappenday());
				System.out.println(entity.toString());
				tbCheckingInstanceService.save(entity);
			}
			TbCheckingInEntity tbCheckingIn = null;
			for(int u = 0; u < primarSouce.length; u++) {
				if("1".equals(primarSouce[u])) {
					tbCheckingIn = new TbCheckingInEntity();
					TbEmployeeEntity empId = new TbEmployeeEntity();
					empId.setId(emploSouce[0]);
					tbCheckingIn.setEmpId(empId);
					tbCheckingIn.setReason("无");
					if(u == 2) {		//矿工
						tbCheckingIn.setStauts(BusinessUtil.Absenteeism);
					} else if(u == 3) {		//迟到
						tbCheckingIn.setStauts(BusinessUtil.beLate);
					} else if(u == 4) {		//早退
						tbCheckingIn.setStauts(BusinessUtil.leaveEarly);
					} else if(u == 5) {		//加班
						tbCheckingIn.setStauts(BusinessUtil.overTime);
					} else if(u == 6) {		//请假
						tbCheckingIn.setStauts(BusinessUtil.leave);
					} else if(u == 7) {		//公出
						tbCheckingIn.setStauts(BusinessUtil.publicOut);
					} else if(u == 8) {		//周末加班
						tbCheckingIn.setStauts(BusinessUtil.overTime);
					} else {		//正常
						tbCheckingIn.setStauts(BusinessUtil.normal);
					}
					tbCheckingIn.setTime(tbCheckingInstance.getHappenday());
					tbCheckingInService.save(tbCheckingIn);
				}
			}
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		return j;
	}

	/**
	 * 考勤统计表列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbCheckingInstanceEntity tbCheckingInstance, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbCheckingInstance.getId())) {
			tbCheckingInstance = tbCheckingInstanceService.getEntity(TbCheckingInstanceEntity.class, tbCheckingInstance.getId());
			req.setAttribute("tbCheckingInstancePage", tbCheckingInstance);
		}
		return new ModelAndView("jeecg/kxcomm/hrm/tbCheckingInstance");
	}
	
	/**
	 * 所有员工数据查询
	 * 
	 * @return
	 */
	@RequestMapping(params = "empdatagrid")
	public void datagrid(TbEmployeeEntity tbEmployee,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbEmployeeEntity.class, dataGrid);
		String employName = oConvertUtils.getString(request.getParameter("empName"));
		String employNo = oConvertUtils.getString(request.getParameter("jobNo"));
		if (!StringUtil.isEmpty(employName)) {
			cq.like("empName", employName);
		} 
		if(!StringUtil.isEmpty(employNo)) {
			cq.like("jobNo", employNo);
		}
		cq.add();
		//查询条件组装器
//		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbEmployee);
		this.tbEmployeeService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 员工考勤详情查看
	 * 
	 * @return
	 */
	@RequestMapping(params = "queryInfo")
	public ModelAndView queryCheckInfoByTime(HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		//----------------------------------------------------------------
		//update-start--Author:anchao  Date:20130415 for：按钮权限控制
		//----------------------------------------------------------------
		String happenday_begin = request.getParameter("happenday_begin");
		String happenday_end = request.getParameter("happenday_end");
		String empId_id = request.getParameter("empId_id");
		request.setAttribute("happenday_begin", happenday_begin);
		request.setAttribute("empId_id", empId_id);
		request.setAttribute("happenday_end", happenday_end);
		System.out.println(happenday_begin+"------------"+empId_id+"------------"+happenday_end);
		//----------------------------------------------------------------
		//update-end--Author:anchao  Date:20130415 for：按钮权限控制
		//----------------------------------------------------------------
		return new ModelAndView("jeecg/kxcomm/hrm/tbCheckingInList");
	}
	
	
	/**
	 * 
	* 方法用途和描述: 考勤统计导入页面跳转
	* @return
	* @author chenliang 新增日期：2013-7-25
	* @since oa_web
	 */
	@RequestMapping(params = "goImporExcel")
	public ModelAndView uploadExcel(HttpServletRequest req){
		//获取当前时间的年和月
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		int year = cal.get(Calendar.YEAR);
		List<Integer> yearlist = new ArrayList<Integer>();
		//当前年前五年到当前年后10年可供下拉框
		for (int i = year-5; i < year+10; i++) {
			yearlist.add(i);
		}
		List<Integer> monthlist = new ArrayList<Integer>();
		for (int i = 1; i <= 12; i++) {
			monthlist.add(i);
		}
		req.setAttribute("yearlist", yearlist);
		req.setAttribute("monthlist", monthlist);
		return new ModelAndView("jeecg/kxcomm/hrm/uploadExcel");
	}
	
	/**
	 * 
	* 方法用途和描述: 上传考情统计
	* @return
	* @author chenliang 新增日期：2013-7-25
	 * @throws Exception 
	* @since oa_web
	 */
	@RequestMapping(params="importExcel", method = RequestMethod.POST)
	@ResponseBody
	public  AjaxJson importExcel(HttpServletRequest request, HttpServletResponse response) throws Exception{
		AjaxJson j = new AjaxJson();
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			MultipartFile file = entity.getValue();// 获取上传文件对象
			List<TbCheckingInstanceEntity> listCheckingInstance;
			try {
				tbCheckingInstanceService.importExcel(file.getInputStream(),year+"-"+month);
				j.setMsg("文件导入成功！");
			} catch (IOException e) {
				j.setMsg("文件导入失败！");
				logger.error(ExceptionUtil.getExceptionMessage(e));
			}
			//break; // 不支持多个文件导入？
		}
		
		j.setMsg("上传成功");
		return j;
	}
	
}
