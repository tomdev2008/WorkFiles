package com.unicom.mms.cms.service.ipml;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.action.util.FileUtil;
import com.unicom.mms.cms.dao.BgMusicDAO;
import com.unicom.mms.cms.dao.BgPicDAO;
import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.service.BgMusicService;
import com.unicom.mms.cms.service.BgPicService;
import com.unicom.mms.entity.TbBgMusic;
import com.unicom.mms.entity.TbBgPic;
import com.unicom.mms.resources.FileType;
import com.unicom.mms.resources.socket.ClientSocket;
/**
 * 
* 功能描述:背景图片管理
* @author chenliang 新增日期：2013-3-3
* @since mms-cms-unicom
 */
@Service("bgPicService")
public class BgPicServiceImpl extends CommonServiceImpl<TbBgPic> implements BgPicService{
	public static Logger log = Logger.getLogger(BgPicServiceImpl.class);

	@Autowired(required = true)
	private BgPicDAO bgPicDAO;
	
	@Override
	public CommonDAO<TbBgPic> getBindDao() {
		return bgPicDAO;
	}

	@Override
	public void saveBgPic(TbBgPic model, HashMap<String, Object> map) {
		//1、背景图片文件上传
		File file = (File) map.get("file");
		String fileName = (String) map.get("fileName");
		String picUrl = (String) map.get("picUrl");
		FileUtil.bakTemplatesDoc(file, picUrl, fileName, false, 0);
		//背景图片文件上传小图片到cms服务器
		File file1 = (File) map.get("minfile");
		String fileName1 = (String) map.get("minfileName");
		String picUrl1 = (String) map.get("minpicUrl");
		FileUtil.bakTemplatesDoc(file1, picUrl1, fileName1, false, 0);
		//2、把cms图片上传到图片服务器
		long time = System.currentTimeMillis();
		long time1 = System.currentTimeMillis();
		String minPath =null;
		String path=null;
		try {
			path = new ClientSocket().sendFile(socketHost, socketport,picUrl+File.separator+fileName,time+fileName,"null",FileType.Background);
			minPath=new ClientSocket().sendFile(socketHost, socketport,picUrl1+File.separator+fileName1,time1+fileName1,"null",FileType.Background);
		} catch (IOException e) {
			e.printStackTrace();
		}

		//2、保存模板明信片
		model.setPicUrl(path); //上传地址
		model.setSmallBgPic(minPath);
		bgPicDAO.save(model);
	}

	@Override
	public void updateBgPic(TbBgPic model) {
		//根据id查找
		TbBgPic bgPicEntity = bgPicDAO.findById(model.getId());
		bgPicEntity.setName(model.getName());
		bgPicEntity.setStatus(model.getStatus());
		bgPicDAO.merge(bgPicEntity);
	}

}
