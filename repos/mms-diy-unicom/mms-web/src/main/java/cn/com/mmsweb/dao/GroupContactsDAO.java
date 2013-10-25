package cn.com.mmsweb.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.common.Page;
import cn.com.mmsweb.vo.GroupContactsVo;

import com.unicom.mms.entity.TbContacts;
import com.unicom.mms.entity.TbGroupContacts;

public class GroupContactsDAO extends CommonDAO<TbGroupContacts>{
	private static Logger log = Logger.getLogger(GroupContactsDAO.class);

	  public List<GroupContactsVo> queryByPage (int pageSize, int pageNow,String groupsId) {
		   List<TbGroupContacts> list = new ArrayList<TbGroupContacts>();
		   List<GroupContactsVo> list2=new ArrayList<GroupContactsVo>();
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
			//   String hql=" from TbGroupContacts c  order by c.contacts.id ";//limit "+(pageNow*pageSize-pageSize)+","+pageSize;
			   StringBuffer sb=new StringBuffer();
			   sb.append("select gc from TbGroupContacts gc right join fetch gc.contacts ");
			   if(null != groupsId && !"".equals(groupsId) &&  !"null".equals(groupsId)){
				   int id=Integer.parseInt(groupsId);
			   sb.append(" where gc.groups.id="+id);
			   }
			   sb.append(" order by gc.contacts.id");
			   Page<TbGroupContacts> page = new Page<TbGroupContacts>();
			   page.setPageSize(pageSize);
			   page.setPageNo(pageNow);
		       Page<TbGroupContacts> pagelist=this.findByPage(page, sb.toString());
		       list = pagelist.getResult();
		       for(TbGroupContacts groupContacts:list)
		       {
		    	  GroupContactsVo groupContactsVo=new GroupContactsVo();
		    //	   groupContactsVo.setContactsId(groupContacts.getContacts()!=null?""+groupContacts.getContacts().getId():"");
		   // 	   groupContactsVo.setGroupsId(groupContacts.getGroups()!=null?""+groupContacts.getGroups().getId():"");
		    	   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
		    	   groupContactsVo.setBirthday(sdf.format(groupContacts.getContacts().getBirthday()));
		    	   groupContactsVo.setEmail(groupContacts.getContacts().getEmail());
		    	   groupContactsVo.setContactsName(groupContacts.getContacts().getName());
		    	   groupContactsVo.setGroupsName(groupContacts.getGroups().getName());
		    	   groupContactsVo.setMsn(groupContacts.getContacts().getMdn());
		    	   groupContactsVo.setUserName(groupContacts.getContacts().getUsers().getMdn());
		    	   list2.add(groupContactsVo);
		       }
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return list2 ;
		  }
	  
	  public GroupContactsVo findById(String id)
	  {
	//	  TbContacts contacts=contactsDAO.findById(Integer.parseInt(id));
		  return null;
	  }
	  
	  //总页数
	  public int maxPage(int pageSize, int pageNow,String groupsId)
	  {
		  int totalount = 0;
		   StringBuffer sb=new StringBuffer();//right join TbContacts c on c.id=gc.contacts.id
		   sb.append("select count(gc.id) from TbGroupContacts gc right join gc.contacts ");
		   if(null != groupsId && !"".equals(groupsId) &&  !"null".equals(groupsId)){
			   int id=Integer.parseInt(groupsId);
		   sb.append(" where gc.groups.id="+id);
		   }
		   
		   totalount = findTotalCount(sb.toString());
		   int maxPage = 1;
		   maxPage = totalount%pageSize>0?totalount/pageSize+1:totalount/pageSize;
			return maxPage; 
	  }
	  
		 public List findByContactsId(String hql,Object ...objects)
		 {
			 Session  sessionUse = this.getSession();
				SQLQuery sq=sessionUse.createSQLQuery(hql);
				int j=0;
				for (int i = 0; i < objects.length; i++) {
					log.debug("objects["+i+"]"+objects[i]);
					if(null!=objects[i] && !"".equals(objects[i]) && -1!=Integer.parseInt(objects[i].toString())){
						sq.setParameter(j, objects[j]);
						j++;
					}
				}
				List lista = sq.list();
				return lista;
		 }
		 
}
