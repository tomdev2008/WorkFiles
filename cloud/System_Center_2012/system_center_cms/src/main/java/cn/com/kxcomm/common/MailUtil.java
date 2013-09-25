package cn.com.kxcomm.common;  
  
import java.io.File;  
import java.io.IOException;  
  
import org.apache.commons.mail.EmailException;  
import org.apache.commons.mail.HtmlEmail;  
  
/** 
 * 邮件发送类 
 * @author cailei 
 * 
 */  
  
public class MailUtil {  
    private  HtmlEmail email=null;
    public MailUtil() {
    	email=new HtmlEmail();  
        email.setHostName("smtp.mxhichina.com"); // 设定smtp服务器  
        email.setAuthentication("tianyi@tycentury.com", "zq18675470694"); // 设定smtp服务器的认证资料信息  
        email.setCharset("UTF-8");//编码格式      
      
    }
 
      
      
      
      
    /** 
     *  
     * @param toAddress 收件人地址 
     * @param toName   收件人名字 
     * @param fromName 发送者名字 
     * @param dir     选择hmtl文件路径 
     * @throws EmailException 
     * @throws IOException 
     */  
    public  synchronized  void  sendEmail(String toAddress,String toName,String fromName,String dir,String subject,String html,String msg) throws EmailException, IOException{  
        email.addTo(toAddress, toName); // 设定收件人  
        email.setFrom("tianyi@tycentury.com", fromName);  
        email.setSubject(subject);  
        email.setHtmlMsg(msg);  
//        email.setTextMsg("");  
        email.send();  
    }  
    
    public  static void main(String[] args){
    	String msg="Dear xxx:<br>"+
"&nbsp;&nbsp;&nbsp;&nbsp;Thanks for signing up for TianYi International Community! Soon you'll be able to start lecturing, and meeting people from around the world.<br>"+
"All you need to do to complete your registration is follow the link below:<br>"+
"www.tycentury.com"+
"If the above link does not work, please copy the address to your web browser and enter our website from there.<br>"+
"If you did not register for TianYi International Community, or believe you have received this email in error, please disregard this message.<br>"+
"Sincerely,<br>"+
"&nbsp;&nbsp;The TianYi Team<br>";
    	try {
			new MailUtil().sendEmail("190200560@qq.com", "赵宝东", "TianYi Company", "", "Register Success", "", msg);
			new MailUtil().sendEmail("190200560abc@gmail.com", "赵宝东", "TianYi Company", "", "Register Success", "", msg);
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
  
}  