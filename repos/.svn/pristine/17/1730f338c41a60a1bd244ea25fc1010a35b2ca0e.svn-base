package com.unicom.mms.sgip;

import org.apache.log4j.Logger;

import com.huawei.insa2.comm.sgip.message.SGIPDeliverMessage;
import com.huawei.insa2.comm.sgip.message.SGIPMessage;
import com.huawei.insa2.comm.sgip.message.SGIPReportMessage;
import com.huawei.insa2.comm.sgip.message.SGIPUserReportMessage;
import com.huawei.insa2.util.Args;
import com.huawei.smproxy.SGIPSMProxy;

public class SgipMO extends SGIPSMProxy{
	private static final Logger log = Logger.getLogger(SgipMO.class);
	
	public SgipMO(Args args) {
		super(args);
	}
	
	
	/**
	 * 在SP和SMG的通信中，SMG用Deliver命向SP发送一条MO短消息。
	 * SMG接收到Deliver命令，会返回Deliver_Resp应答。
	 * SMG根据Deliver命令中目的特服号，判断出该服务属于和哪一个SMG相连接的SP，
	 * 如果属于本地SP，则直接发送到SP，否则路由至相应的SMG。
	 * 
	 * 参数名称	说明
		CommandId	命令ID，十六进制数字
		SequenceNumber	序列号，十六进制数字
		UserNumber	发送该短消息的手机号，字符，手机号码前加“86”国别标志
		SPNumber	接收该短消息的SP的接入号码，字符
		TP_pid	GSM协议类型。详细解释请参考GSM03.40中的9.2.3.9
		十六进制数字
		TP_udhi	GSM协议类型。详细解释请参考GSM03.40中的9.2.3.23,仅使用1位，右对齐
		十六进制数字
		MessageCoding	短消息的编码格式。
		0：纯ASCII字符串
		3：写卡操作
		4：二进制编码
		8：UCS2编码
		15：GBK编码
		其它参见GSM3.38第4节：SMS Data Coding Scheme
		十六进制数字
		MessageContent	短消息的内容，十六进制数字
		Reserve	保留，扩展用

	 */
	@Override
	public SGIPMessage onDeliver(SGIPDeliverMessage msg) {
		try{
			 // 收到用户发送的短信(上行)
			log.info("onDeliver->收到上行:"+msg.toString());
	       
		}catch(Exception e){
			e.printStackTrace();
			log.error(e);
		}
		return super.onDeliver(msg);
	}

	/**
	 * Report命令用于向SP发送一条先前的Submit命令的当前状态。
	 * 参数名称	说明
		CommandId	命令ID，十六进制数字
		SequenceNumber	序列号，十六进制数字
		SubmitSequenceNumber	该命令所涉及的Submit或deliver命令的序列号，十六进制数字
		ReportType	Report命令类型
					0：对先前一条Submit命令的状态报告
					1：对先前一条前转Deliver命令的状态报告，十六进制数字
		UserNumber	接收该短消息的手机号，字符，手机号码前加“86”国别标志
		State*	该命令所涉及的短消息的当前执行状态
				0：发送成功
				1：等待发送
				2：发送失败
				十六进制数字
		ErrorCode	当State=2时为错误码值，否则为0，十六进制数字
		Reserve	保留，扩展用
	 */
	@Override
	public SGIPMessage onReport(SGIPReportMessage msg) {
		try{
			 // 收到用户发送的短信(上行)
			log.info("onReport->收到上行:"+msg.toString());
		
		}catch(Exception e){
			e.printStackTrace();
			log.error(e);
		}
		return super.onReport(msg);
	}

	/**
	 * UserRpt命令用于在完成对用户鉴权后，由SMG向手机用户所注册的SP发送命令，对手机用户进行状态配置。
	 * 
	 * 参数名称	说明
		CommandId	命令ID，十六进制数字
		SequenceNumber	序列号，十六进制数字
		SPNumber	SP的接入号码，字符
		UserNumber	待配置的手机号码，字符，手机号码前加“86”国别标志
		UserCondition	十六进制数，0：注销；1：欠费停机；2：恢复正常
		Reserve	保留，扩展用
	 */
	@Override
	public SGIPMessage onUserReport(SGIPUserReportMessage msg) {
		try{
			 // 收到用户发送的短信(上行)
			log.info("onUserReport->收到上行:"+msg.toString());			
		}catch(Exception e){
			e.printStackTrace();
			log.error(e);
		}
		return super.onUserReport(msg);
	}
	
}
