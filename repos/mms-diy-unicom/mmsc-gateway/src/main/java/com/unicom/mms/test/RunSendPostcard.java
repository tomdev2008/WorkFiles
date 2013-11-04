package com.unicom.mms.test;

import org.apache.commons.configuration.CompositeConfiguration;

import com.cmcc.mm7.vasp.common.MMContent;
import com.cmcc.mm7.vasp.message.MM7SubmitReq;
import com.unicom.mms.InitInstance;
import com.unicom.mms.mm7.MmsSubmit;

public class RunSendPostcard {
	public static void main(String[] args){
		CompositeConfiguration test = InitInstance.getInstance().test;
		MmsSubmit s = new MmsSubmit();
		String smilPath = test.getString("smilPath");
		String smilFileName=test.getString("smilFileName");
		String imageType=test.getString("imageType");
		String imagePath=test.getString("imagePath");
		String imageFileName=test.getString("imageFileName");
		String musicType=test.getString("musicType");
		String musicPath=test.getString("musicPath");
		String musicFileName=test.getString("musicFileName");
		MMContent content = s.postcards(smilPath, smilFileName, imageType, imagePath, imageFileName, musicType, musicPath, musicFileName);
		String[] phone=new String[1];
		phone[0]="15580898198";
		MM7SubmitReq req = s.fromat(phone, "明信片title", content, "3174201000");
		s.send(req);
	}
}