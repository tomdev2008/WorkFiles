package cn.com.mmsweb.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import cn.com.common.Page;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbStamp;
import com.unicom.mms.entity.TbUserPhoto;

/**
*
* 功能描述:模板明信片
* @author lizl 新增日期：2013-4-25
* @since mms-web-unicom
*/
public class StampDAO extends CommonDAO<TbStamp>{
	private static Logger log = Logger.getLogger(StampDAO.class);
	
	public List<PhotoFrameVo> queryByPage (int pageSize, int pageNow,int groupsId) {
	   List<TbStamp> list = new ArrayList<TbStamp>();
	   List<PhotoFrameVo> list2=new ArrayList<PhotoFrameVo>();
	   try {
		   int maxPage=this.maxPage(pageSize, pageNow,groupsId);
		   //判断当前页，最小一页不能小于1
		   if(pageNow<=0){
			   pageNow = 1;
		   }
		   //判断当前页，最大一页不能大于总数/页大小
		   if(pageNow>maxPage){
			   pageNow = maxPage;
		   }
		   StringBuffer sb=new StringBuffer();
		   sb.append(" from TbStamp c ");
		   sb.append(" order by c.id ");
		   Page<TbStamp> page = new Page<TbStamp>();
		   page.setPageSize(pageSize);
		   page.setPageNo(pageNow);
	       Page<TbStamp> pagelist=this.findByPage(page, sb.toString());
	       list = pagelist.getResult();
	       for(TbStamp tbStamp:list){
	    	   PhotoFrameVo groupContactsVo=new PhotoFrameVo();
	    	   groupContactsVo.setId(tbStamp.getId());
	    	   groupContactsVo.setName(tbStamp.getName());
	    	   groupContactsVo.setPicUrl(tbStamp.getPicUrl());
	    	   list2.add(groupContactsVo);
	       }
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return list2 ;
	}
	  
  //总页数
  public int maxPage(int pageSize, int pageNow,int groupsId){
	  int totalount = 0;
	   StringBuffer sb=new StringBuffer();
	   String whattable = "TbStamp";
	   sb.append(" select count(*) from "+whattable+" c ");
//	   if(!"".equals(groupsId) && !"null".equals(groupsId)){
//		   sb.append(" where c.frameType.id="+groupsId);
//	   }
	   totalount = findTotalCount(sb.toString());
	   int maxPage = 1;
	   maxPage = totalount%pageSize>0?totalount/pageSize+1:totalount/pageSize;
	   return maxPage; 
  }
}
