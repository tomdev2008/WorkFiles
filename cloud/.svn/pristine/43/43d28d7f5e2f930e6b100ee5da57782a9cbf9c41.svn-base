package jeecg.system.listener;

import java.io.File;

import javax.servlet.ServletContextEvent;

import jeecg.kxcomm.util.PathConstants;
import jeecg.system.service.SystemService;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


/**
 * 系统初始化监听器,在系统启动时运行,进行一些初始化工作
 * @author laien
 *
 */
public class InitListener  implements javax.servlet.ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		SystemService systemService = (SystemService) webApplicationContext.getBean("systemService");
		//对数据字典进行缓存
		systemService.initAllTypeGroups();
		PathConstants.CurrentDirectory = event.getServletContext().getRealPath(File.separator) ;
		java.util.Properties prop = System.getProperties();		
		String os = prop.getProperty("os.name");		
		if(os.startsWith("win") || os.startsWith("Win")) {//windows操作系统
			PathConstants.CurrentDirectory =PathConstants.CurrentDirectory.replaceAll("\\\\","//");
		} else {		//linux
			PathConstants.CurrentDirectory = PathConstants.CurrentDirectory.replaceAll("\\\\","/");
		}
		PathConstants.mkdirs();
		System.out.println("**********************************************PathConstants.CurrentDirectory:"+PathConstants.CurrentDirectory);
	}
}
