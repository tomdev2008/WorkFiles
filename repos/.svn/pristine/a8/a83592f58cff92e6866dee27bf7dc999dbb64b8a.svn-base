package com.unicom.mms.mm7;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.configuration.CompositeConfiguration;
import org.apache.log4j.Logger;

import com.cmcc.mm7.vasp.common.MMConstants;
import com.cmcc.mm7.vasp.common.MMContent;
import com.cmcc.mm7.vasp.conf.MM7Config;
import com.cmcc.mm7.vasp.message.MM7RSRes;
import com.cmcc.mm7.vasp.message.MM7SubmitReq;
import com.cmcc.mm7.vasp.message.MM7SubmitRes;
import com.cmcc.mm7.vasp.service.MM7Sender;
import com.unicom.mms.InitInstance;
import com.unicom.mms.gateway.PostcardMMS;
import com.unicom.mms.util.Download;
import com.unicom.mms.util.WriteSmil;

public class SmilPostcardMMS {
	private static Logger _log = Logger.getLogger(MmsSubmit.class);
	private PostcardMMS req;
	private String imagePath;
	private String musicPath;
	private String smilPath;
	private String imageName;
	private String musicName;
	private String smilName;
	private String remoteurl;
	private String localurl;

	public SmilPostcardMMS(PostcardMMS req,String remoteurl,String localurl) {
		this.req = req;
		this.remoteurl = remoteurl;
		this.localurl = localurl;
		Initialize();
	}

