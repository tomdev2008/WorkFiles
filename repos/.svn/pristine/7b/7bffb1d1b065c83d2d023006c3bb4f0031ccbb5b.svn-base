package cn.com.mmsweb.service;

import java.util.List;

import org.apache.log4j.Logger;


import cn.com.mmsweb.vo.CollectVo;

import com.unicom.mms.entity.TbCollect;

public interface CollectService extends CommonService<TbCollect>{
	public static Logger log = Logger.getLogger(CollectService.class);
	
	/**
	 * 分页查询我的收藏
	 * @return
	 */
	public List<CollectVo> queryByPage (int pageSize, int pageNow,Long userId);
	/**
	 * 总页数
	 * @return
	 */
	public int maxPage(int pageSize, int pageNow,Long userId);
}
