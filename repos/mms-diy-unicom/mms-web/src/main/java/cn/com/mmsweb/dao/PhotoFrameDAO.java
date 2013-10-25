package cn.com.mmsweb.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import cn.com.common.Page;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbPhotoFrame;

/**
*
* 功能描述:模板明信片
* @author lizl 新增日期：2013-4-25
* @since mms-web-unicom
*/
public class PhotoFrameDAO extends CommonDAO<TbPhotoFrame>{
	private static Logger log = Logger.getLogger(PhotoFrameDAO.class);
	
	public List<PhotoFrameVo> queryByPage (int pageSize, int pageNow,int groupsId,int whatpic) {
	   List<TbPhotoFrame> list = new ArrayList<TbPhotoFrame>();
	   List<PhotoFrameVo> list2=new ArrayList<PhotoFrameVo>();
	   try {
		   int maxPage=this.maxPage(pageSize, pageNow,groupsId,whatpic);
		   //判断当前页，最小一页不能小于1
		   if(pageNow<=0){
			   pageNow = 1;
		   }
		   //判断当前页，最大一页不能大于总数/页大小
		   if(pageNow>maxPage){
			   pageNow = maxPage;
		   }
		   StringBuffer sb=new StringBuffer();
		   sb.append(" from TbPhotoFrame c ");
		   if(!"".equals(groupsId) &&  !"null".equals(groupsId)){
			   sb.append(" where c.frameType.id="+groupsId);
		   }
		   sb.append(" order by c.id ");
		   Page<TbPhotoFrame> page = new Page<TbPhotoFrame>();
		   page.setPageSize(pageSize);
		   page.setPageNo(pageNow);
	       Page<TbPhotoFrame> pagelist=this.findByPage(page, sb.toString());
	       list = pagelist.getResult();
	       for(TbPhotoFrame groupContacts:list){
	    	   PhotoFrameVo groupContactsVo=new PhotoFrameVo();
	    	   groupContactsVo.setId(groupContacts.getId());
	    	   groupContactsVo.setFrameTypeId(groupContacts.getFrameType().getId());
	    	   groupContactsVo.setName(groupContacts.getName());
	    	   groupContactsVo.setPicUrl(groupContacts.getPicUrl());
	    	   groupContactsVo.setStauts(groupContacts.getStauts());
	    	   groupContactsVo.setSmallPic(groupContacts.getSmallFrame());
	    	   list2.add(groupContactsVo);
	       }
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return list2 ;
	}
	  
  //总页数
  public int maxPage(int pageSize, int pageNow,int groupsId,int whatpic){
	  int totalount = 0;
	   StringBuffer sb=new StringBuffer();
	   String whattable = "TbPhotoFrame";
	   if(6 == whatpic) {		//背景音乐
		   whattable = "TbBgPic";
		} else if(2 == whatpic) {		//照片
			whattable = "TbUserPhoto";
		} else if(3 == whatpic) {		//邮票
			whattable = "TbStamp";
		} else if(4 == whatpic) {		//邮戳
			whattable = "TbPostMark";
		} else if(5 == whatpic) {		//饰品
			whattable = "TbDecoration";
		} else if(7 == whatpic) {
			whattable = "TbBgMusic";
		} else {		//照片
			whattable = "TbPhotoFrame";
		}
	   sb.append(" select count(*) from "+whattable+" c ");
	   if(1 == whatpic) {
		   if(!"".equals(groupsId) && !"null".equals(groupsId)){
			   sb.append(" where c.frameType.id="+groupsId);
		   }
	   } else if(5 == whatpic) {
		   if(!"".equals(groupsId) && !"null".equals(groupsId)){
			   sb.append(" where c.decorationType.id="+groupsId);
		   }
	   }
	   totalount = findTotalCount(sb.toString());
	   int maxPage = 1;
	   maxPage = totalount%pageSize>0?totalount/pageSize+1:totalount/pageSize;
	   return maxPage; 
  }
}
