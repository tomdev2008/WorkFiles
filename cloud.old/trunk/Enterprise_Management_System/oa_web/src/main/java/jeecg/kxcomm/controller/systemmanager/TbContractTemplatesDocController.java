package jeecg.kxcomm.controller.systemmanager;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.model.common.UploadFile;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.extend.swftools.SwfToolsUtil;
import org.jeecgframework.core.util.DataUtils;
import org.jeecgframework.core.util.FileUtils;
import org.jeecgframework.core.util.MyClassLoader;
import org.jeecgframework.core.util.PinyinUtil;
import org.jeecgframework.core.util.ReflectHelper;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.jeecgframework.tag.core.easyui.TagUtil;

import jeecg.system.pojo.base.TSDocument;
import jeecg.system.pojo.base.TSType;
import jeecg.system.pojo.base.TSTypegroup;
import jeecg.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import jeecg.kxcomm.entity.systemmanager.TbContractDocTypeEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesDocEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractTemplatesRelationshipEntity;
import jeecg.kxcomm.service.impl.systemmanager.TbContractTemplatesRelationshipServiceImpl;
import jeecg.kxcomm.service.systemmanager.TbContractTemplatesDocServiceI;
import jeecg.kxcomm.service.systemmanager.TbContractTemplatesRelationshipServiceI;

