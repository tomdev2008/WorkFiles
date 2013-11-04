package cn.com.mmsweb.service;


import java.util.List;

import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbDecoration;
import com.unicom.mms.entity.TbPostMark;

public interface DecorationService extends CommonService<TbDecoration> {

	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	*/
	public List<PhotoFrameVo> queryDecorationsPage(int pageSize, int pageNow,int pictype);
	
	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	public List<PhotoFrameVo> queryDecorationsType(int pageSize, int pageNow,int pictype);
}