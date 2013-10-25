 package mms.tool;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

public class Tool {
	public static int chineseLength(String value) {
		int valueLength = 0;
		String chinese = "[\u0391-\uFFE5]";
		/* 获取字段值的长度，如果含中文字符，则每个中文字符长度为2，否则为1 */
		for (int i = 0; i < value.length(); i++) {
			/* 获取一个字符 */
			String temp = value.substring(i, i + 1);
			/* 判断是否为中文字符 */
			if (temp.matches(chinese)) {
				/* 中文字符长度为2 */
				valueLength += 2;
			} else {
				/* 其他字符长度为1 */
				valueLength += 1;
			}
		}
		return valueLength;
	}

	public static boolean isChineseChar(char c)
			throws UnsupportedEncodingException {
		// 如果字节数大于1，是汉字
		// 以这种方式区别英文字母和中文汉字并不是十分严谨，但在这个题目中，这样判断已经足够了
		//
		return String.valueOf(c).getBytes().length > 1;
	}

	public static String substring(String orignal, int count)
			throws UnsupportedEncodingException {
		if (orignal != null && !"".equals(orignal)) {
			// 将原始字符串转换为GBK编码格式
			// orignal = new String(orignal.getBytes(), "UTF-8");
			orignal = new String(orignal.getBytes());
			// 要截取的字节数大于0，且小于原始字符串的字节数
			// if (count > 0 && count < orignal.getBytes("UTF-8").length) {
			if (count > 0 && count < orignal.getBytes().length) {
				StringBuffer buff = new StringBuffer();
				char c;
				for (int i = 0; i < count; i++) {
					c = orignal.charAt(i);
					buff.append(c);
					if (Tool.isChineseChar(c)) {
						// 遇到中文汉字，截取字节总数减1
						--count;
					}
				}
				return buff.toString();
			}
		}
		return orignal;
	}

