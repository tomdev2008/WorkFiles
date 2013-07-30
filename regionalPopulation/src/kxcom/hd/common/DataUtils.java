package kxcom.hd.common;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class DataUtils {
	public static final String FILE_NAME="data.txt";
	public static final String DIRECTORY_NAME="e:/";

	public static final String[] PHONE_PREFIX={"130","131","132","155","156","186"};
	/**
	 * 鏃堕棿鐢熸垚鏃堕棿
	 * @param begindate
	 * @param enddate
	 * @return
	 */
	private static String randomdate(String begindate,String  enddate ){ 
		try { 
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss"); 
			Date start = format.parse(begindate); 
			Date end = format.parse(enddate);
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

	/**
	 * long鐢熸垚鍣�
	 * @param begin
	 * @param end
	 * @return
	 */
	private static long random(long begin,long end){ 
		long rtn = begin + (long)(Math.random() * (end - begin)); 
		if(rtn == begin || rtn == end){  
			return random(begin,end); 
		} 

		return rtn; 
	} 

	/**
	 * double鐢熸垚鍣�
	 * @param begin
	 * @param end
	 * @return
	 */
	private static String randomDouble(int begin,int end){
		double rtn = begin + (Math.random() * (end - begin)); 

		if(rtn == begin || rtn == end){  
			return randomDouble(begin,end); 
		} 
		DecimalFormat df=new DecimalFormat(".######");
		String st=df.format(rtn);
		return st; 
	}

	/**
	 * 鐢熸垚鐢佃瘽鍙风爜鍚庨潰9涓綅鏁�
	 * @param start
	 * @param max
	 * @return
	 */
	private static String randomNine(long start,long max){
		long templong=random(start,max);
		String tempstr=Long.toString(templong);
		StringBuilder builder=new StringBuilder(tempstr);
		for(;builder.length()<8;){
			builder.append("0");
		}
		return builder.toString();
	}
	/**
	 * 鐢熸垚鐢佃瘽鍙风爜
	 * @return
	 */
	private static String createMobileNum(){
		int index=(int) (Math.random()*10);
		if(index<6){
			String prefix= PHONE_PREFIX[index];
			String sufix=randomNine(99999999,0);
			return prefix+sufix;
		}else{
			return createMobileNum();
		}
	}

	/**
	 * 生成电话号码,经度,纬度,时间,性别,年龄的大数据方法
	 * @throws IOException
	 * @throws SQLException
	 */
	public static void writeToFile() throws IOException, SQLException{
		File file=new File(DIRECTORY_NAME,FILE_NAME);
		if(!file.exists()){
			file.createNewFile();
		}
		BufferedWriter fileWriter = new BufferedWriter(
				new FileWriter(file, true));
		for(int i=0;i<100000;i++){
			String datetime=randomdate("20120501123456", "20120530223456");
			String mobilenum=createMobileNum();			
			double jindu=Math.random()*100;
			double weidu=Math.random()*100;	
			int sex=(int) (Math.random()*100);
			int age=(int) (Math.random()*50+18);
			StringBuffer buffer=new StringBuffer();
			buffer.append(mobilenum);
			buffer.append("\t");
			buffer.append(randomDouble(112, 114));
			buffer.append("\t");
			buffer.append(randomDouble(22, 24));
			buffer.append("\t");
			buffer.append(datetime);
			buffer.append("\t");
			if(sex%2==0){//判断随机数整取2的条件生成 男女比例
				buffer.append(1);
			}else{
				buffer.append(0);
			}
			buffer.append("\t");
			buffer.append(age);
			buffer.append("\n");

			fileWriter.write(buffer.toString());


			//			String str=i%3==0?"C":(i%2==0?"B":"A");
			//
			//			psmt.setString(2,mobilenum);
			//			psmt.setString(1,"gaoxing");
			//			psmt.setString(3,str );
			//			psmt.setDouble(4,Math.random()*1000);
			//			
			//			psmt.addBatch();
			//			if(i%50==0){
			//				psmt.executeBatch();
			//			}
		}
		//		psmt.close();
		//		conn.close();
		fileWriter.flush();
		fileWriter.close();
	}

	public static void writeDateIntoMysql() throws Exception{
		Connection conn=DBManager.getInstance().getConnection();
		String sql="insert into tb_user(user_name,sex,phone,longitude,latitude,state) values (?,?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		int sex=0;int state=0;
		for(int i=0;i<10000;i++){
			String mobilenum=createMobileNum();			
			double jindu=Math.random()*100;
			double weidu=Math.random()*100;		
			psmt.setString(1,"nonamenow");
			sex=0;
			if(i%3==0)sex=1;
			psmt.setInt(2,sex);
			psmt.setString(3,mobilenum);
			psmt.setString(4,randomDouble(112, 114));
			psmt.setString(5,randomDouble(22, 24));
			state=0;
			if(i%3==0)state=1;
			psmt.setInt(6,state);
			psmt.addBatch();
			if(i%1000==0){
				psmt.executeBatch();
			}
		}
		psmt.close();
		conn.close();
	}


	public static void main(String[] args) throws IOException, SQLException {
		System.out.println("zhang jian hua is god");
//		writeToFile();
		try {
			writeDateIntoMysql();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
