package com.unicom.mms.constants;

/**
 * 
* 功能描述:业务常量类
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-25
* @author chenliang 修改日期：2013-9-25
* @since mms-share
 */
public class SharePublicContants {
	
	//mms类型
	public static final int SMS = 1; //短信
	public static final int MMS = 2; //彩信

	//彩信，短信 发送等级
	public static final int SENDLEVEL_PRIORITY = 1; //优先
	public static final int SENDLEVEL_SECONDLY = 2; //其次
	public static final int SENDLEVEL_GENERAL  = 3; //普通
	
	//彩信，短信发送渠道
	public static final int CHANNEL_WEB = 1; //web
	public static final int CHANNEL_CMS = 2; //cms
	public static final int CHANNEL_OTHER = 3; //其它
	public final static int CHANNEL_VAC = 4;//vac
	public final static int CHANNEL_WAP = 5;//wap
	
	//短信，彩信发送状态
	public static final int MSGSTATUS_SUCCESS = 1; //成功
	public static final int MSGSTATUS_FAIELD = 2;  //失败
	public static final int MSGSTATUS_SENDING = 3; //已发送
	
	/**
	 * 图片格式
	 */
	public final static int IMAGES_JPEG = 11;//jpg
	public final static int IMAGES_GIF = 12;//gif
	public final static int IMAGES_PNG = 13;//png
	/**
	 * 音源格式
	 */
	public final static int MUSIC_MIDI = 21;//mid
	public final static int MUSIC_AMR = 22;//amr
	
	/**
	 * 消息报告类型
	 */
	public final static int MSGREPORT_GATEWAY=1; //网关接收信息的报告
	public final static int MSGREPORT_USER=2;//用户接收信息的报告
	
	/**
	 * 消息类型
	 */
	public final static int GATEWAY_MSGTYPE_BATCHMMS=1;//批量彩信消息类型
	public final static int GATEWAY_MSGTYPE_BATCHSMS=2;//批量短信消息类型
	public final static int GATEWAY_MSGTYPE_TEMPLATE_POSTCARDMMS=3;//模版明信片彩信
	public final static int GATEWAY_MSGTYPE_REALTIMESMS=4;//实时短信
	public final static int GATEWAY_MSGTYPE_DIY_POSTCARDMMS=5;//DIY明信片
	
	/**
	 * 任务策略的状态
	 */
	public static final int JOB_STATUES_START = 0;//启动
	public static final int JOB_STATUES_STOP = 1; //停止
	
	/**
	 * 策略任务执行中的状态
	 */
	public static final int JOB_NOTRUN = 0 ;//未执行
	public static final int JOB_RUNNING = 1; //执行中
	public static final int JOB_RUNCOMPLET = 2; //执行完成
	
}