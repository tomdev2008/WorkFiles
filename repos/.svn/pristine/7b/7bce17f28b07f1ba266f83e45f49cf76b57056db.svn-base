package com.unicom.mms.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 
 * @author chenhuui
 *
 */
public class DateUtil{

  public DateUtil(){}

  public static Date parse(String date) throws ParseException{
  	SimpleDateFormat format= new SimpleDateFormat("yyyyMMddHHmmss");
    return format.parse(date);
  }
  
  public static Date parseShortDate(String date) throws ParseException{
  	SimpleDateFormat shortformat= new SimpleDateFormat("yyyyMMdd");
    return shortformat.parse(date); 
  }
  
  public static String format(Date date){
  	SimpleDateFormat format= new SimpleDateFormat("yyyyMMddHHmmss");
    return format.format(date);
  }
  
  public static String formatToSocket(Date date){
	  	SimpleDateFormat format= new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	    return format.format(date);
	  }
  
  
  public static String formatToMs(Date date){
	  	SimpleDateFormat format= new SimpleDateFormat("yyyyMMddHHmmssms");
	    return format.format(date);
	  }
  
  public static String format(Date date,int length){
    if(length>=14)return format(date);
    return format(date).substring(0,length);
  }
  
  public static String standFormat(Date date){
  	SimpleDateFormat stand=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    return stand.format(date);
  }
  
  public static int getMonth(){
    return Calendar.getInstance().get(Calendar.MONTH)+1;
  }
  public static String getDate(Date date){
		if(date==null)return null;
	    StringBuffer sb=new StringBuffer();
	    Calendar calendar=Calendar.getInstance();
	    calendar.setTime(date);
	    int year=calendar.get(Calendar.YEAR);
	    sb.append(year);
	    int month=calendar.get(Calendar.MONTH)+1;
	    if(month<=9)sb.append('0');
	    sb.append(month);
	    int day=calendar.get(Calendar.DAY_OF_MONTH);
	    if(day<=9)sb.append('0');
	    sb.append(day);
	    int hour=calendar.get(Calendar.HOUR_OF_DAY);
	    if(hour<=9)sb.append('0');
	    sb.append(hour);
	    int mi=calendar.get(Calendar.MINUTE);
	    if(mi<=9)sb.append('0');
	    sb.append(mi);
	    int sec=calendar.get(Calendar.SECOND);
	    if(sec<=9)sb.append('0');
	    sb.append(sec);
	    return sb.toString();
	  }
  
  /**
   * 
  * package_name: cn.zoomtech.ejsms.common
  * file_name:    DateUtil.java
  * description: 字符串补空格
  * 2011-6-1下午02:15:05
  * Author: chenhui
   * @param resoure
   * @param num
   * @return
   */
  public static String parseString(String resoure,int num){
	  StringBuilder oneStringBuilder=new StringBuilder();
	  if(resoure==null){
		  for(int i=num;i>0;i--){
			  oneStringBuilder.append(" ");
		  }
		  return oneStringBuilder.toString();
	  }
	  int size=resoure.length();
	  if(size>=num) return resoure.substring(0, num);
	  else{
		  int len=num-size;
		  oneStringBuilder.append(resoure);
		  for(int i=len;i>0;i--){
			  oneStringBuilder.append(" ");
		  }
		  return oneStringBuilder.toString();
	  }
  }
  /**
   * 
  * package_name: cn.zoomtech.ejsms.common
  * file_name:    DateUtil.java
  * description: 字符串补0
  * 2011-6-1下午02:14:15
  * Author: chenhui
   * @param resoure 旧字符串
   * @param num  新串长度
   * @return 新串
   */
  public static String parseInt(String resoure,int num){
	  StringBuilder oneStringBuilder=new StringBuilder();
	  if(resoure==null){
		  for(int i=num;i>0;i--){
			  oneStringBuilder.append("0");
		  }
		  return oneStringBuilder.toString();
	  }
	  int size=resoure.length();
	  if(size>=num) return resoure.substring(0, num);
	  else{
		  int len=num-size;
		  oneStringBuilder.append(resoure);
		  for(int i=len;i>0;i--){
			  oneStringBuilder.append("0");
		  }
		  return oneStringBuilder.toString();
	  }
  }
}
