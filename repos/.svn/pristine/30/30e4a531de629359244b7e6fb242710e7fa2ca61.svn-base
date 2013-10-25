package cn.com.mmsweb.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.nutz.castor.castor.String2Map;

import cn.com.common.Page;
import cn.com.mmsweb.vo.ContractsVo;
import cn.com.mmsweb.vo.GroupContactsVo;

import com.unicom.mms.entity.TbContacts;
import com.unicom.mms.entity.TbGroupContacts;
import com.unicom.mms.entity.TbGroups;

public class ContactDAO extends CommonDAO<TbContacts>{
	private static Logger log = Logger.getLogger(ContactDAO.class);
	private GroupContactsDAO groupContactsDAO;
	
	
	public GroupContactsDAO getGroupContactsDAO() {
		return groupContactsDAO;
	}
	public void setGroupContactsDAO(GroupContactsDAO groupContactsDAO) {
		this.groupContactsDAO = groupContactsDAO;
	}
	public List<TbContacts> pageInfoQuery(String hql,Page<TbContacts> pageInfo,Object ...p){
		Session  sessionUse = this.getSession();
		Query query=sessionUse.createQuery(hql);
		int j=0;
		for (int i = 0; i < p.length; i++) {
			if(null!=p[i] && !"".equals(p[i])){
				if(p[i]  instanceof Long){
					Long params = Long.parseLong(p[i].toString());
					query.setLong(j, params);
				}
				else if(p[i]  instanceof Integer){
					Integer params = Integer.parseInt(p[i].toString());
					query.setInteger(j, params);
				}
                else if(p[i]  instanceof String){
                	query.setString(j, p[i].toString());
				}
                else if(p[i]  instanceof Date){
                	query.setTimestamp(j, (Date)p[i]);
                }
				j++;
			}
		}
		if ((pageInfo.getPageNo() !=0 && pageInfo.getPageSize() !=0)  ) {  
			query.setFirstResult((pageInfo.getPageNo()-1)*pageInfo.getPageSize()).setMaxResults(pageInfo.getPageSize());
		}
		List<TbContacts> lista = query.list();
		return lista;
	}
	/**
	 * 
	 * 获取总记录数
	 * @author luj 新增日期：2013-2-22
	 * @param criteria 带查询条件的DetachedCriteria
	 * @param hql  执行的   
	 * @return
	 */
	public int findCount(String countHql ,Object ...objects){
		Session  sessionUse = this.getSession();
		SQLQuery sq = sessionUse.createSQLQuery(countHql);
		int j=0;
		for (int i = 0; i < objects.length; i++) {
			log.debug("objects1["+i+"]"+objects[i]);
			if(null!=objects[i] && !"".equals(objects[i]) && -1!=Integer.parseInt(objects[i].toString())){
				sq.setParameter(j, objects[j]);
				j++;
			}
		}
		int count = (Integer) sq.addScalar("count", Hibernate.INTEGER).uniqueResult();
		return count;
	}
	
	/**
	 * 
	 * 执行sql
	 * @author chenl 新增日期：2012-1-22
	 * @param criteria 带查询条件的DetachedCriteria
	 * @param hql  执行的   
	 * @return
	 */
	public List findByPage1(String hql,Page<GroupContactsVo> pageInfo ,Object ...objects){
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
		if ((pageInfo.getPageNo() !=0 && pageInfo.getPageSize() !=0)  ) {  
			sq.setFirstResult((pageInfo.getPageNo()-1)*pageInfo.getPageSize()).setMaxResults(pageInfo.getPageSize());
		}
		List lista = sq.list();
		return lista;
	}
	
	public GroupContactsVo findContactById(Integer id)
	{
		GroupContactsVo groupContactsVo=new GroupContactsVo();
		String hql=" from TbGroupContacts gc where gc.contacts.id=?";
		if(id!=0)
		{
		List<TbGroupContacts> list=groupContactsDAO.find(hql,id);
		for(TbGroupContacts groupContacts:list)
		{
			groupContactsVo.setContactsId(""+groupContacts.getContacts().getId());
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			groupContactsVo.setBirthday(sdf.format(groupContacts.getContacts().getBirthday()));
			groupContactsVo.setEmail(groupContacts.getContacts().getEmail());
			groupContactsVo.setContactsName(groupContacts.getContacts().getName());
			groupContactsVo.setMsn(groupContacts.getContacts().getMdn());
			groupContactsVo.setGroupsId(""+groupContacts.getGroups().getId());
			groupContactsVo.setGroupsName(groupContacts.getGroups().getName());
		}
		}
       return groupContactsVo;		
	}
	