	private void Initialize() {
		try {
			Download d = new Download();
			String ImageUrl = req.getImagePath().replace(remoteurl, localurl);
			_log.info("ImageUrl:"+ImageUrl);
			imagePath = d.down(ImageUrl);
			_log.info("图片地址:"+imagePath);
			imageName = imagePath.substring(imagePath.lastIndexOf("/")+1, imagePath.length());
			
			if(req.getMusicPath()!=null &&!"".equals(req.getMusicPath())){
				String MusicUrl = req.getMusicPath().replace(remoteurl, localurl);
				_log.info("MusicUrl:"+MusicUrl);
				musicPath = d.down(MusicUrl);
				_log.info("音源地址:"+musicPath);
				musicName = musicPath.substring(musicPath.lastIndexOf("/")+1, musicPath.length());
			}
			
			WriteSmil s = new WriteSmil();
			List<String> l = new ArrayList<String>();
			l.add("<smil>");
			l.add("<head>");
			l.add("<meta name=\"copyright\" content=\"\" />");
			l.add("<layout>");
			l.add("<root-layout/>");
			l.add("<region id=\"Image\" top=\"0\" left=\"0\" height=\"50\" width=\"100\" fit=\"hidden\"/>");
			l.add("</layout>");
			l.add(" </head>");
			l.add("<body>");
			l.add(" <par dur=\"50000ms\">");
			l.add("<img src=\""+imageName+"\"  region=\"Image\"/>");
			if(musicName!=null && !"".equals(musicName.trim())){
				l.add("<audio src=\""+musicName+"\"></audio>");
			}
			l.add("</par>");
			l.add("</body>");
			l.add("</smil>");
			this.smilPath = s.write(l);
			smilName = smilPath.substring(smilPath.lastIndexOf("/")+1, smilPath.length());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public MM7RSRes send() {
		CompositeConfiguration conf = InitInstance.getInstance().mm7;
		_log.info("Step1:mm7协议以及彩信中心，SP等服务端口和IP配置等...");
		MM7Config mm7Config = new MM7Config(MmsSubmit.class.getResource(
				"/mm7Config.xml").getFile());
		mm7Config.setConnConfigName(MmsSubmit.class.getResource(
				"/ConnConfig.xml").getFile());
		MM7RSRes rsRes = null;	// 返回对象
		try {
			_log.info("Step1_1:　构造待发送消息等...");
			MM7SubmitReq submit = new MM7SubmitReq();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			String transactionId = conf.getString("transactionId", "1000000");
			String[] receiver = req.getReceiver().split(",");// 接收号码
			String vasId = req.getProductCode();// 产品代码
			String vaspId = conf.getString("VASPID","43068");
			String serviceCode = conf.getString("ServiceCode", "31742010");
			String senderAddress = conf.getString("senderAddress");
			byte chargedParty = conf.getByte("ChargedParty", (byte) 4);
			String ChargedPartyID = conf.getString("ChargedPartyID","000000000000000000000");
			/****************************组合发送对象***********************************/
			submit.setTransactionID(transactionId);
			for(int i=0;i<receiver.length;i++){
				String tmp = receiver[i];
				submit.addTo(tmp);
			}
			submit.setVASID(vasId);
			submit.setVASPID(vaspId);
			submit.setServiceCode(serviceCode);
			submit.setSenderAddress(senderAddress);
			submit.setSubject(req.getSubject());
			submit.setChargedPartyID(req.getSender());
			submit.setChargedParty(chargedParty);
			submit.setDeliveryReport(true); // 设置是否需要递送报告
			_log.info("Step1_2:创建多个消息内容体并添加到多媒体消息对象中...");
			//			A:先构造一个媒体容器
			MMContent content = new MMContent();
			content.setContentType(MMConstants.ContentType.MULTIPART_RELATED);
			content.setContentID(smilName);
//			B:添加具体媒体内容
//			B0: smil文件： smilFileFullName 
			MMContent sub0 = MMContent.createFromFile(this.smilPath);
			sub0.setContentType(MMConstants.ContentType.SMIL);
			sub0.setContentID(smilName);
			content.setPresentionContent(sub0);
			content.addSubContent(sub0);
//			B2:添加的是一个图片
			MMContent sub2 = MMContent.createFromFile(this.imagePath);
			sub2.setContentType(MMConstants.ContentType.PNG);
			sub2.setContentID(this.imageName);
			sub2.setContentLocation(this.imageName);
			content.addSubContent(sub2);
		
			if(musicName!=null && !"".equals(musicName.trim())){
				MMContent sub3 = MMContent.createFromFile(this.musicPath);
				sub3.setContentID(this.musicName);
				sub3.setContentType(MMConstants.ContentType.AMR);
				sub3.setContentLocation(this.musicName);
				content.addSubContent(sub3);
			}
			_log.info("Step1_3:将多媒体内容添加到消息对象中...");
			submit.setContent(content);
			_log.info("Step2:创建发送线程MM7Sender实例...");
			MM7Sender mm7Sender = new MM7Sender(mm7Config);
			
//			Step3:发送内容到网关：
//			_log.info("**Step3:beforeSendReq:"+submit.toString());
			rsRes = (MM7RSRes)mm7Sender.send(submit);
//			_log.info("**respFromServer:"+rsRes.toString());
			if (rsRes instanceof MM7SubmitRes) {
				
				MM7SubmitRes submitRes = (MM7SubmitRes) rsRes;
//				_log.info("**RightMessage:"+submitRes.toString());
				_log.info("***submitResp=version:" + submitRes.getMM7Version()
						+ ",seq:" + submitRes.getTransactionID() + ",msgID:"
						+ submitRes.getMessageID() + ",statusDetail:"
						+ submitRes.getStatusDetail() + ",statuscode:"
						+ submitRes.getStatusCode() + ",statusText="
						+ submitRes.getStatusText());
				return rsRes;
			} else {
				_log.info("WrongMessage!statuscode=" + rsRes.getStatusCode()
						+ "statusText=" + rsRes.getStatusText());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return rsRes;
	}
		
		 /**
	     * 从文件中获取消息内容
	     * @param file_name
	     * @return
	     * @throws IOException
	     */
	    public static byte[] readFromFile(String file_name) throws IOException
	    {
	        FileInputStream fin = new FileInputStream(file_name);
	        byte[] buf = new byte[fin.available()];
	        fin.read(buf);
	        fin.close();
	        return buf;
	    }
	
	  public static void main(String args[]) throws IOException{
		  PostcardMMS req = new PostcardMMS();
		  req.setMusicPath("http://211.91.224.244/resources/systemData/Music/cat.amr");
		  req.setImagePath("http://211.91.224.244/resources/userData/2013-10/1382776942400.gif");
		  req.setReceiver("15580898198");
		  req.setSender("15580898198");
		  req.setSubject("smil测试");
		  req.setProductCode("3174201001");
		  SmilPostcardMMS mms = new SmilPostcardMMS(req,"211.91.224.244","211.91.224.244");
		  mms.send();
	  }
}
