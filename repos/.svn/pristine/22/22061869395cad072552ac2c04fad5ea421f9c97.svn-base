package com.unicom.mms.cms.service.ipml;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.record.BlankRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.action.util.FileUtil;
import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.TemplateCardDAO;
import com.unicom.mms.cms.service.TemplateCardService;
import com.unicom.mms.cms.vo.TemplateCardEntity;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.entity.TbCardType;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.resources.FileType;
import com.unicom.mms.resources.socket.ClientSocket;

/**
 * 
* 功能描述:模板明信片
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Service("templateCardService")
public class TemlateCardServiceImpl extends CommonServiceImpl<TbTemplateCard> implements TemplateCardService {
	public static Logger log = Logger.getLogger(TemlateCardServiceImpl.class);

	@Autowired(required = true)
	private TemplateCardDAO templateCardDAO;
	
	@Override
	public CommonDAO<TbTemplateCard> getBindDao() {
		return templateCardDAO;
	}

	@Override
	public void saveTemplateCard(TbTemplateCard model, Map<String, Object> map) {
		try {
			//1、模板明信片文件上传到cms服务器
			File file = (File) map.get("file");
			String fileName = (String) map.get("fileName");
			String picUrl = (String) map.get("picUrl");
			FileUtil.bakTemplatesDoc(file, picUrl, fileName, false, 0);
			//模板明信片文件上传小图片到cms服务器
			File file1 = (File) map.get("minfile");
			String fileName1 = (String) map.get("minfileName");
			String picUrl1 = (String) map.get("minpicUrl");
			FileUtil.bakTemplatesDoc(file1, picUrl1, fileName1, false, 0);
			
			//2、图片cms服务器上传到图片服务器
			long time = System.currentTimeMillis();
			String templateCardPath = new ClientSocket().sendFile(socketHost, socketport,picUrl+File.separator+fileName,time+fileName,"null",FileType.TemplateCard);
			long time1 = System.currentTimeMillis();
			String minTemplateCardPath = new ClientSocket().sendFile(socketHost, socketport,picUrl1+File.separator+fileName1,time1+fileName1,"null",FileType.TemplateCard);
			
			//3、保存模板明信片
			model.setCollectNum(0);//收藏数默认为0
			model.setPicUrl(templateCardPath); //上传地址
			model.setSmallPic(minTemplateCardPath);
			templateCardDAO.save(model);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<TemplateCardEntity> listAll() {
		String sql = "select t1.wish_word,t1.card_title,t1.status,t2.name,t1.id from tb_template_card t1,tb_card_type t2 where t1.card_type_id = t2.id ";
		List lists = templateCardDAO.findListAll(sql);
		Object[] obj = new Object[lists.size()];
		List<TemplateCardEntity> cardList = new ArrayList<TemplateCardEntity>();
		for (int i = 0; i < lists.size(); i++) {
			obj = (Object[]) lists.get(i);
			TemplateCardEntity card = new TemplateCardEntity();
			card.setWishWord(""+obj[0]);
			card.setCardTitle(""+obj[1]);
			card.setState(""+obj[2]);
			card.setCardTypeName(""+obj[3]);
			card.setId(""+obj[4]);
			cardList.add(card);
		}
		return cardList;
	}

	@Override
	public void updateTemplateCard(TbTemplateCard model) {
		TbTemplateCard cardEntity = templateCardDAO.findById(model.getId());
		cardEntity.setCardTitle(model.getCardTitle());
		TbCardType cardType = new TbCardType();
		cardType.setId(model.getCardType().getId());
		cardEntity.setCardType(cardType);
		cardEntity.setStatus(model.getStatus());
		cardEntity.setxPosText(model.getxPosText());
		cardEntity.setyPosText(model.getyPosText());
		cardEntity.setWidthText(model.getWidthText());
		cardEntity.setHeightText(model.getHeightText());
		cardEntity.setWishWord(model.getWishWord());
		templateCardDAO.merge(cardEntity);
	}
	
}