	  public List<GroupContactsVo> queryByPage (int pageSize, int pageNow,String groupsId,Long userId) {
		   List<TbContacts> list = new ArrayList<TbContacts>();
		   List<GroupContactsVo> list2=new ArrayList<GroupContactsVo>();
		   try {
			   int maxPage=this.maxPage(pageSize, pageNow,groupsId,userId);
			   //判断当前页，最小一页不能小于1
			   if(pageNow<=0){
				   pageNow = 1;
			   }
			   //判断当前页，最大一页不能大于总数/页大小
			   if(pageNow>maxPage){
				   pageNow = maxPage;
			   }
			   StringBuffer sb=new StringBuffer();
			   sb.append(" select a.name,a.mdn,a.birthday,a.id,tt.name tname,a.email,tt.bgid from tb_contacts a left join ");
			   sb.append(" (select c.id cid,b.contacts_id bid,c.name,b.groups_id bgid from tb_group_contacts b,tb_groups c where b.groups_id = c.id) tt ");
			   sb.append(" ON a.id=tt.bid where 1=1 ");
			   if(null != groupsId && !"".equals(groupsId) &&  !"null".equals(groupsId)){
				   int id=Integer.parseInt(groupsId);
			   sb.append(" and tt.bgid="+id);
			   }
			   sb.append(" and a.user_id="+userId+" order by a.id");
			   Page<GroupContactsVo> page = new Page<GroupContactsVo>();
			   page.setPageSize(pageSize);
			   page.setPageNo(pageNow);
		         List list3=this.findByPage1(sb.toString(), page);
		         Object[] obj = new Object[list3.size()];	
		 		for (int i = 0; i < list3.size(); i++) {
		 			obj = (Object[])list3.get(i);
		 			GroupContactsVo groupContactsVo=new GroupContactsVo();
		 			groupContactsVo.setContactsName(obj[0].toString());
		 			groupContactsVo.setMsn(obj[1].toString());
		 			groupContactsVo.setBirthday(obj[2]==null?"":obj[2].toString());
		 			groupContactsVo.setContactsId(obj[3].toString());
		 			groupContactsVo.setGroupsName(obj[4]==null?"":obj[4].toString());
		 			groupContactsVo.setEmail(obj[5]==null?"":obj[5].toString());
		 			groupContactsVo.setGroupsId(obj[6]==null?"0":obj[6].toString());
		 			list2.add(groupContactsVo);
		 		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	       return list2 ;
		  }
	  
	  //总页数
	  public int maxPage(int pageSize, int pageNow,String groupsId,Long userId)
	  {
		  int totalount = 0;
		   StringBuffer sb=new StringBuffer();
		   sb.append(" select COUNT(*) count from tb_contacts a left join ");
		   sb.append(" (select c.id cid,b.contacts_id bid,c.name,b.groups_id bgid from tb_group_contacts b,tb_groups c where b.groups_id = c.id) tt ");
		   sb.append(" ON a.id=tt.bid where 1=1 ");
		   if(null != groupsId && !"".equals(groupsId) &&  !"null".equals(groupsId)){
			   int id=Integer.parseInt(groupsId);
		   sb.append(" and tt.bgid="+id);
		   }
		   sb.append(" and a.user_id="+userId+" order by a.id");
		   totalount = findCount(sb.toString());
		   int maxPage = 1;
		   maxPage = totalount%pageSize>0?totalount/pageSize+1:totalount/pageSize;
			return maxPage; 
	  }
	  
	  public List<TbGroupContacts> getContactsByGroupId(Integer groupId)
	  {
		  String hql=" from TbGroupContacts c where c.groups.id=? ";
		  List<TbGroupContacts> gc=groupContactsDAO.find(hql, groupId);
		  return gc;
	  }
	  /*
	   * 查询没有分组的联系人
	   */
	  public List<ContractsVo> getContactsByNotGroups()
	  {
			
		  String sql=" from TbContacts c where c.id not in (select g.contacts.id from TbGroupContacts g) ";
	     List<TbContacts> list=this.find(sql);
	     List<ContractsVo> volist=new ArrayList<ContractsVo>();
		for (TbContacts contacts:list) {
			ContractsVo vo = new ContractsVo();
	     	vo.setId(""+contacts.getId());
			vo.setName(""+contacts.getName());
			vo.setMdn(""+contacts.getMdn());
			volist.add(vo);
		}
		return volist;
	  }
}
