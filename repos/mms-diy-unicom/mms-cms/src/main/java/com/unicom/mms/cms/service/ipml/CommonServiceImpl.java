package com.unicom.mms.cms.service.ipml;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.service.CommonService;
import com.unicom.mms.common.AppConfig;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.common.Page;
import com.unicom.mms.common.ReflectionUtils;

public abstract class CommonServiceImpl<T> implements CommonService<T> {
	
	public static final Logger LOGGER=LoggerFactory.getLogger(CommonServiceImpl.class);
	
	public abstract CommonDAO<T> getBindDao();
	
	//图片服务器地址
	public static final String socketHost = AppConfig.getInstance().getString("socketHost");  //socket地址
	//图片服务器端口
	public static final Integer socketport = AppConfig.getInstance().getInt("socketport");;   //socket端口

	/**
	 * 分页查询
	 */
	@Override
	public Page<T> findByPage(T entity, Page<T> pageInfo) {
		if(!BlankUtil.isBlank(entity)){
			ReflectionUtils.convertEmptyStringPropertyToNull(entity);
			Example example = Example.create(entity).enableLike(MatchMode.ANYWHERE).excludeNone().excludeZeroes();
			return this.getBindDao().findByPage(example,pageInfo);
		}else{
			return this.getBindDao().findByPage(pageInfo);
		}
	}

	/**
	 * 根据主键查询
	 */
	@Override
	public T getByPk(Serializable pk) {
		return getBindDao().findById(pk);
	}
	
	/**
	 * 查找所有
	 */
	@Override
	public List<T> findAll() {
		return getBindDao().findAll();
	}

	/**
	 * 保存
	 */
	@Override
	public void save(T entity) {
		getBindDao().save(entity);
	}

	/**
	 * 修改
	 */
	@Override
	public void update(T entity) {
		getBindDao().saveOrUpdate(entity);
	}
	
	/**
	 * 删除多个实体对象
	 */
	@Override
	public void deleteAllByPks(Serializable[] pks) {
		List<T> entities = new ArrayList<T>();
		for (Serializable pk : pks) {
			T entity = this.getByPk(pk);
			if(!BlankUtil.isBlank(entity))entities.add(entity);
		}
		getBindDao().deleteAll(entities);
	}

	/**
	 * 根据主键删除
	 */
	@Override
	public void deleteByPk(Serializable pk) {
		T entity = this.getByPk(pk);
		getBindDao().delete(entity);
	}
	
	/**
	 * 根据对象删除
	 */
	@Override
	public void delete(T entity) {
		getBindDao().delete(entity);
	}

	/**
	 * 根据字段查询
	 */
	@Override
	public T findByField(String fieldName, Object fieldValue) {
		return getBindDao().findByField(fieldName, fieldValue);
	}

}
