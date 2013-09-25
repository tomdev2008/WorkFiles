package cn.com.kxcomm.base.dao;


import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class CommonDAO<T> extends SqlMapClientDaoSupport {
	public static Logger log = Logger.getLogger(CommonDAO.class);
	
	/**
	 * 
	* 方法用途和描述: 保存实体对象
	* @param entity
	* @return id
	* @author libu 新增日期：2010-6-1
	* @author chenhui 修改日期：2010-6-5
	* @since zte_crbt_bi
	 */
	public Long save(T entity) {
	  return  (Long)this.getSqlMapClientTemplate().insert(entity.getClass().getName()+".insert", entity);
	  
	}

	/**
	 * 
	* 方法用途和描述: 根据传入的实体对象类型，查询全部数据
	* @param entityClass
	* @return
	* @author libu 新增日期：2010-6-1
	* @author chenhui 修改日期：2010-6-5
	* @since zte_crbt_bi
	 */
	@SuppressWarnings("unchecked")
	public List<T> listAll(Class entityClass){
		
		return (List<T>)getSqlMapClientTemplate().queryForList(entityClass.getName()+".listAll");
	}
	
	/**
	 * 
	* 方法用途和描述: 根据ID，获取实体列表
	* @param entityClass
	* @param id (Long型)
	* @return
	* @author chenhui 新增日期：2010-6-23
	* @author 你的姓名 修改日期：2010-6-23
	* @since zte_crbt_bi
	 */
	@SuppressWarnings("unchecked")
	public List<T> listAllById(Class entityClass,Long id){
		
		return (List<T>)getSqlMapClientTemplate().queryForList(entityClass.getName()+".listAllById",id);
	}
	
	/**
	 * 
	* 方法用途和描述: 根据ID，获取实体列表
	* @param entityClass
	* @param id (Integer型)
	* @return
	* @author chenhui 新增日期：2010-6-23
	* @author 你的姓名 修改日期：2010-6-23
	* @since zte_crbt_bi
	 */
	@SuppressWarnings("unchecked")
	public List<T> listAllById(Class entityClass,Integer id){
		
		return (List<T>)getSqlMapClientTemplate().queryForList(entityClass.getName()+".listAllById",id);
	}
	
	/**
	 * 
	* 方法用途和描述: 根据权限功能的ID，获取子权限功能列表
	* @param entityClass
	* @param id
	* @return
	* @author chenhui 新增日期：2010-6-25
	* @author 你的姓名 修改日期：2010-6-25
	* @since zte_crbt_bi
	 */
	@SuppressWarnings("unchecked")
	public List<T> listAllByPId(Class entityClass,Integer id){
		
		return (List<T>)getSqlMapClientTemplate().queryForList(entityClass.getName()+".listAllByPId",id);
	}
	
	
	/**
	 * 根据传入的查询对象VO来查询符合条件的结果
	 * @param entityClass
	 * @return
	 */
//	@SuppressWarnings("unchecked")
//	public List<T> listAllByVO(QueryVO queryVO,Class entityClass){
//		return (List<T>)getSqlMapClientTemplate().queryForList(entityClass.getName()+".listAllByVO",queryVO);
//	}
	
	/**
	 * 
	* 方法用途和描述: 根据ID获取实体对象
	* @param entityClass
	* @param id
	* @return
	* @author libu 新增日期：2010-6-1
	* @author 你的姓名 修改日期：2010-6-1
	* @since zte_crbt_bi
	 */
	@SuppressWarnings("unchecked")
	public T get(Class entityClass,Serializable id){
		return (T)getSqlMapClientTemplate().queryForObject(entityClass.getName()+".selectByID",id);
	}
	
	/**
	 * 
	* 方法用途和描述: 更新对象
	* @param entity
	* @author libu 新增日期：2010-6-1
	* @author 你的姓名 修改日期：2010-6-1
	* @since zte_crbt_bi
	 */
	public void update(T entity) {
		this.getSqlMapClientTemplate().update(entity.getClass().getName()+".update", entity);
	}
	
	/**
	 * 
	* 方法用途和描述: 根据主键返回对应的记录数量
	* @param entity
	* @param id
	* @return
	* @author chenhui 新增日期：2010-6-24
	* @author 你的姓名 修改日期：2010-6-24
	* @since zte_crbt_bi
	 */
	@SuppressWarnings("unchecked")
	public Long selectCountById(Class entityClass,Long id){
		
		return (Long)this.getSqlMapClientTemplate().queryForObject(entityClass.getName()+".selectCountById", id);
	}

	
	/**
	 * 
	* 方法用途和描述: 分页查询
	* @param statement
	* @param start
	* @param end
	* @return 
	* @author libu 新增日期：2010-6-1
	* @author 你的姓名 修改日期：2010-6-1
	* @since zte_crbt_bi
	 */
	@SuppressWarnings("unchecked")
	public List<T> listByLimit(Class entityClass, int startIndex,
			int maxResult) {//TODO
		return (List<T>)getSqlMapClientTemplate().queryForList(entityClass.getName()+".listByLimit");
	}
	
	/**
	 * 
	* 方法用途和描述: 按条件查询
	* @param statement
	* @param values 查询条件的数组
	* @return 
	* @author libu 新增日期：2010-6-1
	* @author 你的姓名 修改日期：2010-6-1
	* @since zte_crbt_bi
	 */
	@SuppressWarnings("unchecked")
	public List<T> listByPram(Class entityClass, Object parameterObject) {
		return (List<T>)getSqlMapClientTemplate().queryForList(entityClass.getName()+".listByPram",parameterObject);
	}
	
	
	/**
	 * 
	* 方法用途和描述: 按条件分页查询
	* @param statement
	* @param values
	* @param startIndex
	* @param maxResult
	* @return 
	* @author libu 新增日期：2010-6-1
	* @author 你的姓名 修改日期：2010-6-1
	* @since zte_crbt_bi
	 */
	@SuppressWarnings("unchecked")
	public List<T> listByPramLimit(Class entityClass, Object parameterObject, int startIndex,
			int maxResult) {//TODO 没有实现
		return null;
	}
	
	/**
	 * 
	* 方法用途和描述: 按条件查询获取
	* @param entityClass
	* @param parameterObject
	* @param keyProp 作为map中的key的实体对象的属性名
	* @return
	* @author libu 新增日期：2010-6-1
	* @author 你的姓名 修改日期：2010-6-1
	* @since zte_crbt_bi
	 */
	@SuppressWarnings("unchecked")
	public Map<? extends Serializable,T> mapByArrLimit(Class entityClass, Object parameterObject, String keyProp) {
		return (Map<? extends Serializable,T>)this.getSqlMapClientTemplate().queryForMap(entityClass.getName()+".mapByArrLimit", parameterObject, keyProp);
	}
	


	/**
	 * 
	* 方法用途和描述: 保存集合中存放的实体对象
	* @param entity
	* @return 保存数据的ID集合
	* @author libu 新增日期：2010-6-1
	* @author 你的姓名 修改日期：2010-6-1
	* @since zte_crbt_bi
	 */
	public void save(List<T> entities) {
		for(T entity:entities){
			save(entity);
		}
	
	}
	

	
	/**
	 * 
	* 方法用途和描述: 批量更新
	* @param entities
	* @author libu 新增日期：2010-6-1
	* @author 你的姓名 修改日期：2010-6-1
	* @since zte_crbt_bi
	 */
	public void update(List<T> entities) {
		for(T entity:entities){
			update(entity);
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 删除对象
	* @param entity
	* @author libu 新增日期：2010-6-1
	* @author 你的姓名 修改日期：2010-6-1
	* @since zte_crbt_bi
	 */
	public void delete(T entity) {
		this.getSqlMapClientTemplate().delete(entity.getClass().getName()+".deleteByID", entity);
	}
	
	/**
	 * 
	* 方法用途和描述: 删除对象
	* @param entityClass
	* @param id
	* @author libu 新增日期：2010-6-1
	* @author 你的姓名 修改日期：2010-6-1
	* @since zte_crbt_bi
	 */
	@SuppressWarnings("unchecked")
	public void delete(Class entityClass,Serializable id) {
		this.getSqlMapClientTemplate().delete(entityClass.getName()+".deleteByID", id);
	}

	/**
	 * 
	* 方法用途和描述: 批量删除对象
	* @param entities
	* @author libu 新增日期：2010-6-1
	* @author 你的姓名 修改日期：2010-6-1
	* @since zte_crbt_bi
	 */
	public void delete(List<T> entities) {
		for(T entity:entities){
			delete(entity);
		}
	}
	
	/**
	 * 
	* 方法用途和描述:批量删除对象
	* @param entityClass
	* @param ids
	* @author libu 新增日期：2010-6-1
	* @author 你的姓名 修改日期：2010-6-1
	* @since zte_crbt_bi
	 */
	@SuppressWarnings("unchecked")
	public void delete(Class entityClass,Serializable[] ids){
		for(Serializable id:ids){
			delete(entityClass,id);
		}
	}
	
	public void realeaseResource(Connection conn,Statement stmt,ResultSet rs){
		if(rs!=null){
			try {
				rs.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
}
