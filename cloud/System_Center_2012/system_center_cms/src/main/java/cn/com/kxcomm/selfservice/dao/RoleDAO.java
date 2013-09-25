package cn.com.kxcomm.selfservice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import cn.com.kxcomm.base.dao.CommonDAO;
import cn.com.kxcomm.common.Page;
import cn.com.kxcomm.entity.RoleEntity;
import cn.com.kxcomm.entity.RoleRinghtEntity;

/**
 * 
* 功能描述:角色数据交互层
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-10
* @author chenliang 修改日期：2013-9-10
* @since system_center_cms
 */
public class RoleDAO  extends CommonDAO<RoleEntity> {
	public static Logger log = Logger.getLogger(RoleDAO.class);
	
	public Integer saveRole(RoleEntity entity) {
		log.debug("entity in CommonDAO.save():"+entity);
	  return  (Integer)this.getSqlMapClientTemplate().insert(RoleEntity.class.getName()+".insert", entity);
	  
	}
	
	
	public void deleteRoleRight(RoleRinghtEntity entity){
		this.getSqlMapClientTemplate().delete(
				RoleEntity.class.getName() + ".deleteRoleRinght",
				entity);
	}
	
	public void insertRoleRight(RoleRinghtEntity entity){
		this.getSqlMapClientTemplate().insert(
				RoleEntity.class.getName() + ".insertRoleRinght",
				entity);
	}
	
	public void updateRoleRight(RoleRinghtEntity entity){
		this.getSqlMapClientTemplate().update(
				RoleEntity.class.getName() + ".updateRoleRinght",
				entity);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<RoleRinghtEntity> selectRoleRinght(String id){
		return (ArrayList<RoleRinghtEntity>) getSqlMapClientTemplate()
		.queryForList(
				RoleEntity.class.getName()
						+ ".selectRoleRinght", id);
	}
	
//	public Page search(RoleQueryVO queryVO) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		Page page = null;
//		try {
//			conn = this.getSqlMapClient().getDataSource().getConnection();// 获得连接
//			// ----------------------1.构建查询条件----------------------------
//			StringBuilder countwhere = new StringBuilder(" where 1=1 ");
//			if (!BlankUtil.isBlank(queryVO.getRoleName())) {
//				countwhere.append(" and role_name like ? ");
//			}
//			
//			log.debug("1.构建查询条件:"+countwhere.toString());
//			// -------------------------2.构建排序---------------------------------
//			String orderBy = "";
//			if (!BlankUtil.isBlank(queryVO.getSort())) {
//				orderBy = " order by t2." + queryVO.getSort() + " "
//						+ queryVO.getDir();
//			} else {
//				orderBy = " order by t2.create_time desc"; //默认排序
//			}
//			log.debug("2.构建排序:"+orderBy);
//			//--------------------------3.统计总数------------------------------------
//			String sql = "select count(*) as num from tb_role "
//					+ countwhere.toString();
//			int count = 0;
//			pstmt = conn.prepareStatement(sql);
//			int iSet = 0;			
//			if (!BlankUtil.isBlank(queryVO.getRoleName())) {
//				iSet++;
//				pstmt.setString(iSet, "%"+queryVO.getRoleName().trim()+"%");
//			}
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				count = rs.getInt("num");
//				log.debug("3.统计总数:"+count +" countSql:"+sql);
//			}
//
//			// ---------------------------4.创建临时表--------------------
//			String tmpTableName = "#tmp" + System.currentTimeMillis();
//			String createSql = "create table "+tmpTableName+" (syiq  numeric(10,0) identity, id bigint )";
//			pstmt = conn.prepareStatement(createSql);
//			int result = pstmt.executeUpdate();
//			log.debug("4.创建临时表"+result +" createSql:" + createSql);
//
//			// -----------------------------5.加载数据到临时表-------------
//			sql = "insert into " + tmpTableName + " (id)"
//					+ "select top " + queryVO.getEndNum()
//					+ " t2.role_id from tb_role t2 " + countwhere.toString()
//					+ orderBy;
//			
//			pstmt = conn.prepareStatement(sql);
//			iSet = 0;		
//			if (!BlankUtil.isBlank(queryVO.getRoleName())) {
//				iSet++;
//				pstmt.setString(iSet, "%"+queryVO.getRoleName().trim()+"%");
//			}
//			result = pstmt.executeUpdate();
//			log.debug("5.加载数据到临时表:" +result+" sql:"+ sql);
//
//			// ------------------------------6.分页查询临时表数据-----------------------
//			sql = "select t.syiq,t2.* from " + tmpTableName
//					+ " t ,tb_role t2 where  t.id =t2.role_id and t.syiq <="
//					+ queryVO.getEndNum() + " and t.syiq >"
//					+ queryVO.getStatrtNum() + orderBy;
//			log.debug("6.分页查询临时表数据:" + sql);
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			List<RoleEntity> list = new ArrayList<RoleEntity>();
//			while (rs.next()) {
//				RoleEntity entity = new RoleEntity();
//				entity.setCreateTime(rs.getTimestamp("create_time"));
//				entity.setOperatorId(rs.getLong("operator_id"));
//				entity.setRoleId(rs.getInt("role_id"));
//				entity.setRoleName(rs.getString("role_name"));
//				entity.setUpdateTime(rs.getTimestamp("update_time"));
//				list.add(entity);
//			}
//			page = new Page(queryVO.getStatrtNum(), count, queryVO
//					.getPageSize(), list);
//			//--------------------------------7.删除临时表-------------------------------
//			sql = "drop table " + tmpTableName;
//			pstmt = conn.prepareStatement(sql);
//			result = pstmt.executeUpdate();
//			log.debug("7.删除临时表"+result+" dropSql:" + sql);
//			conn.commit();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null)
//					rs.close();
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//				log.error(e);
//			}
//		}
//		return page;
//	}
}
