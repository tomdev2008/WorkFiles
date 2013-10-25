package com.unicom.mms.mcp.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbServices;
import com.unicom.mms.mcp.dao.ServiceLogDAO;

/***
 * 
* 功能描述:CMS操作记录业务类
* <p>版权所有：刘小明
* <p>未经本公司许可，不得以任何方式复制或使用本程序任何部分
*
* @author 刘小明 新增日期：2013-2-4
* @author 你的姓名 修改日期：2013-2-4
* @since mms-mcp
 */
@Service("serviceLogService")
public class ServiceLogService {
	
	@Autowired(required = true)
	private ServiceLogDAO serviceLogDAO;
	/**
	 * 
	* 方法用途和描述: 添加CMS操作记录
	* @param entity
	* @author 刘小明 新增日期：2013-2-4
	* @author 你的姓名 修改日期：2013-2-4
	* @since mms-mcp
	 */
	public void saveServiceLog(TbServices entity)throws RuntimeException{
		if(entity!=null){
			serviceLogDAO.save(entity);
		}
	}
}
