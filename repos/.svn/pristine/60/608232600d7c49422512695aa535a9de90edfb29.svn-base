package cn.com.mmsweb.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import cn.com.common.Page;
import cn.com.mmsweb.vo.PhotoFrameVo;

import com.unicom.mms.resources.drawinfo.TextInfo;

public class TextInfoDAO extends CommonDAO<TextInfo> {

	private static final Logger LOGGER = Logger.getLogger(TextInfoDAO.class);
	
	public List<PhotoFrameVo> queryByPage (int pageSize, int pageNow,int groupsId) {
		   List<TextInfo> list = new ArrayList<TextInfo>();
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
			   sb.append(" from TextInfo c ");
			   sb.append(" order by c.id ");
			   Page<TextInfo> page = new Page<TextInfo>();
			   page.setPageSize(pageSize);
			   page.setPageNo(pageNow);
		       Page<TextInfo> pagelist=this.findByPage(page, sb.toString());
		       list = pagelist.getResult();
		       for(TextInfo bgMusic:list){
		    	   PhotoFrameVo groupContactsVo=new PhotoFrameVo();
		    	   groupContactsVo.setName(bgMusic.getFontsColor());
		    	   groupContactsVo.setPicUrl(bgMusic.getText());
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
			   String whattable = "TextInfo";
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
