package com.unicom.mms.cms.service.ipml;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.action.util.FileUtil;
import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.PostMarkDAO;
import com.unicom.mms.cms.service.PostMarkService;
import com.unicom.mms.entity.TbPostMark;
import com.unicom.mms.resources.FileType;
import com.unicom.mms.resources.socket.ClientSocket;

/**
 * 
* 功能描述:邮戳管理业务逻辑处理类
* @author lujia 新增日期：2013-3-3
* @since mms-cms-unicom
 */
@Service("postMarkService")
public class PostMarkServiceImpl extends CommonServiceImpl<TbPostMark> implements PostMarkService{
	public static Logger log = Logger.getLogger(PostMarkServiceImpl.class);
	@Autowired(required = true)
	private PostMarkDAO postMarkDAO;
	
	
	public PostMarkDAO getPostMarkDAO() {
		return postMarkDAO;
	}

	public void setPostMarkDAO(PostMarkDAO postMarkDAO) {
		this.postMarkDAO = postMarkDAO;
	}

	@Override
	public CommonDAO<TbPostMark> getBindDao() {
		return postMarkDAO;
	}


	@Override
	public void savePostmark(TbPostMark model, HashMap<String, Object> map) {
		try {
		//1、模板明信片文件上传
		File file = (File) map.get("file");
		String fileName = (String) map.get("fileName");
		String picUrl = (String) map.get("picUrl");
		FileUtil.bakTemplatesDoc(file, picUrl, fileName, false, 0);
		//2、把cms图片上传到图片服务器
		long time = System.currentTimeMillis();
		String path = new ClientSocket().sendFile(socketHost, socketport,picUrl+File.separator+fileName,time+fileName,"null",FileType.PostMarkType);
		//2、保存模板明信片
		model.setPicUrl(path); //上传地址
		postMarkDAO.save(model);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void updatePostmark(TbPostMark model) {
		//根据主键id查找
		TbPostMark postMarkEntity = postMarkDAO.findById(model.getId());
		postMarkEntity.setName(model.getName());
		postMarkEntity.setStauts(model.getStauts());
		postMarkDAO.merge(postMarkEntity);
	}

}
