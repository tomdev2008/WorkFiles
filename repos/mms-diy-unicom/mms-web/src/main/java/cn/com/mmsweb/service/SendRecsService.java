package cn.com.mmsweb.service;

import java.util.List;

import org.apache.log4j.Logger;

import com.unicom.mms.entity.TbSendedMmsRecs;

import cn.com.mmsweb.vo.SendRecsVo;


public interface SendRecsService extends CommonService<TbSendedMmsRecs>{
	public static Logger log = Logger.getLogger(SendRecsService.class);
	
	/**
	 * 分页查询我的发送记录
	 * @return
	 */
	public List<SendRecsVo> queryByPage (int pageSize, int pageNow,String sponsor);
	/**
	 * 总页数
	 * @return
	 */
	public int maxPage(int pageSize, int pageNow,String sponsor);
}
