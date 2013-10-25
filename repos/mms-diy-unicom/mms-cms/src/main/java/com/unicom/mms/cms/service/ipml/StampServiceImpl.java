package com.unicom.mms.cms.service.ipml;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.action.util.FileUtil;
import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.StampDAO;
import com.unicom.mms.cms.service.StampService;
import com.unicom.mms.entity.TbStamp;
import com.unicom.mms.resources.FileType;
import com.unicom.mms.resources.socket.ClientSocket;

/**
 * 
* 功能描述:邮票管理
* @author lujia 新增日期：2013-3-3
* @since mms-cms-unicom
 */
@Service("stampService")
public class StampServiceImpl extends CommonServiceImpl<TbStamp> implements StampService{
	public static Logger log = Logger.getLogger(StampServiceImpl.class);

	@Autowired(required = true)
	private StampDAO stampDAO;
	@Override
	public CommonDAO<TbStamp> getBindDao() {
		return stampDAO;
	}
	
	@Override
	public void saveStamp(TbStamp model, HashMap<String, Object> map) {
		try {
			//1、模板明信片文件上传到cms服务器
			File file = (File) map.get("file");
			String fileName = (String) map.get("fileName");
			String picUrl = (String) map.get("picUrl");
			FileUtil.bakTemplatesDoc(file, picUrl, fileName, false, 0);
			
			//2、把cms服务器上传到图片服务器
			long time = System.currentTimeMillis();
			String stampUrl = new ClientSocket().sendFile(socketHost, socketport,picUrl+File.separator+fileName,time+fileName,"null",FileType.StampsType);
			
			//2、保存模板明信片
			model.setPicUrl(stampUrl); //上传地址
			stampDAO.save(model);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void updateStamp(TbStamp model) {
		//1、根据主键查找
		TbStamp stampEntity = stampDAO.findById(model.getId());
		stampEntity.setName(model.getName());
		stampEntity.setStauts(model.getStauts());
		stampDAO.merge(stampEntity);
	}

}
