package cn.com.mmsweb.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import cn.com.common.Page;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.entity.TbBgPic;

/**
*
* 功能描述:背景图片
* @author lizl 新增日期：2013-4-25
* @since mms-web-unicom
*/
public class BgPicDAO extends CommonDAO<TbBgPic>{
	private static Logger log = Logger.getLogger(BgPicDAO.class);
	public List<PhotoFrameVo> queryByPage (int pageSize, int pageNow,int groupsId) {
		   List<TbBgPic> list = new ArrayList<TbBgPic>();
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
			   sb.append(" from TbBgPic c ");
			   sb.append(" order by c.id ");
			   Page<TbBgPic> page = new Page<TbBgPic>();
			   page.setPageSize(pageSize);
			   page.setPageNo(pageNow);
		       Page<TbBgPic> pagelist=this.findByPage(page, sb.toString());
		       list = pagelist.getResult();
		       for(TbBgPic tbBgPic:list){
		    	   PhotoFrameVo photoFrameVo=new PhotoFrameVo();
		    	   photoFrameVo.setId(tbBgPic.getId());
		    	   photoFrameVo.setName(tbBgPic.getName());
		    	   photoFrameVo.setPicUrl(tbBgPic.getPicUrl());
		    	   list2.add(photoFrameVo);
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
		   String whattable = "TbBgPic";
		   sb.append(" select count(*) from "+whattable+" c ");
		   totalount = findTotalCount(sb.toString());
		   int maxPage = 1;
		   maxPage = totalount%pageSize>0?totalount/pageSize+1:totalount/pageSize;
		   return maxPage; 
	  }
}
