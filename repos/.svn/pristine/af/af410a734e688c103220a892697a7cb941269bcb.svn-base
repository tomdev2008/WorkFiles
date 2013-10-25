package com.unicom.mms.test;

import com.cmcc.mm7.vasp.common.MMContent;
import com.cmcc.mm7.vasp.message.MM7SubmitReq;
import com.unicom.mms.mm7.MmsSubmit;

public class RunSendText {
	public void send1(){
		MmsSubmit s = new MmsSubmit();
		String text = "彩信test";
		String[] phone=new String[1];
		phone[0]="15580898198";
		String vasId = "3174201000";
		String subject =  "彩信title";
		s.sendText(phone, subject, text, vasId);
	}
	public void send2(){
		MmsSubmit s = new MmsSubmit();
		String text = "彩信test2";
		String[] phone=new String[1];
		phone[0]="15580898198";
		String vasId = "3174201000";
		String subject =  "彩信title";
		MMContent content = s.Text(text);
		MM7SubmitReq submit = s.fromat(phone, subject, content, vasId);
		s.send(submit);
	}
	
	public static void main(String[] args){
		RunSendText text = new RunSendText();
		text.send2();
	}
}
