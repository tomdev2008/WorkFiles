package jeecg.kxcomm.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;


public class PathConstants {
	private static PathConstants instance = null;
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
	private static String date = df.format(new Date());
	private PathConstants(){
		
	}
	public static PathConstants getInstance(){
		if(instance == null)
			instance = new PathConstants();
		return instance;
	}
	/**
	 * 导出采购合同的excel,绝对目录
	 */
	public static String CurrentDirectory  = "";  
	public static String ExportPurchaseContractUrl = "/PurchaseContract/"+date+"/";  
	public static String path ="";// request.getContextPath();
	public static String  basePath ="";// request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	public static void mkdirs(){
		File fdir = new File(CurrentDirectory+ExportPurchaseContractUrl);
		if (!fdir.exists()) {
			fdir.mkdirs();
			System.out.println("********************创建导出采购合同目录:"+fdir.getAbsolutePath());
		}
	}
}
