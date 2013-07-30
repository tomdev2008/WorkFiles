import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class MakeBigData {
	/** 
	 * 获取随机日期 
	 * @param begindate 起始日期，格式为：yyyy-mm-dd 
	 * @param enddate 结束日期，格式为：yyyy-mm-dd 
	 * @return 
	 */
	private static String randomdate(String begindate,String  enddate ){ 
		try { 
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			Date start = format.parse(begindate);//构造开始日期 
			Date end = format.parse(enddate);//构造结束日期 
			//gettime()表示返回自 1970 年 1 月 1 日 00:00:00 gmt 以来此 date 对象表示的毫秒数。 
			if(start.getTime() >= end.getTime()){ 
				return null; 
			} 
			long date = random(start.getTime(),end.getTime()); 
			return format.format(new Date(date)); 
		} catch (Exception e) { 
			e.printStackTrace();
		} 
		return null; 
	} 
	private static long random(long begin,long end){ 
		long rtn = begin + (long)(Math.random() * (end - begin)); 
		//如果返回的是开始时间和结束时间，则递归调用本函数查找随机值 
		if(rtn == begin || rtn == end){  
			return random(begin,end); 
		} 
		return rtn; 
	} 

	/**
	 * @author DongGod
	 * 输出大模拟大数据   号码,URL,时间,2Gor3G,iemi号,content_type,网络状态码404之类,文件大小
	 * @param args
	 * @throws IOException
	 */
	public static void main(String args[]) throws IOException {
//		for(int i=0;i<100;i++){
//								System.out.println(MakeBigData.randomdate("2013-01-01 00:00:00", "2013-04-03 23:59:59"));
//							    System.out.println((int) (Math.random() * 5000));
//		}

		File file = new File("E://haha.txt");	
		BufferedWriter fileWriter = null;
		try {
			fileWriter = new BufferedWriter(
					new FileWriter(file, true));
			Long number=13000000000l;//号码
			String url="http://www.baidu.com";
			String onlineType="2G";
			Long imei=460030912121001l;
			String content_type="text/html;charset=GBK";
			String state_code="404";
			for(int i=0;i<10000000;i++){
				if(i%2==0){
					onlineType="2G";
				}else{
					onlineType="3G";
				}
				if(i%3==0){
					url="www.163.com";
				}
				else if(i%4==0){
					url="http://www.126.com";
					content_type="text/html;charset=UTF8";
					state_code="500";
				}
				else if(i%5==0){
					url="http://www.17173.com";
					content_type="no way";
					state_code="302";
				}
				fileWriter.write(number+",");
				fileWriter.write(MakeBigData.randomdate("2013-01-01 00:00:00", "2013-04-03 23:59:59")+",");
				fileWriter.write(url+",");
				fileWriter.write(onlineType+",");
			    fileWriter.write(imei+",");
			    fileWriter.write(content_type+",");
			    fileWriter.write(state_code+",");
				fileWriter.write((int) (Math.random() * 5000)+"");
				fileWriter.newLine();
				imei++;
				number++;
			}
			fileWriter.flush();
		} catch (IOException e) {

			fileWriter.close();
			e.printStackTrace();
		}

	}
}
