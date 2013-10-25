package com.unicom.mms.mcp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbDecorationType;
import com.unicom.mms.mcp.dao.DecorationTypeDAO;
/***
 * 
* 功能描述:饰品分类
* <p>版权所有：
* <p>未经本公司许可，不得以任何方式复制或使用本程序任何部分
*
* @author 刘小明 新增日期：2013-2-18
* @author 你的姓名 修改日期：2013-2-18
* @since mms-mcp
 */
@Service("decorationTypeService")
public class DecorationTypeService {
	@Autowired(required = true)
	private DecorationTypeDAO decorationTypeDAO;
	
	public void saveOrUpdate(List<TbDecorationType> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.decorationTypeDAO.getHibernateTemplate().saveOrUpdateAll(list);
		}
	}
	
	public void delete(List<TbDecorationType> list)throws RuntimeException{
		if(list!=null&&!list.isEmpty()){
			this.decorationTypeDAO.deleteAll(list);
		}
	}
}
