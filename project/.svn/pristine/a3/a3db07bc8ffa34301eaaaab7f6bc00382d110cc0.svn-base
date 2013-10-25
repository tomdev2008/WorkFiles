package jeecg.common;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.MultiPartEmail;

public class MailSend {
	/**
	 * 
	 * 发送邮件
	 * 
	 * @param tomail 收件人邮箱
	 * @author zhangjh 新增日期：2013-6-16
	 * @since wuliu
	 */
	public  void sendMutiMessage(String tomail,String msg) {
		System.out.println("==============================发送邮件==============================");
		System.out.println(tomail+","+msg);
		MultiPartEmail email = new MultiPartEmail();
		List<EmailAttachment> list = new ArrayList<EmailAttachment>();
		AppConfig p =AppConfig.getInstance();
		
		String hostName = p.getString("mailhostName");
		if(hostName==null){
			System.out.println("==============================邮箱信息错误==============================");
			return ;
		}
		String mailFrom = p.getString("mailFrom");
		String mailPasswd = p.getString("mailPasswd");
		try {
			// 这里是发送服务器的名字：
			email.setHostName(hostName);
			// 编码集的设置
			email.setCharset("utf-8");
			// 收件人的邮箱				
			email.addTo(tomail);
			// 发送人的邮箱
			email.setFrom(mailFrom);
			// 如果需要认证信息的话，设置认证：用户名-密码。分别为发件人在邮件服务器上的注册名称和密码
			email.setAuthentication(mailFrom, mailPasswd);
			email.setSubject("e-track货代系统-重置密码通知");
			// 要发送的信息
			email.setMsg(msg);

			for (int a = 0; a < list.size(); a++) //添加多个附件   
			{
				email.attach(list.get(a));
			}
			// 发送
			String result = email.send();
			System.out.println("send mail:"+result+","+tomail);
		} catch (EmailException e) {
			e.printStackTrace();
		}
	}
}