/**   
 * @Title: Controller
 * @Description: 合同模板文件
 * @author zhangdaihao
 * @date 2013-10-15 11:10:19
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/tbContractTemplatesDocController")
public class TbContractTemplatesDocController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractTemplatesDocController.class);

	@Autowired
	private TbContractTemplatesDocServiceI tbContractTemplatesDocService;
	@Autowired
	private TbContractTemplatesRelationshipServiceI tbContractTemplatesRelationshipService;
	@Autowired
	private SystemService systemService;
	private String message;
	private List<TbContractTemplatesDocEntity> templatesDocEntities;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 合同模板文件列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "tbContractTemplatesDoc")
	public ModelAndView tbContractTemplatesDoc(HttpServletRequest request) {
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractTemplatesDocList");
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
	public void datagrid(TbContractTemplatesDocEntity tbContractTemplatesDoc,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(TbContractTemplatesDocEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, tbContractTemplatesDoc);
		this.tbContractTemplatesDocService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除合同模板文件
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(TbContractTemplatesDocEntity tbContractTemplatesDoc, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		List<TbContractTemplatesRelationshipEntity> list=tbContractTemplatesRelationshipService.listByDocId(tbContractTemplatesDoc.getId());
		if(null!=list && list.size()>0)
		{
			message="有关联不能删除";
			j.setMsg(message);
		}else{	
			message = "删除成功";
		tbContractTemplatesDoc = systemService.getEntity(TbContractTemplatesDocEntity.class, tbContractTemplatesDoc.getId());
		tbContractTemplatesDocService.delete(tbContractTemplatesDoc);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		j.setMsg(message);
		}
		return j;
	}


	/**
	 * 添加合同模板文件
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TbContractTemplatesDocEntity tbContractTemplatesDoc, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		 HttpSession session =  request.getSession();
		 String fileName = (String)session.getAttribute("fileName");
		if (StringUtil.isNotEmpty(tbContractTemplatesDoc.getId())) {
			message = "更新成功";
			TbContractTemplatesDocEntity t = tbContractTemplatesDocService.get(TbContractTemplatesDocEntity.class, tbContractTemplatesDoc.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(tbContractTemplatesDoc, t);
				tbContractTemplatesDocService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			tbContractTemplatesDoc.setPath(fileName);
			tbContractTemplatesDoc.setCreatetime(new Date());
             j.setMsg(message);
			 tbContractTemplatesDocService.save(tbContractTemplatesDoc);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		
		return j;
	}
	
	/**
	 * 上传合同模板文件
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping(params = "uploadTemplatesDoc", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson uploadTemplatesDoc( HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		String docname = request.getParameter("docname"); //文件名称
		String docType=request.getParameter("docType"); //文件类型
		String bvariable=request.getParameter("bvariable"); //是否设置变量
		String id=request.getParameter("id");  //id
		TbContractTemplatesDocEntity tbContractTemplatesDoc=new TbContractTemplatesDocEntity();
		String fileName="";
		String fileNewName="";
		String savePath="";
		String swfName = "";
		UploadFile uploadFile = new UploadFile(request,tbContractTemplatesDoc);
		uploadFile.setSwfpath("swfpath");
		ReflectHelper reflectHelper = new ReflectHelper(uploadFile.getObject());
		 String ctxPath = request.getSession().getServletContext().getRealPath("upload");
         File file = new File(ctxPath);
         if (!file.exists()) {
                 file.mkdir();// 创建文件根目录
         }
		 MultipartHttpServletRequest multipartRequest = uploadFile.getMultipartRequest();
         Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
         for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
                 MultipartFile mf = entity.getValue();// 获取上传文件对象
                 fileName = mf.getOriginalFilename();// 获取文件名
                 String extend = FileUtils.getExtend(fileName);// 获取文件扩展名
                 swfName = PinyinUtil.getPinYinHeadChar(oConvertUtils.replaceBlank(FileUtils.getFilePrefix(fileName)));// 取文件名首字母作为SWF文件名
                 fileNewName = System.currentTimeMillis()+mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."), mf.getOriginalFilename().length());// 获取文件名
                 savePath = file.getPath() + "\\" + fileNewName;// 上传后的文件绝对路径
                System.out.println("路径长度："+savePath.length());
                 System.out.println("上传后路径："+savePath);
                 File savefile = new File(savePath);
                 try {
                         FileCopyUtils.copy(mf.getBytes(), savefile);
                 } catch (IOException e) {
                         e.printStackTrace();
                 }
             	File savef = new File(savePath);
             	try {
					FileCopyUtils.copy(mf.getBytes(), savef);
					// 转SWF
					reflectHelper.setMethodValue(uploadFile.getSwfpath(), file.getPath() + "/"+ swfName + ".swf");
					if (uploadFile.getSwfpath() != null) {
						// 转SWF
						//----------------------------------------------------------------
						//update-end--Author:liutao  Date:20130506 for：修改swf文件的存储路径
						//----------------------------------------------------------------
						reflectHelper.setMethodValue(uploadFile.getSwfpath(), file.getPath() + "/" + FileUtils.getFilePrefix(fileNewName) + ".swf");
						//----------------------------------------------------------------
						//update-end--Author:liutao  Date:20130506 for：修改swf文件的存储路径
						//----------------------------------------------------------------
						SwfToolsUtil.convert2SWF(savePath);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
         }
         HttpSession session =  request.getSession();
         session.setAttribute("fileName", fileNewName);
         if(StringUtil.isNotEmpty(id))
         {
        	 message = "更新成功";
        	    tbContractTemplatesDoc.setId(id);
        	    TbContractDocTypeEntity tbContractDocType=new TbContractDocTypeEntity();
                tbContractDocType.setId(docType);
                tbContractTemplatesDoc.setCreatetime(new Date());
                tbContractTemplatesDoc.setBvariable(Integer.parseInt(bvariable==null?"0":bvariable));
                tbContractTemplatesDoc.setDocname(docname);
                tbContractTemplatesDoc.setPath(fileNewName);
                tbContractTemplatesDoc.setDocType(tbContractDocType);
                tbContractTemplatesDocService.saveOrUpdate(tbContractTemplatesDoc);
         }else{
        	 message = "添加成功";
         //保存合同模板文件
         TbContractDocTypeEntity tbContractDocType=new TbContractDocTypeEntity();
         tbContractDocType.setId(docType);
         tbContractTemplatesDoc.setCreatetime(new Date());
         tbContractTemplatesDoc.setBvariable(Integer.parseInt(bvariable==null?"0":bvariable));
         tbContractTemplatesDoc.setDocname(docname);
         tbContractTemplatesDoc.setPath(fileNewName);
         tbContractTemplatesDoc.setDocType(tbContractDocType);
         tbContractTemplatesDocService.save(tbContractTemplatesDoc);
         }
         j.setMsg(message);
		systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
	return j;
	}
	

	/**
	 * 合同模板文件列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TbContractTemplatesDocEntity tbContractTemplatesDoc, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(tbContractTemplatesDoc.getId())) {
			tbContractTemplatesDoc = tbContractTemplatesDocService.getEntity(TbContractTemplatesDocEntity.class, tbContractTemplatesDoc.getId());
			req.setAttribute("tbContractTemplatesDocPage", tbContractTemplatesDoc);
		}
		//获取合同文件类型的集合
		List<TbContractDocTypeEntity> docTyleList=systemService.getList(TbContractDocTypeEntity.class);
		req.setAttribute("docTyleList", docTyleList);
		return new ModelAndView("jeecg/kxcomm/systemmanager/tbContractTemplatesDoc");
	}

	
	/**
	 * easyui 获得模板下的所有DOC文件
	 * ModelAndView
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */
	@RequestMapping(params = "queryTempFiledatagrid")
	public void queryTempFiledatagrid(TbContractTemplatesDocEntity tbContractTemplatesDoc,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		String temple_id = request.getParameter("temple_id");
		String statsvalues = request.getParameter("statsvalues");
		//查询条件组装器
		HqlQuery hqlQuery = new HqlQuery("tbCheckingInstance.do?datagrid");
		hqlQuery.setCurPage(dataGrid.getPage());
		hqlQuery.setPageSize(dataGrid.getRows());
		hqlQuery.setDataGrid(dataGrid);
		PageList pagelist = this.tbContractTemplatesDocService.getPageList(hqlQuery, true,tbContractTemplatesDoc,temple_id,statsvalues);
		this.templatesDocEntities = this.tbContractTemplatesDocService.getConTempList(temple_id);
		List<TbContractTemplatesDocEntity> docEntities = new ArrayList<TbContractTemplatesDocEntity>();
		docEntities = pagelist.getResultList();
		for(int i = 0; i < docEntities.size(); i++) {
			for(int j = 0; j < this.templatesDocEntities.size(); j++) {
				if (this.templatesDocEntities.get(j).getId().trim().equals(docEntities.get(i).getId().trim())) {
					docEntities.get(i).setPath("yes");
				}
			}
		}
		pagelist.setResultList(docEntities);
		dataGrid.setPage(pagelist.getCurPageNO());
		dataGrid.setTotal(pagelist.getCount());
		dataGrid.setReaults(pagelist.getResultList());
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 修改模板和模板文件之间的关系
	 *
	 * @param tbContractTemplatesDoc
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "saveConTempFile")
	@ResponseBody
	public String saveConTempFile(TbContractTemplatesDocEntity tbContractTemplatesDoc, HttpServletRequest request) {
		String end = "";
		try {
			String ids = request.getParameter("ids");
			String contempIds = request.getParameter("contempIds");
			this.tbContractTemplatesDocService.delMidTempFileEntity(contempIds);
			if(ids.indexOf(",")>-1) {
				String[] filesId = ids.split(",");
				for(int i = 0; i < filesId.length; i++) {
					this.tbContractTemplatesRelationshipService.saveMidTempFileEntity(contempIds, filesId[i]);
				}
			} else {
				this.tbContractTemplatesRelationshipService.saveMidTempFileEntity(contempIds, ids);
			}
			request.setAttribute("temple_id  ",contempIds);
			end = "保存成功";
		} catch (Exception e) {
			end = "保存失败";
		}
		return end;
	}
	/**
	 * 附件预览页面打开链接
	 * 
	 * @return
	 */
	@RequestMapping(params = "openViewFile")
	public ModelAndView openViewFile(TbContractTemplatesDocEntity tbContractTemplatesDoc,HttpServletRequest request) {
        	String fileName = request.getParameter("path");
			String swfpath = "upload"+"\\\\"+FileUtils.getFilePrefix(fileName) + ".swf";
			request.setAttribute("swfpath", swfpath);
			return new ModelAndView("common/upload/swfView");
		

	}

}