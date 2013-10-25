package cn.com.mmsweb.action.web;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.common.BlankUtil;
import cn.com.common.Page;
import cn.com.mmsweb.action.util.SessionUtils;
import cn.com.mmsweb.service.BgMusicService;
import cn.com.mmsweb.service.BgPicService;
import cn.com.mmsweb.service.CommonService;
import cn.com.mmsweb.service.DecorationService;
import cn.com.mmsweb.service.PhotoFrameService;
import cn.com.mmsweb.service.PostMarkService;
import cn.com.mmsweb.service.StampService;
import cn.com.mmsweb.service.UserPhotoService;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbBgPic;
import com.unicom.mms.entity.TbPhotoFrame;

public class DiyCardAction extends BaseAction<TbPhotoFrame, String>{
	
	private static Logger log = Logger.getLogger(DiyCardAction.class);
	@Autowired(required=true)
	private PhotoFrameService photoFrameService;
	@Autowired(required=true)
	private UserPhotoService userPhotoService;
	@Autowired(required=true)
	private StampService stampService;
	@Autowired(required=true)
	private PostMarkService postMarkService;
	@Autowired(required=true)
	private DecorationService decorationService;
	@Autowired(required=true)
	private BgMusicService bgMusicService;
	@Autowired(required=true)
	private BgPicService bgPicService;
	@Override
	public CommonService getCommonService() {
		return photoFrameService;
	}
	
	private Page pageUtil;
	private int pageNow=1;
	private int pageSize=20;
	private int maxPage;   //最大页数
	private int picType;	//图片类型
	private int whatpic;	//图片种类
	private String photoFramsId; 	//传回来的图片ID
	
	public String getPhotoFramsId() {
		return this.photoFramsId;
	}

	public void setPhotoFramsId(String photoFramsId) {
		this.photoFramsId = photoFramsId;
	}

	public int getWhatpic() {
		return this.whatpic;
	}

	public void setWhatpic(int whatpic) {
		this.whatpic = whatpic;
	}

	public int getMaxPage() {
		return this.maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getPicType() {
		return this.picType;
	}

	public void setPicType(int picType) {
		this.picType = picType;
	}

	public Page getPageUtil() {
		return this.pageUtil;
	}

	public void setPageUtil(Page pageUtil) {
		this.pageUtil = pageUtil;
	}

	
	@Override
	public TbPhotoFrame getModel() {
		if(null==model){
			model = new TbPhotoFrame();
		}
		return model;
	}

	@Override
	public void setModel(TbPhotoFrame model) {
		this.model = model;
	}

	@Override
	public String[] getIds() {
		return this.ids;
	}

	@Override
	public void setIds(String[] ids) {
		this.ids = ids;
	}

	private List<PhotoFrameVo> frameVos;
	
	public List<PhotoFrameVo> getFrameVos() {
		return this.frameVos;
	}

	public void setFrameVos(List<PhotoFrameVo> frameVos) {
		this.frameVos = frameVos;
	}

	private PhotoFrameVo photoFrameVo;
	
	public PhotoFrameVo getPhotoFrameVo() {
		return this.photoFrameVo;
	}

	public void setPhotoFrameVo(PhotoFrameVo photoFrameVo) {
		this.photoFrameVo = photoFrameVo;
	}
	
	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片
	* @return
	* @author lizl 新增日期：2013-4-25
	* @since mms-web
	 */
	public String queryInitPictrue() {
		log.info("query Pictrue begin！");
		if(1 == this.whatpic) {
			this.frameVos = this.photoFrameService.queryPhotoFramePage(this.pageSize, this.pageNow,this.picType,this.whatpic);
		} else if(2 == this.whatpic) {
			this.frameVos = this.userPhotoService.queryUserPhotosPage(this.pageSize, this.pageNow,this.picType);
		} else if(3 == this.whatpic) {
			this.frameVos = this.stampService.queryStampsPage(this.pageSize, this.pageNow,this.picType);
		} else if(4 == this.whatpic) {
			this.frameVos = this.postMarkService.queryPostMarksPage(this.pageSize, this.pageNow,this.picType);
		} else if(5 == this.whatpic) {
			this.frameVos = this.decorationService.queryDecorationsPage(this.pageSize, this.pageNow,this.picType);
		} else if(7 == this.whatpic) {
			this.frameVos = this.bgMusicService.queryBgMusicsPage(this.pageSize, this.pageNow,this.picType);
		} else if(6 ==this.whatpic){
			this.frameVos = this.bgPicService.queryBgPicPage(this.pageSize, this.pageNow,this.picType);
		} else if(8 == this.whatpic) {
			this.frameVos = this.bgMusicService.queryFontType(this.pageSize, this.pageNow,this.picType);
		}
		this.maxPage = this.photoFrameService.maxPage(this.pageSize, this.pageNow,this.picType,this.whatpic);
		return SUCCESS;
	}
	
	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片根据ID
	* @return
	* @author lizl 新增日期：2013-5-10
	* @since mms-web
	 */
	public String queryPictrueById() {
		
		if(!BlankUtil.isBlank(this.photoFramsId)) {
			TbPhotoFrame frame = this.photoFrameService.getByPk(Integer.parseInt(this.photoFramsId));
			if(null != frame) {
				this.photoFrameVo = new PhotoFrameVo();
				this.photoFrameVo.setId(frame.getId());
				this.photoFrameVo.setPicUrl(frame.getPicUrl());
			}
		}
		return SUCCESS;
	}
	
	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片根据ID
	* @return
	* @author lizl 新增日期：2013-5-10
	* @since mms-web
	 */
	public String queryPictrueType() {
		
		this.frameVos = this.decorationService.queryDecorationsType(this.pageSize, this.pageNow,this.picType);
		return SUCCESS;
	}
	
	/**
	 * 
	* 方法用途和描述:查询相框的所有类型
	* @return
	* @author lizl 新增日期：2013-5-10
	* @since mms-web
	 */
	public String queryFrameType() {
		this.frameVos = this.photoFrameService.queryFramePhotosType();
		return SUCCESS;
	}
	
	/**
	 * 
	* 方法用途和描述:查询页面需要展示的图片根据ID
	* @return
	* @author lizl 新增日期：2013-5-10
	* @since mms-web
	 */
	public String queryDTById() {
		if(!BlankUtil.isBlank(this.photoFramsId)) {
			TbBgPic frame = this.bgPicService.getByPk(Integer.parseInt(this.photoFramsId));
			if(null != frame) {
				this.photoFrameVo = new PhotoFrameVo();
				this.photoFrameVo.setId(frame.getId());
				this.photoFrameVo.setPicUrl(frame.getPicUrl());
			}
		}
		return SUCCESS;
	}
	
	/**
	 * 
	* 方法用途和描述:查询是否登录
	* @return
	* @author lizl 新增日期：2013-9-04
	* @since mms-web
	 */
	public String isLoginUser() {
		HttpSession session = getHttpSession();
		String usermdn = "" + session.getAttribute(SessionUtils.USER_NAME);
		if(null == usermdn || "null".equals(usermdn.trim()) || "".equals(usermdn.trim())) {
			return successInfo("no");
		}
		return SUCCESS;
	}
}
