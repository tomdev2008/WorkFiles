package jeecg.kxcomm.util;

import java.util.HashMap;

import org.apache.log4j.Logger;

public class BusinessUtil {

	private static final Logger LOGGER = Logger.getLogger(BusinessUtil.class);
	
	/**
	 * 导入excel用到的常量
	 */
	public static final String FIRST_VALUE = "姓名"; //excel以“姓名”开始的行
	public static final Integer TITLE_ROWS = 9; //excel表头行数
	public static final Integer BEGIN_DATE = 12; //数据开始行
	public static final String FIRST_COL_VALUE = "姓名";
	public static final String SECOND_COL_VALUE = "登记号码";
	public static final String THIRD_COL_VALUE = "班次时段";
	public static final String END_COL = "应到";
	
	/**
	 * 考勤状态
	 */
	public static final String normal = "0";  		//正常
	public static final String noSign = "1"; 		//未签到
	public static final String noSignOff = "2";		//未签退
	public static final String Absenteeism = "3";	//	旷工
	public static final String beLate = "4";		//	迟到
	public static final String leaveEarly = "5";	//	早退
	public static final String overTime = "6";		//加班
	public static final String out = "7";			//	外出
	public static final String goingOut = "8";		//	因公外出
	public static final String publicOut = "9";		//	公出
	public static final String sickLeave = "10";		//	病假
	public static final String leave = "11";			//	事假
	public static final String homeLeave = "12";		//	探亲假
	public static final String travel = "13";		//	出差
	public static final String fiftyOne = "14";		//	五一/国庆
	public static final String annualLeave = "15";	//	年休假
	public static final String bereavementLeave = "16";	//	丧假
	public static final String marriage = "17";		//	婚假
	public static final String maternityLeave = "18";//	产假
	public static final HashMap<String,String> check_stats=new HashMap<String,String>(){
		{
			put("","0");
			put("[","1");
			put("]","2");
			put("矿","3");
			put(">","4");
			put("<","5");
			put("+","6");
			put("L","7");
			put("}","8");
			put("G","9");
			put("B","10");
			put("s","11");
			put("T","12");
			put("差","13");
			put("J","14");
			put("N","15");
			put("S","16");
			put("H","17");
			put("C","18");
		}
	};
	
	public static final String TO_PURCHASE = "待采购"; //待采购
	public static final String PURCHASE_ING = "采购中"; //采购中
	public static final String END_PURCHASE = "已采购"; //已采购
	
	/********************************OA审核状态start*********************************/
	//审核中_0,未审核_1,销售区域经理审核通过(采购主管)_2,销售区域经理审核未通过(采购主管)_3,法律人员审核通过_4,法律人员审核未通过_5,
	//副经理审核通过_6,副经理审核未通过_7,经理审核通过_8,经理审核未通过_9
	public static final String OA_ADUITING = "0";
	public static final String OA_NOADUIT = "1";
	public static final String OA_SALEMANAGERADUIT = "2";
	public static final String OA_SALEMANAGERNOADUIT = "3";
	public static final String OA_LAWADUIT = "4";
	public static final String OA_LAWNOADUIT = "5";
	public static final String OA_SECONDMANAGERADUIT = "6";
	public static final String OA_SECONDMANAGERNOADUIT = "7";
	public static final String OA_MANAGERADUIT = "8";
	public static final String OA_MANAGERNOADUIT = "9";
	/********************************OA审核状态end**********************************/
}
