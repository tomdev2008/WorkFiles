package jeecg.kxcomm.controller.contactm;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import jeecg.kxcomm.entity.contactm.TbContractEntity;
import jeecg.kxcomm.entity.systemmanager.TbContractDocEntity;
import jeecg.kxcomm.service.contactm.TbContractQuotationsServiceI;
import jeecg.kxcomm.service.contactm.TbContractServiceI;
import jeecg.kxcomm.util.FilUtil2;
import jeecg.system.service.SystemService;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.util.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/tbContractQuotationsController")
public class TbContractQuotationsController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TbContractQuotationsController.class);

	@Autowired
	private TbContractQuotationsServiceI tbContractQuotationsService;
	@Autowired
	private TbContractServiceI tbContractService;
	@Autowired
	private SystemService systemService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	@RequestMapping(params = "exportExcel")
	@ResponseBody
	public AjaxJson exportExcel(HttpServletRequest request)
	{
		AjaxJson j = new AjaxJson();
		String contractId=request.getParameter("id");
	
		TbContractEntity contract=this.systemService.getEntity(TbContractEntity.class, contractId);
		//生成报价总表
		 this.tbContractQuotationsService.exportContractTotalPrice(contract, request);
		
	   	String end = request.getSession().getServletContext().getRealPath("exportExcelPath");
	    String docTemp = request.getSession().getServletContext().getRealPath("upload");
		System.out.println("****************************packageStart********************");
		File file = null;
		List<Map> filelist = new ArrayList<Map>();
		Map<String,Object> map = null;
		  if(contract.getContactType().equals("2"))
			{
			    map = new HashMap<String,Object>();
				file=new File(docTemp+"\\"+contract.getFileName());
				map.put("file", file);
				map.put("fileName",contract.getFileName());
				filelist.add(map);
			}else{
				//生成合同文件
				boolean b=tbContractQuotationsService.shengchengContractFile(contractId, request);
				if(b==false){
					message="error";
				}
				else {
		  List<TbContractDocEntity> contractDocs = this.tbContractQuotationsService.queryConFileById(contractId);
		 for(int i = 0;i < contractDocs.size(); i++) {
			map = new HashMap<String,Object>();
			file = new File(end+"\\"+contractDocs.get(i).getExportpath());
			map.put("file",file);   
			map.put("fileName",FilUtil2.getContractRenameStr(contractDocs.get(i).getExportpath(),contractDocs.get(i).getFilename()));
			filelist.add(map);
		}
		file = new File(end+"\\"+contract.getQuotationsExcel());
		map = new HashMap<String,Object>();
		map.put("file",file);
		map.put("fileName","价格总表.xlsx");
		filelist.add(map);
		String fn = "";
		if(null == contract.getDownloadUrl() || "".equals(contract.getDownloadUrl())) {
			fn = System.currentTimeMillis()+".zip";
		} else {
			fn = contract.getDownloadUrl();
			if(!fn.contains(".zip")){
				fn+= ".zip";
			}
		}
		FilUtil2.zipMoreFile(filelist,end+"\\"+fn);
		System.out.println("****************************packageEnd********************");
		contract.setDownloadUrl(fn);
		message=fn;
		this.tbContractService.saveOrUpdate(contract);
				}
			}
		  j.setMsg(message);
		return j;
	}
}
