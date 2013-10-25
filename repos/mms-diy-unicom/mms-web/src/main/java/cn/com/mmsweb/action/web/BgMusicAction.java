package cn.com.mmsweb.action.web;


import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.mmsweb.service.BgMusicService;
import cn.com.mmsweb.service.CommonService;

import com.unicom.mms.entity.TbBgMusic;

public class BgMusicAction extends BaseAction<TbBgMusic, String>{
	
	private static Logger log = Logger.getLogger(BgMusicAction.class);

	@Autowired(required=true)
	private BgMusicService bgMusicService;
	
	private List<TbBgMusic> bgMusicList;
	
	public List<TbBgMusic> getBgMusicList() {
		return bgMusicList;
	}

	public void setBgMusicList(List<TbBgMusic> bgMusicList) {
		this.bgMusicList = bgMusicList;
	}
	
	@Override
	public CommonService getCommonService() {
		return bgMusicService;
	}

	@Override
	public TbBgMusic getModel() {
		if(null==model){
			model = new TbBgMusic();
		}
		return model;
	}

	@Override
	public void setModel(TbBgMusic model) {
		this.model = model;
	}

	@Override
	public String[] getIds() {
		return ids;
	}

	@Override
	public void setIds(String[] ids) {
		this.ids = ids;
	}
	
	
}