	public static void main(String args[]) throws UnsupportedEncodingException {
		String a = "有人对你一见钟情，当TA第二次遇见你。";
		int bc = a.indexOf("，当");
		System.out.println(bc);
	}
	private static Map<String,Hashtable<String,String>> map = new HashMap<String,Hashtable<String,String>>();
	private static Map<String,Hashtable<String,String>> bgMap = new HashMap<String,Hashtable<String,String>>();
	public static void reInit(){
		Hashtable<String,String> hashtable = new Hashtable<String,String>();
		hashtable.put("imgPath", "images/mask.jpg");
		hashtable.put("text","有人对你一见钟情，当TA第二次遇见你。");
		map.put("img1", hashtable);
		
		hashtable = new Hashtable<String,String>();
		hashtable.put("imgPath", "images/czdlq.jpg");
		hashtable.put("text","别收起好奇心，世界比我们想象更丰富多彩。");
		map.put("img2", hashtable);
		
		hashtable = new Hashtable<String,String>();
		hashtable.put("imgPath", "images/qrjkl.jpg");
		hashtable.put("text","这星球　　　　　有无数花园，　　你却是　　　　　我独一无二的花。");
		map.put("img3", hashtable);
		
		hashtable = new Hashtable<String,String>();
		hashtable.put("imgPath", "images/hnltx.jpg");
		hashtable.put("text","学生时代一起吃泡面的旧时光，你还记得吗？");
		map.put("img4", hashtable);
		
		hashtable = new Hashtable<String,String>();
		hashtable.put("imgPath", "images/maskCAQU34FG-16.jpg");
		hashtable.put("text","前方那一盏光亮，感谢你为我而提。");
		map.put("img5", hashtable);		
		
		hashtable = new Hashtable<String,String>();
		hashtable.put("imgPath", "images/maskCAW6HHS3-18.jpg");
		hashtable.put("text","学生时代是那么的难忘");
		map.put("img6", hashtable);		
		
		hashtable = new Hashtable<String,String>();
		hashtable.put("imgPath", "images/mask11.jpg");
		hashtable.put("text","心的岛屿，你在哪里？");
		map.put("img7", hashtable);		
		
		hashtable = new Hashtable<String,String>();
		hashtable.put("imgPath", "images/maskCAK1F5Q-15.jpg");
		hashtable.put("text","没有时间？那就用眼睛去旅行。");
		map.put("img8", hashtable);		
		
		hashtable = new Hashtable<String,String>();
		hashtable.put("imgPath", "images/mask12.jpg");
		hashtable.put("text","久未联系，却不曾疏远。");
		map.put("img9", hashtable);		
		
		hashtable = new Hashtable<String,String>();
		hashtable.put("imgPath", "images/mask13.jpg");
		hashtable.put("text","一起喝完这杯咖啡，留下丝丝回忆");
		map.put("img10", hashtable);		
		
		hashtable = new Hashtable<String,String>();
		hashtable.put("imgPath", "images/mask-17.jpg");
		hashtable.put("text","你在我心里投下了一圈倒影");
		map.put("img11", hashtable);		
		
		hashtable = new Hashtable<String,String>();
		hashtable.put("imgPath", "images/mask14.jpg");
		hashtable.put("text","Merry Christmas! 你的圣诞愿望是什么呢？");
		map.put("img12", hashtable);		
		
		Hashtable<String,String> bgdata = new Hashtable<String,String>();
		
		bgdata.put("rangeStamp", "MARGIN-TOP: 37px; WIDTH: 78px; HEIGHT: 88px;VISIBILITY: hidden; MARGIN-LEFT: 38px; CURSOR: pointer");
		bgdata.put("rangePostmark", "MARGIN-TOP: 58px; WIDTH: 83px; HEIGHT: 82px; VISIBILITY: hidden;  MARGIN-LEFT: 70px; CURSOR: pointer");
		bgdata.put("rangeText", "MARGIN-TOP: 34px; WIDTH: 350px; HEIGHT: 86px;VISIBILITY: hidden; MARGIN-LEFT: 155px");
		bgdata.put("layerMover", "MARGIN: 60px 0px 0px 42px; VISIBILITY: hidden;");
		bgdata.put("layerMask", "MARGIN: 0px; WIDTH: 540px; BACKGROUND: url(../common/testImages/test/bgpicture/bg10.png) no-repeat; HEIGHT: 540px; COLOR: #000");
		bgdata.put("layerPhoto", "MARGIN: 153px 0px 0px 42px; WIDTH: 460px; HEIGHT: 318px; COLOR: #000;");
		bgdata.put("layerStamp", "MARGIN: 37px 0px 0px 38px; WIDTH: 78px; BACKGROUND: url(../common/testImages/test/keep/keep_10.png) no-repeat; HEIGHT: 88px; COLOR: #000");
		bgdata.put("layerPostmark", "MARGIN: 58px 0px 0px 70px; WIDTH: 83px; BACKGROUND: url(../common/testImages/test/postMark/postmark_07.png) no-repeat; HEIGHT: 82px; COLOR: #000");
		bgdata.put("rangePhoto", "MARGIN-TOP: 153px; WIDTH: 460px; HEIGHT: 318px;VISIBILITY: hidden; MARGIN-LEFT: 42px");
		bgdata.put("layerText", "MARGIN: 34px 0px 0px 155px; WIDTH: 350px; HEIGHT: 86px; COLOR: #000000; FONT-SIZE: 16px");
		bgdata.put("img2-margin", "-93px 0px 0px");
		bgdata.put("img2-width", "575px");
		bgdata.put("img2-height", "411px");
		//bgdata.put("img1", "MARGIN: 0px; WIDTH: 575px; HEIGHT: 411px; cursor: move;");
		bgdata.put("img1-margin", "0px");
		bgdata.put("img1-width", "575px");
		bgdata.put("img1-height", "411px");
		bgMap.put("bg10", bgdata);
		
		bgdata = new Hashtable<String,String>();
		
		bgdata.put("rangeStamp", "MARGIN-TOP: 30px; WIDTH: 78px; HEIGHT: 88px; VISIBILITY: hidden;MARGIN-LEFT: 441px; CURSOR: pointer");
		bgdata.put("rangePostmark", "MARGIN-TOP: 18px; WIDTH: 83px; HEIGHT: 82px; VISIBILITY: hidden; MARGIN-LEFT: 385px; CURSOR: pointer");
		bgdata.put("rangeText", "MARGIN-TOP: 165px; WIDTH: 173px; HEIGHT: 120px; VISIBILITY: hidden; MARGIN-LEFT: 339px");
		bgdata.put("layerMover", "MARGIN: 31px 0px 0px 19px; VISIBILITY: hidden");
		bgdata.put("layerMask", "MARGIN: 0px; WIDTH: 540px; BACKGROUND: url(../common/testImages/test/bgpicture/bg1.png) no-repeat; HEIGHT: 400px; COLOR: #000");
		bgdata.put("layerPhoto", "MARGIN: 48px 0px 0px 19px; WIDTH: 297px; HEIGHT: 275px; COLOR: #000");
		bgdata.put("layerStamp", "MARGIN: 30px 0px 0px 441px; WIDTH: 78px; BACKGROUND: url(../common/testImages/test/keep/keep_10.png) no-repeat; HEIGHT: 88px; COLOR: #000");
		bgdata.put("layerPostmark", "MARGIN: 18px 0px 0px 385px; WIDTH: 83px; BACKGROUND: url(../common/testImages/test/postMark/postmark_03.png) no-repeat; HEIGHT: 82px; COLOR: #000");
		bgdata.put("rangePhoto", "MARGIN-TOP: 48px; WIDTH: 297px; HEIGHT: 275px; VISIBILITY: hidden; MARGIN-LEFT: 32px");
		bgdata.put("layerText", "MARGIN: 165px 0px 0px 339px; WIDTH: 173px; HEIGHT: 120px; COLOR: #000000; FONT-SIZE: 16px");
		//bgdata.put("img2", "MARGIN: -17px 0px 0px -12px; WIDTH: 424px; HEIGHT: 302px");
		//bgdata.put("img1", "MARGIN: 0px; WIDTH: 424px; HEIGHT: 302px");
		bgdata.put("img2-margin", "-17px 0px 0px ");
		bgdata.put("img2-width", "424px");
		bgdata.put("img2-height", "302px");
		//bgdata.put("img1", "MARGIN: 0px; WIDTH: 575px; HEIGHT: 411px; cursor: move;");
		bgdata.put("img1-margin", "0");
		bgdata.put("img1-width", "424px");
		bgdata.put("img1-height", "302px");
		bgMap.put("bg1", bgdata);
		
		bgdata = new Hashtable<String,String>();
		
		bgdata.put("rangeStamp", "MARGIN-TOP: 20px; WIDTH: 78px; HEIGHT: 88px; VISIBILITY: hidden; MARGIN-LEFT: 450px; CURSOR: pointer");
		bgdata.put("rangePostmark", "MARGIN-TOP: 35px; WIDTH: 83px; HEIGHT: 82px; VISIBILITY: hidden; MARGIN-LEFT: 410px; CURSOR: pointer");
		bgdata.put("rangeText", "MARGIN-TOP: 445px; WIDTH: 420px; HEIGHT: 98px; VISIBILITY: hidden; MARGIN-LEFT: 56px");
		bgdata.put("layerText", "MARGIN: 445px 0px 0px 56px; WIDTH: 420px; HEIGHT: 98px; COLOR: #ffffff; FONT-SIZE: 16px");
		bgdata.put("layerMover", "MARGIN: -4px 0px 0px 75px; VISIBILITY: hidden");
		bgdata.put("layerMask", "MARGIN: 0px; WIDTH: 540px; BACKGROUND: url(../common/testImages/test/bgpicture/bg2.png) no-repeat; HEIGHT: 595px; COLOR: #000");
		bgdata.put("layerPhoto", "MARGIN: 27px 0px 0px 75px; WIDTH: 302px; HEIGHT: 199px; COLOR: #000");
		bgdata.put("layerStamp", "MARGIN: 20px 0px 0px 450px; WIDTH: 78px; BACKGROUND: url(../common/testImages/test/keep/keep_10.png) no-repeat; HEIGHT: 88px; COLOR: #000");
		bgdata.put("layerPostmark", "MARGIN: 35px 0px 0px 410px; WIDTH: 83px; BACKGROUND: url(../common/testImages/test/postMark/postmark_03.png) no-repeat; HEIGHT: 82px; COLOR: #000");
		bgdata.put("rangePhoto", "MARGIN-TOP: 27px; WIDTH: 302px; HEIGHT: 199px; VISIBILITY: hidden; MARGIN-LEFT: 75px");
		
		//bgdata.put("img2", "MARGIN: -17px 0px 0px -12px; WIDTH: 424px; HEIGHT: 302px");
		//bgdata.put("img1", "MARGIN: 0px; WIDTH: 424px; HEIGHT: 302px");
		bgdata.put("img2-margin", "-31px 0px 0px");
		bgdata.put("img2-width", "332px");
		bgdata.put("img2-height", "236px");
		//bgdata.put("img1", "MARGIN: 0px; WIDTH: 575px; HEIGHT: 411px; cursor: move;");
		bgdata.put("img1-margin", "0px");
		bgdata.put("img1-width", "332px");
		bgdata.put("img1-height", "236px");
		bgMap.put("bg2", bgdata);
		
		
		bgdata = new Hashtable<String,String>();
		
		bgdata.put("rangeStamp", "MARGIN-TOP: 338px; WIDTH: 78px; HEIGHT: 88px; VISIBILITY: hidden; MARGIN-LEFT: 440px; CURSOR: pointer");
		bgdata.put("rangePostmark", "MARGIN-TOP: 366px; WIDTH: 83px; HEIGHT: 90px; VISIBILITY: hidden; MARGIN-LEFT: 393px; CURSOR: pointer");
		bgdata.put("rangeText", "MARGIN-TOP: 354px; WIDTH: 353px; HEIGHT: 86px; VISIBILITY: hidden; MARGIN-LEFT: 38px");
		bgdata.put("layerText", "MARGIN: 354px 0px 0px 38px; WIDTH: 353px; HEIGHT: 86px; COLOR: #000000; FONT-SIZE: 16px");
		bgdata.put("layerMover", "MARGIN: 36px 0px 0px 37px; VISIBILITY: hidden");
		bgdata.put("layerMask", "MARGIN: 0px; WIDTH: 540px; BACKGROUND: url(../common/testImages/test/bgpicture/bg3.png) no-repeat; HEIGHT: 500px; COLOR: #000");
		bgdata.put("layerPhoto", "MARGIN: 36px 0px 0px 37px; WIDTH: 353px; HEIGHT: 275px; COLOR: #000");
		bgdata.put("layerStamp", "MARGIN: 338px 0px 0px 440px; WIDTH: 78px; BACKGROUND: url(../common/testImages/test/keep/keep_10.png) no-repeat; HEIGHT: 88px; COLOR: #000");
		bgdata.put("layerPostmark", "MARGIN: 366px 0px 0px 393px; WIDTH: 83px; BACKGROUND: url(../common/testImages/test/postMark/postmark_03.png) no-repeat; HEIGHT: 90px; COLOR: #000");
		bgdata.put("rangePhoto", "MARGIN-TOP: 36px; WIDTH: 353px; HEIGHT: 275px; VISIBILITY: hidden; MARGIN-LEFT: 37px");
		bgdata.put("img2-margin", "0px 0px 0px 0px");
		bgdata.put("img2-width", "385px");
		bgdata.put("img2-height", "275px");
		bgdata.put("img1-margin", "0px");
		bgdata.put("img1-width", "385px");
		bgdata.put("img1-height", "275px");
		bgMap.put("bg3", bgdata);
		
		
		bgdata = new Hashtable<String,String>();
		
		bgdata.put("rangeStamp", "MARGIN-TOP: 28px; WIDTH: 78px; HEIGHT: 88px; VISIBILITY: hidden; MARGIN-LEFT: 430px; CURSOR: pointer");
		bgdata.put("rangePostmark", "MARGIN-TOP: 12px; WIDTH: 83px; HEIGHT: 82px; VISIBILITY: hidden; MARGIN-LEFT: 382px; CURSOR: pointer");
		bgdata.put("rangeText", "MARGIN-TOP: 116px; WIDTH: 200px; HEIGHT: 168px; VISIBILITY: hidden; MARGIN-LEFT: 309px");
		bgdata.put("layerText", "MARGIN: 116px 0px 0px 309px; WIDTH: 200px; HEIGHT: 168px; COLOR: #000000; FONT-SIZE: 16px");
		bgdata.put("layerMover", "MARGIN: 116px 0px 0px 44px; VISIBILITY: hidden");
		bgdata.put("layerMask", "MARGIN: 0px; WIDTH: 540px; BACKGROUND: url(../common/testImages/test/bgpicture/bg4.png) no-repeat; HEIGHT: 360px; COLOR: #000");
		bgdata.put("layerPhoto", "MARGIN: 116px 0px 0px 44px; WIDTH: 240px; HEIGHT: 174px; COLOR: #000");
		bgdata.put("layerStamp", "MARGIN: 28px 0px 0px 430px; WIDTH: 78px; BACKGROUND: url(../common/testImages/test/keep/keep_02.png) no-repeat; HEIGHT: 88px; COLOR: #000");
		bgdata.put("layerPostmark", "MARGIN: 12px 0px 0px 382px; WIDTH: 83px; BACKGROUND: url(../common/testImages/test/postMark/postmark_03.png) no-repeat; HEIGHT: 82px; COLOR: #000");
		bgdata.put("rangePhoto", "MARGIN-TOP: 116px; WIDTH: 240px; HEIGHT: 174px; VISIBILITY: hidden; MARGIN-LEFT: 44px");
		bgdata.put("img2-margin", "0px 0px 0px 0px");
		bgdata.put("img2-width", "267px");
		bgdata.put("img2-height", "191px");
		bgdata.put("img1-margin", "0px");
		bgdata.put("img1-width", "267px");
		bgdata.put("img1-height", "191px");
		bgMap.put("bg4", bgdata);
		
		
		
		bgdata = new Hashtable<String,String>();
		
		bgdata.put("rangeStamp", "MARGIN-TOP: 20px; WIDTH: 78px; HEIGHT: 88px; VISIBILITY: hidden; MARGIN-LEFT: 450px; CURSOR: pointer");
		bgdata.put("rangePostmark", "MARGIN-TOP: 48px; WIDTH: 83px; HEIGHT: 82px; VISIBILITY: hidden; MARGIN-LEFT: 422px; CURSOR: pointer");
		bgdata.put("rangeText", "MARGIN-TOP: 129px; WIDTH: 205px; HEIGHT: 180px; VISIBILITY: hidden; MARGIN-LEFT: 311px");
		bgdata.put("layerText", "MARGIN: 129px 0px 0px 311px; WIDTH: 205px; HEIGHT: 180px; COLOR: #000000; FONT-SIZE: 16px");
		bgdata.put("layerMover", "MARGIN: 86px 0px 0px 30px; VISIBILITY: hidden");
		bgdata.put("layerMask", "MARGIN: 0px; WIDTH: 540px; BACKGROUND: url(../common/testImages/test/bgpicture/bg5.png) no-repeat; HEIGHT: 360px; COLOR: #000");
		bgdata.put("layerPhoto", "MARGIN: 86px 0px 0px 30px; WIDTH: 215px; HEIGHT: 244px; COLOR: #000");
		bgdata.put("layerStamp", "MARGIN: 20px 0px 0px 450px; WIDTH: 78px; BACKGROUND: url(../common/testImages/test/keep/keep_02.png) no-repeat; HEIGHT: 88px; COLOR: #000");
		bgdata.put("layerPostmark", "MARGIN: 48px 0px 0px 422px; WIDTH: 83px; BACKGROUND: url(../common/testImages/test/postMark/postmark_03.png) no-repeat; HEIGHT: 82px; COLOR: #000");
		bgdata.put("rangePhoto", "MARGIN-TOP: 86px; WIDTH: 215px; HEIGHT: 244px; VISIBILITY: hidden; MARGIN-LEFT: 30px");
		bgdata.put("img2-margin", "0px 0px 0px 0px");
		bgdata.put("img2-width", "375px");
		bgdata.put("img2-height", "268px");
		bgdata.put("img1-margin", "0px");
		bgdata.put("img1-width", "375px");
		bgdata.put("img1-height", "268px");
		bgMap.put("bg5", bgdata);
		
		bgdata = new Hashtable<String,String>();
		
		bgdata.put("rangeStamp", "MARGIN-TOP: 37px; WIDTH: 78px; HEIGHT: 88px; VISIBILITY: hidden; MARGIN-LEFT: 430px; CURSOR: pointer");
		bgdata.put("rangePostmark", "MARGIN-TOP: 55px; WIDTH: 83px; HEIGHT: 82px; VISIBILITY: hidden; MARGIN-LEFT: 392px; CURSOR: pointer");
		bgdata.put("rangeText", "MARGIN-TOP: 131px; WIDTH: 176px; HEIGHT: 190px; VISIBILITY: hidden; MARGIN-LEFT: 332px");
		bgdata.put("layerText", "MARGIN: 131px 0px 0px 332px; WIDTH: 176px; HEIGHT: 190px; COLOR: #000000; FONT-SIZE: 16px");
		bgdata.put("layerMover", "MARGIN: -26px 0px 0px -181px; VISIBILITY: hidden");
		bgdata.put("layerMask", "MARGIN: 0px; WIDTH: 540px; BACKGROUND: url(../common/testImages/test/bgpicture/bg6.png) no-repeat; HEIGHT: 370px; COLOR: #000");
		bgdata.put("layerPhoto", "MARGIN: 15px 0px 0px 23px; WIDTH: 291px; HEIGHT: 291px; COLOR: #000");
		bgdata.put("layerStamp", "MARGIN: 37px 0px 0px 430px; WIDTH: 78px; BACKGROUND: url(../common/testImages/test/keep/keep_02.png) no-repeat; HEIGHT: 88px; COLOR: #000");
		bgdata.put("layerPostmark", "MARGIN: 55px 0px 0px 392px; WIDTH: 83px; BACKGROUND: url(../common/testImages/test/postMark/postmark_03.png) no-repeat; HEIGHT: 82px; COLOR: #000");
		bgdata.put("rangePhoto", "MARGIN-TOP: 15px; WIDTH: 291px; HEIGHT: 291px; VISIBILITY: hidden; MARGIN-LEFT: 23px");
		bgdata.put("img2-margin", "-41px 0px 0px -204px");
		bgdata.put("img2-width", "651px");
		bgdata.put("img2-height", "465px");
		bgdata.put("img1-margin", "0px");
		bgdata.put("img1-width", "651px");
		bgdata.put("img1-height", "465px");
		bgMap.put("bg6", bgdata);
		
		bgdata = new Hashtable<String,String>();
		
		bgdata.put("rangeStamp", "MARGIN-TOP: 255px; WIDTH: 78px; HEIGHT: 88px; VISIBILITY: hidden; MARGIN-LEFT: 19px; CURSOR: pointer");
		bgdata.put("rangePostmark", "MARGIN-TOP: 210px; WIDTH: 83px; HEIGHT: 82px; VISIBILITY: hidden; MARGIN-LEFT: 54px; CURSOR: pointer");
		bgdata.put("rangeText", "MARGIN-TOP: 205px; WIDTH: 220px; HEIGHT: 120px; VISIBILITY: hidden; MARGIN-LEFT: 220px");
		bgdata.put("layerText", "MARGIN: 205px 0px 0px 220px; WIDTH: 220px; HEIGHT: 120px; COLOR: #003366; FONT-SIZE: 16px");
		bgdata.put("layerMover", "MARGIN: 86px 0px 0px 298px; VISIBILITY: hidden");
		bgdata.put("layerMask", "MARGIN: 0px; WIDTH: 540px; BACKGROUND: url(../common/testImages/test/bgpicture/bg7.png) no-repeat; HEIGHT: 460px; COLOR: #000");
		bgdata.put("layerPhoto", "MARGIN: 86px 0px 0px 298px; WIDTH: 103px; HEIGHT: 103px; COLOR: #000");
		bgdata.put("layerStamp", "MARGIN: 255px 0px 0px 19px; WIDTH: 78px; BACKGROUND: url(../common/testImages/test/keep/keep_02.png) no-repeat; HEIGHT: 88px; COLOR: #000");
		bgdata.put("layerPostmark", "MARGIN: 210px 0px 0px 54px; WIDTH: 83px; BACKGROUND: url(../common/testImages/test/postMark/postmark_07.png) no-repeat; HEIGHT: 82px; COLOR: #000");
		bgdata.put("rangePhoto", "MARGIN-TOP: 86px; WIDTH: 103px; HEIGHT: 103px; VISIBILITY: hidden; MARGIN-LEFT: 298px");
		bgdata.put("img2-margin", "");
		bgdata.put("img2-width", "216px");
		bgdata.put("img2-height", "302px");
		bgdata.put("img1-margin", "0px");
		bgdata.put("img1-width", "216px");
		bgdata.put("img1-height", "302px");
		bgMap.put("bg7", bgdata);
		
		bgdata = new Hashtable<String,String>();
		
		bgdata.put("rangeStamp", "MARGIN-TOP: 19px; WIDTH: 78px; HEIGHT: 88px; VISIBILITY: hidden; MARGIN-LEFT: 450px; CURSOR: pointer");
		bgdata.put("rangePostmark", "MARGIN-TOP: 10px; WIDTH: 83px; HEIGHT: 82px; VISIBILITY: hidden; MARGIN-LEFT: 400px; CURSOR: pointer");
		bgdata.put("rangeText", "MARGIN-TOP: 354px; WIDTH: 220px; HEIGHT: 120px; VISIBILITY: hidden; MARGIN-LEFT: 36px");
		bgdata.put("layerText", "MARGIN: 354px 0px 0px 36px; WIDTH: 292px; HEIGHT: 122px; COLOR: #ffffff; FONT-SIZE: 16px");
		bgdata.put("layerMover", "MARGIN: 35px 0px 0px 27px; VISIBILITY: hidden");
		bgdata.put("layerMask", "MARGIN: 0px; WIDTH: 540px; BACKGROUND: url(../common/testImages/test/bgpicture/bg8.png) no-repeat; HEIGHT: 595px; COLOR: #000");
		bgdata.put("layerPhoto", "MARGIN: 35px 0px 0px 27px; WIDTH: 362px; HEIGHT: 256px; COLOR: #000");
		bgdata.put("layerStamp", "MARGIN: 19px 0px 0px 450px; WIDTH: 78px; BACKGROUND: url(../common/testImages/test/keep/keep_02.png) no-repeat; HEIGHT: 88px; COLOR: #000");
		bgdata.put("layerPostmark", "MARGIN: 10px 0px 0px 400px; WIDTH: 83px; BACKGROUND: url(../common/testImages/test/postMark/postmark_07.png) no-repeat; HEIGHT: 82px; COLOR: #000");
		bgdata.put("rangePhoto", "MARGIN-TOP: 35px; WIDTH: 362px; HEIGHT: 256px; VISIBILITY: hidden; MARGIN-LEFT: 27px");
		bgdata.put("img2-margin", "0px");
		bgdata.put("img2-width", "398px");
		bgdata.put("img2-height", "284px");
		bgdata.put("img1-margin", "0px");
		bgdata.put("img1-width", "398px");
		bgdata.put("img1-height", "284px");
		bgMap.put("bg8", bgdata);
		
		bgdata = new Hashtable<String,String>();
		
		bgdata.put("rangeStamp", "MARGIN-TOP: 20px; WIDTH: 78px; HEIGHT: 88px; VISIBILITY: hidden; MARGIN-LEFT: 450px; CURSOR: pointer");
		bgdata.put("rangePostmark", "MARGIN-TOP: 42px; WIDTH: 83px; HEIGHT: 82px; VISIBILITY: hidden; MARGIN-LEFT: 410px; CURSOR: pointer");
		bgdata.put("rangeText", "MARGIN-TOP: 120px; WIDTH: 174px; HEIGHT: 190px; VISIBILITY: hidden; MARGIN-LEFT: 350px");
		bgdata.put("layerText", "MARGIN: 120px 0px 0px 350px; WIDTH: 174px; HEIGHT: 190px; COLOR: #993300; FONT-SIZE: 16px");
		bgdata.put("layerMover", "MARGIN: 30px 0px 0px 30px; VISIBILITY: hidden");
		bgdata.put("layerMask", "MARGIN: 0px; WIDTH: 540px; BACKGROUND: url(../common/testImages/test/bgpicture/bg9.png) no-repeat; HEIGHT: 360px; COLOR: #000");
		bgdata.put("layerPhoto", "MARGIN: 30px 0px 0px 30px; WIDTH: 301px; HEIGHT: 301px; COLOR: #000");
		bgdata.put("layerStamp", "MARGIN: 20px 0px 0px 450px; WIDTH: 78px; BACKGROUND: url(../common/testImages/test/keep/keep_02.png) no-repeat; HEIGHT: 88px; COLOR: #000");
		bgdata.put("layerPostmark", "MARGIN: 42px 0px 0px 410px; WIDTH: 83px; BACKGROUND: url(../common/testImages/test/postMark/postmark_07.png) no-repeat; HEIGHT: 82px; COLOR: #000");
		bgdata.put("rangePhoto", "MARGIN-TOP: 30px; WIDTH: 301px; HEIGHT: 301px; VISIBILITY: hidden; MARGIN-LEFT: 30px");
		bgdata.put("img2-margin", "0px 0px 0px 0px");
		bgdata.put("img2-width", "421px");
		bgdata.put("img2-height", "301px");
		bgdata.put("img1-margin", "0px");
		bgdata.put("img1-width", "421px");
		bgdata.put("img1-height", "301px");
		bgMap.put("bg9", bgdata);
	}
	static {
		reInit();
	}
	
	public static Hashtable<String,String> getBgData(String key){
		return bgMap.get(key);
	}
	public static Hashtable<String,String> getHashtable(String str){

		return map.get(str);
	}
}
