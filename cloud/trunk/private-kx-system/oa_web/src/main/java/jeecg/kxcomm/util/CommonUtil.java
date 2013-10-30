package jeecg.kxcomm.util;

import java.text.DecimalFormat;

import org.apache.log4j.Logger;

public class CommonUtil {
	private static final Logger LOGGER = Logger.getLogger(CommonUtil.class);
	private static CommonUtil commonUtil=null;
	private CommonUtil(){	}
	public static CommonUtil getInstance(){
		if(commonUtil==null){
			commonUtil = new CommonUtil();
		}
			return commonUtil;
	}
	
	/**
	 * 
	 * 四舍五入数值计算方法
	 * 
	 * @param num
	 * @param dotNum 小数点个数 0:整数 1:一位小数 2:两位小数 3:三位小数如此类推
	 * @param change 是否转换
	 * @return
	 * @author zhangjh 新增日期：2013-10-16
	 * @since private-kx-system
	 */
	public String numberFormat(String num,int dotNum,boolean change){
		if(!change)
			return num;
		
		DecimalFormat df = null;
		switch (dotNum) {
		case 0:
			df = new DecimalFormat("#");
			break;
		case 1:
			df = new DecimalFormat("#.0");
			break;
		case 2:
			df = new DecimalFormat("#.00");
			break;
		case 3:
			df = new DecimalFormat("#.000");
			break;
		case 4:
			df = new DecimalFormat("#.0000");
			break;
		default:
			df = new DecimalFormat("#");
			break;
		}
		double n = Double.parseDouble(num);

		String res = df.format(n);
		LOGGER.info(num + "是：" + res);
		return res;
	}
	
	public static void main(String[] args){
		CommonUtil a =CommonUtil.getInstance();
		String ss = a.numberFormat("1.993999999",0,true);
		System.out.println(ss);
	}
}
