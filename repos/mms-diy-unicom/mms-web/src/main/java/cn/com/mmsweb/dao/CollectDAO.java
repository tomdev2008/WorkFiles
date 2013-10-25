package cn.com.mmsweb.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import cn.com.common.Page;
import cn.com.mmsweb.vo.CollectVo;

import com.unicom.mms.entity.TbCollect;

/**
*
* 功能描述:我的收藏类
* @author lujia 新增日期：2013-4-12
* @since mms-web-unicom
*/
public class CollectDAO extends CommonDAO<TbCollect>{
	private static Logger log = Logger.getLogger(CollectDAO.class);
	
	  public List<CollectVo> queryByPage (int pageSize, int pageNow,Long userId) {
		   List<TbCollect> list = new ArrayList<TbCollect>();
		   List<CollectVo> list2=new ArrayList<CollectVo>();
		   try {
			   // 查询总数
		//	   int totalount = 0;
		//	   String countHql = "select count(*) from TbCollect";
		//	   totalount = findTotalCount(countHql);
			   //最大页数
		//	   int maxPage = 1;
		//	 maxPage = totalount%pageSize>0?totalount/pageSize+1:totalount/pageSize;
			   int maxPage=this.maxPage(pageSize, pageNow,userId);
			   //判断当前页，最小一页不能小于1
			   if(pageNow<=0){
				   pageNow = 1;
			   }
			   //判断当前页，最大一页不能大于总数/页大小
			   if(pageNow>maxPage){
				   pageNow = maxPage;
			   }
			   String hql=" from TbCollect c where c.users.id="+userId+" order by c.id ";//limit "+(pageNow*pageSize-pageSize)+","+pageSize;
			   Page<TbCollect> page = new Page<TbCollect>();
			   page.setPageSize(pageSize);
			   page.setPageNo(pageNow);
		       Page<TbCollect> pagelist=this.findByPage(page, hql);
		       list = pagelist.getResult();
		       for(TbCollect collect:list)
		       {
		    	   CollectVo collectVo=new CollectVo();
		    	   collectVo.setId(""+collect.getId());
		    	   collectVo.setCardTitle(collect.getTemplateCard().getCardTitle());
		    	   collectVo.setName(collect.getTemplateCard().getCardType().getName());
		    	   collectVo.setPicUrl(collect.getTemplateCard().getPicUrl());
		    	   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");  
		    	   collectVo.setTime(sdf.format(collect.getCollectTime()));
		    	   collectVo.setUserName(collect.getUsers().getMdn());
		    	   collectVo.setWishWord(collect.getTemplateCard().getWishWord());
		    	   collectVo.setTemplateCardId(""+collect.getTemplateCard().getId());
		    	   list2.add(collectVo);
		       }
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return list2 ;
		  }
	  
	  //总页数
	  public int maxPage(int pageSize, int pageNow,Long userId)
	  {
		  int totalount = 0;
		   String countHql = "select count(*) from TbCollect c where c.users.id="+userId;
		   totalount = findTotalCount(countHql);
		   int maxPage = 1;
		   maxPage = totalount%pageSize>0?totalount/pageSize+1:totalount/pageSize;
			return maxPage; 
	  }
}
