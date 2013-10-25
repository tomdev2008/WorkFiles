package com.unicom.mms.cms.service.ipml;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.base.constants.BusinessConstants;
import com.unicom.mms.cms.action.util.FileUtil;
import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.FramePosDAO;
import com.unicom.mms.cms.dao.PhotoFrameDAO;
import com.unicom.mms.cms.service.FramePosService;
import com.unicom.mms.cms.service.PhotoFrameService;
import com.unicom.mms.common.Page;
import com.unicom.mms.entity.TbFramePos;
import com.unicom.mms.entity.TbFrameType;
import com.unicom.mms.entity.TbPhotoFrame;
import com.unicom.mms.entity.TbTemplateCard;
import com.unicom.mms.resources.FileType;
import com.unicom.mms.resources.socket.ClientSocket;

/**
 * 
* 功能描述:相框管理业务逻辑处理类
* @author lujia 新增日期：2013-2-28
* @since mms-cms-unicom
 */
@Service("photoFrameService")
public class PhotoFrameServiceImpl extends CommonServiceImpl<TbPhotoFrame> implements PhotoFrameService{
	public static Logger log = Logger.getLogger(PhotoFrameServiceImpl.class);
	@Autowired(required = true)
	public PhotoFrameDAO photoFrameDAO;
	
	@Autowired(required = true)
	private FramePosDAO framePosDAO;
	
	@Autowired(required=true)
	private FramePosService framePosService;
	
	@Override
	public CommonDAO<TbPhotoFrame> getBindDao() {
		return photoFrameDAO;
	}

	@Override
	public void savePhotoFrame(TbPhotoFrame model, Map<String, Object> map) {
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
			//2、把cms服务器上的图片上传到图片服务器
			long time = System.currentTimeMillis();
			String photoFrameUrl = new ClientSocket().sendFile(socketHost, socketport,picUrl+File.separator+fileName,time+fileName,"null",FileType.PhotoFrameType);
			long time1 = System.currentTimeMillis();
			String minPhotoPath = new ClientSocket().sendFile(socketHost, socketport,picUrl1+File.separator+fileName1,time1+fileName1,"null",FileType.PhotoFrameType);
			//2、保存模板明信片
			model.setPicUrl(photoFrameUrl); //上传地址
			model.setSmallFrame(minPhotoPath);
			photoFrameDAO.save(model);
			
			//3、保存相框对应的位置
			//3.1、保存输入文本框的相对相框位置
			TbFramePos textFramePos = (TbFramePos) map.get("textFramePos");
			textFramePos.setPhotoFrame(model);
			textFramePos.setType(BusinessConstants.framePosType_text);
			framePosService.save(textFramePos);
			//3.2、保存邮戳相对相框位置
			TbFramePos postmarkFramePos = (TbFramePos) map.get("postmarkFramePos");
			postmarkFramePos.setPhotoFrame(model);
			postmarkFramePos.setType(BusinessConstants.framePosType_postMark);
			framePosService.save(postmarkFramePos);
			//3.2、保存邮票相对相框位置
			TbFramePos stampFramePos = (TbFramePos) map.get("stampFramePos");
			stampFramePos.setPhotoFrame(model);
			stampFramePos.setType(BusinessConstants.framePosType_stamp);
			framePosService.save(stampFramePos);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updatePhotoFrame(TbPhotoFrame model,TbFramePos framePos,TbFramePos postmarkFramePos,TbFramePos stampFramePos) {
		//现根据主键id查找相框对象
		TbPhotoFrame photoFrameEntity = photoFrameDAO.findById(model.getId());
		photoFrameEntity.setName(model.getName());
		photoFrameEntity.setStauts(model.getStauts());
		TbFrameType frameType = new TbFrameType();
		frameType.setId(model.getFrameType().getId());
		photoFrameEntity.setFrameType(frameType);
		photoFrameDAO.merge(photoFrameEntity);
		
		//根据相框主键查询
		//更新文本框相对相框的位置
		TbFramePos textTbFramePos = framePosService.findByPhotoFrameId(photoFrameEntity, BusinessConstants.framePosType_text);
		if(null!=textTbFramePos){
			textTbFramePos.setXpos(framePos.getXpos());
			textTbFramePos.setYpos(framePos.getYpos());
			textTbFramePos.setHeight(framePos.getHeight());
			textTbFramePos.setWidth(framePos.getWidth());
			textTbFramePos.setPhotoFrame(photoFrameEntity);
			framePosService.update(textTbFramePos);
		}
		
		//更新邮戳框相对相框的位置
		TbFramePos postmarkTbFramePos = framePosService.findByPhotoFrameId(photoFrameEntity, BusinessConstants.framePosType_postMark);
		if(null!=postmarkTbFramePos){
			postmarkTbFramePos.setXpos(postmarkFramePos.getXpos());
			postmarkTbFramePos.setYpos(postmarkFramePos.getYpos());
			postmarkTbFramePos.setHeight(postmarkFramePos.getHeight());
			postmarkTbFramePos.setWidth(postmarkFramePos.getWidth());
			postmarkTbFramePos.setPhotoFrame(photoFrameEntity);
			framePosService.update(postmarkTbFramePos);
		}
		
		//更新邮票框相对相框的位置
		TbFramePos stampTbFramePos = framePosService.findByPhotoFrameId(photoFrameEntity, BusinessConstants.framePosType_postMark);
		if(null!=stampTbFramePos){
			stampTbFramePos.setXpos(stampFramePos.getXpos());
			stampTbFramePos.setYpos(stampFramePos.getYpos());
			stampTbFramePos.setHeight(stampFramePos.getHeight());
			stampTbFramePos.setWidth(stampFramePos.getWidth());
			stampTbFramePos.setPhotoFrame(photoFrameEntity);
			framePosService.update(stampTbFramePos);
		}
	}

	@Override
	public void deleteByPkid(String[] ids) {
		String hql = "delete TbFramePos where photoFrame.id = ?";
		Integer[] idslong = new Integer[ids.length];
		for(int i=0;i<idslong.length;i++){
			idslong[i]=Integer.parseInt(ids[i]);
			//根据相框id删除相框内部存放的邮票邮戳等相对位置的数据
			framePosDAO.executeByHQL(hql, idslong[i]);
		}
		deleteAllByPks(idslong);
	}
}
