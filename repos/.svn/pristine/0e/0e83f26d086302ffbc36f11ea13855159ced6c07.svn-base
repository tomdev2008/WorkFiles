package com.unicom.mms.cms.service.ipml;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.action.util.FileUtil;
import com.unicom.mms.cms.dao.BgMusicDAO;
import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.service.BgMusicService;
import com.unicom.mms.entity.TbBgMusic;
import com.unicom.mms.resources.FileType;
import com.unicom.mms.resources.socket.ClientSocket;
/**
 * 
* 功能描述:背景音乐管理
* @author lujia 新增日期：2013-3-3
* @since mms-cms-unicom
 */
@Service("bgMusicService")
public class BgMusicServiceImpl extends CommonServiceImpl<TbBgMusic> implements BgMusicService{
	public static Logger log = Logger.getLogger(BgMusicServiceImpl.class);

	@Autowired(required = true)
	private BgMusicDAO bgMusicDAO;
	
	@Override
	public CommonDAO<TbBgMusic> getBindDao() {
		return bgMusicDAO;
	}

	@Override
	public void saveBgMuisc(TbBgMusic model, HashMap<String, Object> map) {
		try {
			//1、背景音乐文件上传到cms服务器
			File file = (File) map.get("file");
			String fileName = (String) map.get("fileName");
			String picUrl = (String) map.get("picUrl");
			FileUtil.bakTemplatesDoc(file, picUrl, fileName, false, 0);
			
			//2、把cms图片上传到图片服务器
			long time = System.currentTimeMillis();
			String path = new ClientSocket().sendFile(socketHost, socketport,picUrl+File.separator+fileName,time+fileName,"null",FileType.MusicType);

			//3、保存模板明信片
			model.setFileUrl(path); //上传地址
			bgMusicDAO.save(model);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateBgMusic(TbBgMusic model) {
		//根据id查找
		TbBgMusic bgMusicEntity = bgMusicDAO.findById(model.getId());
		bgMusicEntity.setName(model.getName());
		bgMusicEntity.setStauts(model.getStauts());
		bgMusicDAO.merge(bgMusicEntity);
	}

}
