package jeecg.demo.controller.test;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
import org.jeecgframework.core.util.BrowserUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import jeecg.system.pojo.base.TSDepart;
import jeecg.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.excel.ExcelExportUtil;
import org.jeecgframework.core.util.excel.entity.ExcelTitle;

import jeecg.demo.entity.test.CourseEntity;
import jeecg.demo.entity.test.JpPersonEntity;
import jeecg.demo.service.test.CourseServiceI;

/**   
 * @Title: Controller
 * @Description: 课程
 * @author jueyue
 * @date 2013-08-31 22:53:07
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/courseController")
public class CourseController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(CourseController.class);

	@Autowired
	private CourseServiceI courseService;
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
	 * 课程列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "course")
	public ModelAndView course(HttpServletRequest request) {
		return new ModelAndView("jeecg/demo/test/courseList");
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
	public void datagrid(CourseEntity course,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(CourseEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, course, request.getParameterMap());
		this.courseService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除课程
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(CourseEntity course, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		course = systemService.getEntity(CourseEntity.class, course.getId());
		message = "课程删除成功";
		courseService.delete(course);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加课程
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(CourseEntity course, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(course.getId())) {
			message = "课程更新成功";
			CourseEntity t = courseService.get(CourseEntity.class, course.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(course, t);
				courseService.saveOrUpdate(t);
				courseService.saveOrUpdate(t.getTeacher());
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "课程更新失败";
			}
		} else {
			message = "课程添加成功";
			courseService.saveCourse(course);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 课程列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(CourseEntity course, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(course.getId())) {
			course = courseService.getEntity(CourseEntity.class, course.getId());
			req.setAttribute("coursePage", course);
		}
		return new ModelAndView("jeecg/demo/test/course");
	}
	/**
	 * 学生列表
	 * 
	 * @return
	 */
	@RequestMapping(params = "studentsList")
	public ModelAndView studentsList(CourseEntity course, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(course.getId())) {
			course = courseService.getEntity(CourseEntity.class, course.getId());
			req.setAttribute("studentsList", course.getStudents());
		}
		return new ModelAndView("jeecg/demo/test/CourseStudentList");
	}
	
	/**
	 * 导出excel
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public void exportXls(HttpServletRequest request,
			HttpServletResponse response) {
		response.setContentType("application/vnd.ms-excel");
		String codedFileName = null;
		OutputStream fOut = null;
		try {
			codedFileName = "用户信息";
			// 根据浏览器进行转码，使其支持中文文件名
			String browse = BrowserUtils.checkBrowse(request);
			if ("MSIE".equalsIgnoreCase(browse.substring(0, 4))) {
				response.setHeader(
						"content-disposition",
						"attachment;filename="
								+ java.net.URLEncoder.encode(codedFileName,
										"UTF-8") + ".xls");
			} else {
				String newtitle = new String(codedFileName.getBytes("UTF-8"),
						"ISO8859-1");
				response.setHeader("content-disposition",
						"attachment;filename=" + newtitle + ".xls");
			}
			// 产生工作簿对象
			HSSFWorkbook workbook = null;
			List<CourseEntity> courses = this.courseService
					.loadAll(CourseEntity.class);
			workbook = ExcelExportUtil.exportExcel(new ExcelTitle(null, null,
					"导出信息"), CourseEntity.class, courses);
			fOut = response.getOutputStream();
			workbook.write(fOut);
		} catch (Exception e) {
		} finally {
			try {
				fOut.flush();
				fOut.close();
			} catch (IOException e) {

			}
		}
	}
}
