package cn.com.kxcomm.systemcenter.domUser.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;

import cn.com.kxcomm.common.base.CommonDAO;
import cn.com.kxcomm.common.db.IbatisClientManager;
import cn.com.kxcomm.entity.DomUserEntity;
import cn.com.kxcomm.entity.PowerShellEntity;

/**
 * 
* 功能描述:脚本数据业务层
* @author chenliang 新增日期：2013-7-3
* @since system_center_sdk
 */
public class PowerShellDAO extends CommonDAO {

	private static final Logger LOGGER = Logger.getLogger(DomUserDAO.class);
	
	private static PowerShellDAO powerShellDAO;
	
	/**
	 * 
	* 方法用途和描述: 单例模式
	* @return
	* @author chenliang 新增日期：2013-6-24
	* @since system_center_sdk
	 */
	public static PowerShellDAO getInstance(){
		if(null==powerShellDAO){
			powerShellDAO = new PowerShellDAO();
		}
		return powerShellDAO;
	}
	
	/**
	 * 
	* 方法用途和描述: 根据条件查询脚本
	* @return
	* @author chenliang 新增日期：2013-6-24
	* @since system_center_sdk
	 */
	public List<PowerShellEntity> listByTypeEntity(){
		try {
			SqlMapClient sqlmap = IbatisClientManager.getSqlMapClient(); 
			List<PowerShellEntity> powerShellList = sqlmap.queryForList(PowerShellEntity.class.getName()+".listByType");
			return powerShellList;
		} catch (SQLException e) {
			e.printStackTrace();
			LOGGER.error("listEntity error",e);
		}
		return null;
	}
	
	
}
