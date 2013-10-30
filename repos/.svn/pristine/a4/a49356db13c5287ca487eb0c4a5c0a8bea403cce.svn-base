package com.unicom.mms.constants;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
* 功能描述:公共工具类
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-10-26
* @author chenliang 修改日期：2013-10-26
* @since mms-share
 */
public class ToolUtil {

	/**
	 * 
	* 方法用途和描述: 生成19数字的短信，彩信的消息id
	* @return
	* @author chenliang 新增日期：2013-10-26
	* @since mms-mcp
	 */
	public static String generateMsgSn(int type){
		//消息id生成格式16位yyyyMMddhhmmss+4位随机数+1(短信)\2(彩信)
		//当前时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String dateStr = sdf.format(new Date());
		//随机四位数
		int random = (int) (Math.random()*9000+1000);
		System.out.println("random:"+random);
		//短信或彩信
		String result = "";
		if(SharePublicContants.SMS == type){
			result = dateStr+random+SharePublicContants.SMS;
		}else if(SharePublicContants.MMS == type){
			result = dateStr+random+SharePublicContants.MMS;
		}else{
			System.out.println("Type is error.");
		}
		System.out.println("生成的消息id["+result+"]");
		return result;
	}
}
