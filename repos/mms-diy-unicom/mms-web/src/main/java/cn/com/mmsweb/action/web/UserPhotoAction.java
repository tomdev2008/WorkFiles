package cn.com.mmsweb.action.web;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.aspectj.util.FileUtil;

import cn.com.common.AppConfig;
import cn.com.common.Response;
import cn.com.mmsweb.action.util.SessionUtils;
import cn.com.mmsweb.service.CommonService;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.unicom.mms.entity.TbUserPhoto;
import com.unicom.mms.entity.TbUsers;
import com.unicom.mms.mcp.webservice.Mcp;
import com.unicom.mms.mcp.webservice.McpServiceLocator;
import com.unicom.mms.resources.FileType;
import com.unicom.mms.resources.socket.ClientSocket;

public class UserPhotoAction extends BaseAction<TbUserPhoto, String>{
	private static Logger log = Logger.getLogger(UserPhotoAction.class);
	//private static final String socketHost = "192.168.1.110";  //socket地址
//	private static final Integer socketport = 11111;   //socket端口
	private File file;
	public File getFile() {
		return file;
	}


	public void setFile(File file) {
		this.file = file;
	}

	private String fileFileName;









	public String getFileFileName() {
		return fileFileName;
	}


	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

//上传图片
	public String fileupPhoto()
	{
		String msg="";
		AppConfig appConfig = AppConfig.getInstance();
		String socketHost = appConfig.getString("socketHost");
		Integer socketport = appConfig.getInt("socketPort");
		 HttpSession session = getHttpSession();
		 TbUsers users = (TbUsers) session.getAttribute(SessionUtils.USER);
		 if(users==null)
		 {
			 msg="login";
		//	 return successInfo(msg);
		 }else{
		HttpServletRequest req = this.getHttpRequest();
		String bakPath = req.getSession().getServletContext().getRealPath("upload/")+File.separator;
		
		String FileName = System.currentTimeMillis()+fileFileName.substring(fileFileName.lastIndexOf("."), fileFileName.length());//上传到服务器的文件名
		File newFile = new File(bakPath,FileName);
		if(!newFile.exists()){
			try {
				FileUtils.copyFile(file,newFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		try {
			String path = new ClientSocket().sendFile(socketHost, socketport,newFile.getPath(),FileName,users.getId().toString(),FileType.PostMarkType);
			try {
				Mcp mcp = new McpServiceLocator().getMcpPort();
				Gson gson = new Gson();
				TbUserPhoto tup = new TbUserPhoto();
				tup.setPhoto_name(FileName);
				tup.setPhoto_url(path);
				tup.setUpload_time(new Date());
				TbUsers user=new TbUsers();
				user.setId(users.getId());
				tup.setUsers(user);
				String jsonStr = gson.toJson(tup);	
				String res = mcp.userPhotoManage(jsonStr, 1, "web", users.getMdn());
				Response response =  gson.fromJson(res,   
		                new TypeToken<Response>() {   
		            }.getType());   
				if(response.getResultCode()==0)
				{
					msg="ok";
				//	return successInfo(msg);
				}else {
					msg="error";
				//	return successInfo(msg);
				}
				//调用接口发送模板明信片
	//			String responseStr = mcp.sendMms(jsonStr, responseStr, responseStr);
	//			Response response = gson.fromJson(responseStr, new TypeToken<Response>(){}.getType());
				} catch (ServiceException e) {
				e.printStackTrace();
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		 }
		return successInfo(msg);
	}
	
	
	@Override
	public CommonService getCommonService() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TbUserPhoto getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setModel(TbUserPhoto model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String[] getIds() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setIds(String[] ids) {
		// TODO Auto-generated method stub
		
	}

}
