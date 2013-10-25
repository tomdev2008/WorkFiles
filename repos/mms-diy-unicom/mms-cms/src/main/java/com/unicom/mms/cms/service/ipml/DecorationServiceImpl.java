package com.unicom.mms.cms.service.ipml;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.action.util.FileUtil;
import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.DecorationDAO;
import com.unicom.mms.cms.service.DecorationService;
import com.unicom.mms.entity.TbDecoration;
import com.unicom.mms.entity.TbDecorationType;
import com.unicom.mms.resources.FileType;
import com.unicom.mms.resources.socket.ClientSocket;

/**
 * 
* 功能描述:饰物管理
* @author lujia 新增日期：2013-3-3
* @since mms-cms-unicom
 */
@Service("decorationService")
public class DecorationServiceImpl extends CommonServiceImpl<TbDecoration> implements DecorationService{
	public static Logger log = Logger.getLogger(DecorationServiceImpl.class);
   
	@Autowired(required = true)
	private DecorationDAO decorationDAO;
	
	
	@Override
	public CommonDAO<TbDecoration> getBindDao() {
		return decorationDAO;
	}

	@Override
	public void saveDecoration(TbDecoration model, HashMap<String, Object> map) {
		try {
			//1、模板明信片文件上传
			File file = (File) map.get("file");
			String fileName = (String) map.get("fileName");
			String picUrl = (String) map.get("picUrl");
			FileUtil.bakTemplatesDoc(file, picUrl, fileName, false, 0);
			//2、把cms图片上传到图片服务器
			long time = System.currentTimeMillis();
			String path =null;
			 path = new ClientSocket().sendFile(socketHost, socketport,picUrl+File.separator+fileName,time+fileName,"null",FileType.AccessoriesType);
			//2、保存模板明信片
			model.setPicUrl(path); //上传地址
			decorationDAO.save(model);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateDecoration(TbDecoration model) {
		//根据id查询
		TbDecoration decorationEntity = decorationDAO.findById(model.getId());
		decorationEntity.setName(model.getName());
		decorationEntity.setStatus(model.getStatus());
		TbDecorationType decorationType = new TbDecorationType();
		decorationType.setId(model.getDecorationType().getId());
		decorationEntity.setDecorationType(decorationType);
		decorationDAO.merge(decorationEntity);
	}

}
