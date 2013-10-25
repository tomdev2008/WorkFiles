package cn.com.mmsweb.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import cn.com.common.Page;
import cn.com.mmsweb.vo.SendRecsVo;

import com.unicom.mms.entity.TbSendedMmsRecs;

/**
*
* 功能描述:我的发送记录类
* @author lujia 新增日期：2013-4-17
* @since mms-web-unicom
*/
public class SendRecsDAO extends CommonDAO<TbSendedMmsRecs>{
	private static Logger log = Logger.getLogger(SendRecsDAO.class);
	
	  public List<SendRecsVo> queryByPage (int pageSize, int pageNow,String sponsor) {
		   List<TbSendedMmsRecs> list = new ArrayList<TbSendedMmsRecs>();
		   List<SendRecsVo> list2=new ArrayList<SendRecsVo>();
		   try {
			   //最大页数
			   int maxPage=this.maxPage(pageSize, pageNow,sponsor);
			   //判断当前页，最小一页不能小于1
			   if(pageNow<=0){
				   pageNow = 1;
			   }
			   //判断当前页，最大一页不能大于总数/页大小
			   if(pageNow>maxPage){
				   pageNow = maxPage;
			   }
			   String hql=" from TbSendedMmsRecs c where c.channel=1 and c.sponsor="+sponsor+" order by c.id ";//limit "+(pageNow*pageSize-pageSize)+","+pageSize;
			   Page<TbSendedMmsRecs> page = new Page<TbSendedMmsRecs>();
			   page.setPageSize(pageSize);
			   page.setPageNo(pageNow);
		       Page<TbSendedMmsRecs> pagelist=this.findByPage(page, hql);
		       list = pagelist.getResult();
		       for(TbSendedMmsRecs sendRecs:list)
		       {
		    	   SendRecsVo sendRecsVo=new SendRecsVo();
		    	   sendRecsVo.setId(""+sendRecs.getId());
		    	   sendRecsVo.setMusicUrl(sendRecs.getMusicUrl());
		    	   sendRecsVo.setPicUrl(sendRecs.getPicUrl());
		    	   sendRecsVo.setReciver(sendRecs.getReciver());
		    	   sendRecsVo.setTitle(sendRecs.getTitle());
		    	   sendRecsVo.setUserName(sendRecs.getSponsor());
		    	   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");  
		    	   sendRecsVo.setSendTime(sdf.format(sendRecs.getSendTime()));
		    	   System.out.println("@@@@@@@@@@@@@@@@@@@@@@@!!!!!"+sendRecsVo.getTitle());
		    	   list2.add(sendRecsVo);
		       }
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return list2 ;
		  }
	  
	  //总页数
	  public int maxPage(int pageSize, int pageNow,String sponsor)
	  {
		  int totalount = 0;
		   String countHql = "select count(*) from TbSendedMmsRecs c where c.channel=1 and  c.sponsor="+sponsor;
		   totalount = findTotalCount(countHql);
		   int maxPage = 1;
		   maxPage = totalount%pageSize>0?totalount/pageSize+1:totalount/pageSize;
			return maxPage; 
	  }
}
