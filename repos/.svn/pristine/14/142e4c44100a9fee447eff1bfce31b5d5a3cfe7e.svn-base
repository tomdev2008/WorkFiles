package com.unicom.mms.sgip;

import java.math.BigInteger;

import org.apache.log4j.Logger;

import com.huawei.insa2.comm.sgip.message.SGIPSubmitMessage;
import com.huawei.insa2.comm.sgip.message.SGIPSubmitRepMessage;
import com.huawei.insa2.util.Args;
import com.huawei.insa2.util.Cfg;
import com.huawei.smproxy.SGIPSMProxy;
import com.unicom.mms.InitInstance;
import com.unicom.mms.model.SGIPMsg;
import com.unicom.mms.util.PropertiesConfig;

public class SgipMT {
	private static final Logger log = Logger.getLogger(SgipMT.class);
	private SGIPSMProxy smp ;
	private String SrcNodeId;
	
	/**
	 * 
	 * 连接到网关
	 * 
	 * @return
	 * @throws Exception
	 * @author zhangjh 新增日期：2013-9-22
	 * @since smsc-gateway
	 */
	private  boolean connect() throws Exception{
		boolean isWinOs = System.getProperty("os.name").toUpperCase().startsWith("WINDOW");
		String appPath = SgipMT.class.getResource("/smsc/app.xml").getFile();
		if(isWinOs){
			appPath = appPath.substring(1, appPath.length());
		}
		Args args = new Cfg(appPath).getArgs("SGIPConnect");
		
		smp = new SGIPSMProxy(args); 
		
		String loginName = args.get("login-name", "");
		String loginPass = args.get("login-pass", "");
		SrcNodeId = args.get("source-addr", "");
		log.info("host:"+args.get("host", "")+",port:"+args.get("host", "")+",login-name:"+args.get("login-name", "")+",login-pass:"+args.get("login-pass", ""));
        boolean bl = smp.connect(loginName,loginPass);
        log.info("连接网关:"+bl);
        if(!bl){
        	log.error("无法连接到网关");
        	return false;
        }
		return true;
	}
	
	/**
	 * 
	 * 发送短信
	 * 
	 * @param smsMessage
	 * @return
	 * @throws Exception
	 * @author zhangjh 新增日期：2013-9-21
	 * @since smsc-gateway
	 */
	public boolean send(String[] UserNumber,String ServiceType,int Priority,String MessageContent) {
		try{
			boolean isTrue = connect();
			if(!isTrue){
				throw new Exception("Error!!!!!!SGIPSMProxy connect is null!");
			}     
			PropertiesConfig  properties = InitInstance.getInstance().getSmsProperties();
			SGIPMsg msg = new SGIPMsg(properties);
			msg.setUserNumber(UserNumber);
			msg.setServiceType(ServiceType);
			msg.setPriority(Priority);
			byte[] bMessageContent = MessageContent.getBytes();
			int MessageLen = bMessageContent.length;
			msg.setMessageContent(bMessageContent);
			msg.setMessageLen(MessageLen);
			SGIPSubmitMessage sgipsubmit = new SGIPSubmitMessage(msg.getSPNumber(),msg.getChargeNumber(),msg.getUserNumber(),msg.getCorpId(),msg.getServiceType(),msg.getFeeType(),msg.getFeeValue(),msg.getGivenValue(),msg.getAgentFlag(),msg.getMorelatetoMTFlag(),msg.getPriority(),msg.getExpireTime(),msg.getScheduleTime(),msg.getReportFlag(),msg.getTP_pid(),msg.getTP_udhi(),msg.getMessageCoding(),msg.getMessageType(),msg.getMessageLen(),msg.getMessageContent(),msg.getReserve());
			int srcnode = new BigInteger(SrcNodeId).intValue();   
			sgipsubmit.setSrcNodeId(srcnode);
			log.info("发送消息:"+sgipsubmit.toString());   
			SGIPSubmitRepMessage repMsg =  (SGIPSubmitRepMessage)smp.send(sgipsubmit);
			log.info("发送结果:"+repMsg.toString());
			if (repMsg != null && repMsg.getResult() == 0) {
	            return true;
	        }
			log.error("下行失败，错误："+repMsg.toString());
		}catch(Exception e){
			log.error(e);
		}finally{
			
		}
		close();
		return false;
	}
	
	
	private void close(){
		if(smp!=null)
			smp.close();
	}
	public static void main(String[] args){
		try{
			String[] UserNumber = new String[1];
			UserNumber[0] = "15580898198";
			String ServiceType="3174201001";
			int Priority = 9;
			String MessageContent="hello world";
			SgipMT mt = new SgipMT();
			for(int i=0;i<10;i++){
				boolean su = mt.send(UserNumber, ServiceType, Priority, MessageContent);
				if(!su){
					System.out.println("发送失败");
				}else{
					System.out.println("发送成功");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("****************************************************");
	}
}
