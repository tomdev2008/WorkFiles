package com.unicom.mms.base.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.configuration.CompositeConfiguration;

import com.unicom.mms.base.constants.FilePathConstants;
import com.unicom.mms.base.threads.StartUpThread;
import com.unicom.mms.resources.UrlPathConstants;
import com.unicom.mms.socket.MmsServerSocket;
import com.unicom.mms.util.Config;

public class PageFilter implements javax.servlet.Filter{
	private CompositeConfiguration config = Config.getConfig();
	private FilePathConstants filePathConstants =FilePathConstants.getInstance();
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		if("".equals(FilePathConstants.FontsPath)){
			java.util.Properties prop = System.getProperties();		
			String os = prop.getProperty("os.name");		
			FilePathConstants.FontsPath = req.getSession().getServletContext().getRealPath(UrlPathConstants.FontsUrlPath)+ java.io.File.separator;
			FilePathConstants.DiymmsFilePath = req.getSession().getServletContext().getRealPath(UrlPathConstants.DiymmsUrlPath)+ java.io.File.separator;
			FilePathConstants.AccessoriesFilePath = req.getSession().getServletContext().getRealPath(UrlPathConstants.AccessoriesUrlPath)+ java.io.File.separator;
			FilePathConstants.MusicFilePath = req.getSession().getServletContext().getRealPath(UrlPathConstants.MusicUrlPath)+ java.io.File.separator;
			FilePathConstants.PhotoFrameFilePath = req.getSession().getServletContext().getRealPath(UrlPathConstants.PhotoFrameUrlPath)+ java.io.File.separator;
			FilePathConstants.PostMarkFilePath = req.getSession().getServletContext().getRealPath(UrlPathConstants.PostMarkUrlPath)+ java.io.File.separator;
			FilePathConstants.StampsFilePath = req.getSession().getServletContext().getRealPath(UrlPathConstants.StampsUrlPath)+ java.io.File.separator;
			FilePathConstants.TempDataFilePath = req.getSession().getServletContext().getRealPath(UrlPathConstants.TempDataUrlPath)+ java.io.File.separator;
			FilePathConstants.UserDataFilePath = req.getSession().getServletContext().getRealPath(UrlPathConstants.UserDataUrlPath)+ java.io.File.separator;
			FilePathConstants.SystemDataFilePath = req.getSession().getServletContext().getRealPath(UrlPathConstants.SystemDataUrlPath)+ java.io.File.separator;
			FilePathConstants.RootFilePath = req.getSession().getServletContext().getRealPath("/")+ java.io.File.separator;
			FilePathConstants.TemplateCardPath = req.getSession().getServletContext().getRealPath(UrlPathConstants.TemplateCardPath)+ java.io.File.separator;
			FilePathConstants.BackgroundUrlPath = req.getSession().getServletContext().getRealPath(UrlPathConstants.BackgroundUrlPath)+ java.io.File.separator;
			if(os.startsWith("win") || os.startsWith("Win")) {//windows操作系统
				FilePathConstants.FontsPath =FilePathConstants.FontsPath.replaceAll("\\\\","//");
				FilePathConstants.DiymmsFilePath =FilePathConstants.DiymmsFilePath.replaceAll("\\\\","//");
				FilePathConstants.AccessoriesFilePath =FilePathConstants.AccessoriesFilePath.replaceAll("\\\\","//");
				FilePathConstants.MusicFilePath =FilePathConstants.MusicFilePath.replaceAll("\\\\","//");
				FilePathConstants.PhotoFrameFilePath =FilePathConstants.PhotoFrameFilePath.replaceAll("\\\\","//");
				FilePathConstants.PostMarkFilePath =FilePathConstants.PostMarkFilePath.replaceAll("\\\\","//");
				FilePathConstants.StampsFilePath =FilePathConstants.StampsFilePath.replaceAll("\\\\","//");
				FilePathConstants.TempDataFilePath =FilePathConstants.TempDataFilePath.replaceAll("\\\\","//");
				FilePathConstants.UserDataFilePath =FilePathConstants.UserDataFilePath.replaceAll("\\\\","//");
				FilePathConstants.SystemDataFilePath =FilePathConstants.SystemDataFilePath.replaceAll("\\\\","//");
				FilePathConstants.RootFilePath =FilePathConstants.RootFilePath.replaceAll("\\\\","//");
				FilePathConstants.TemplateCardPath =FilePathConstants.TemplateCardPath.replaceAll("\\\\","//");
				FilePathConstants.BackgroundUrlPath =FilePathConstants.BackgroundUrlPath.replaceAll("\\\\","//");
			} else {		//linux
				FilePathConstants.FontsPath = FilePathConstants.FontsPath.replaceAll("\\\\","/");
				FilePathConstants.DiymmsFilePath = FilePathConstants.DiymmsFilePath.replaceAll("\\\\","/");
				FilePathConstants.AccessoriesFilePath = FilePathConstants.AccessoriesFilePath.replaceAll("\\\\","/");
				FilePathConstants.MusicFilePath = FilePathConstants.MusicFilePath.replaceAll("\\\\","/");
				FilePathConstants.PhotoFrameFilePath = FilePathConstants.PhotoFrameFilePath.replaceAll("\\\\","/");
				FilePathConstants.PostMarkFilePath = FilePathConstants.PostMarkFilePath.replaceAll("\\\\","/");
				FilePathConstants.StampsFilePath = FilePathConstants.StampsFilePath.replaceAll("\\\\","/");
				FilePathConstants.TempDataFilePath = FilePathConstants.TempDataFilePath.replaceAll("\\\\","/");
				FilePathConstants.UserDataFilePath = FilePathConstants.UserDataFilePath.replaceAll("\\\\","/");
				FilePathConstants.SystemDataFilePath = FilePathConstants.SystemDataFilePath.replaceAll("\\\\","/");
				FilePathConstants.RootFilePath = FilePathConstants.RootFilePath.replaceAll("\\\\","/");
				FilePathConstants.TemplateCardPath = FilePathConstants.TemplateCardPath.replaceAll("\\\\","/");
				FilePathConstants.BackgroundUrlPath = FilePathConstants.BackgroundUrlPath.replaceAll("\\\\","/");
			}
			filePathConstants.initPathManage();
			StartUpThread start = new StartUpThread();
			Thread t = new Thread(start);
			t.start();
			//socket接收文件
			Integer serverPort = config.getInteger("ServerSocketPort", 11111);
			new MmsServerSocket(serverPort, FilePathConstants.TempDataFilePath).start();  
		}
		chain.doFilter(request,response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	

}
