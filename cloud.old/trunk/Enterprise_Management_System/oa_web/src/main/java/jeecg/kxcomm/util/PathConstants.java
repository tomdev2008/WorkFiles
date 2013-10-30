package jeecg.kxcomm.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;


public class PathConstants {
	private static PathConstants instance = null;
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
	private static String date = df.format(new Date());
	private PathConstants(){
		
		date = df.format(new Date());
	}
	public static PathConstants getInstance(){
		if(instance == null)
			instance = new PathConstants();
		return instance;
	}
	/**
	 * 导出采购合同的excel,磁盘绝对路径
	 */
	public static String CurrentDirectory  = "";  
	public static String ExportPurchaseContractUrl = "/Export/PurchaseContract/"+date+"/";  
	public static String ExportQuotations = "/Export/quotations/";  
	public static String path ="";// request.getContextPath();
	//http地址localhost:8080/kx
	public static String  basePath ="";// request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	public static void mkdirs(){
		File file = new File(CurrentDirectory+ExportPurchaseContractUrl);
		if(!file.isDirectory()){
			file.mkdirs();
			System.out.println("创建导出采购合同目录:"+file.getAbsolutePath());
		}
		file = new File(CurrentDirectory+ExportQuotations);
		if(!file.isDirectory()){
			file.mkdirs();
			System.out.println("创建导出报价表目录:"+file.getAbsolutePath());
		}
	}
}
