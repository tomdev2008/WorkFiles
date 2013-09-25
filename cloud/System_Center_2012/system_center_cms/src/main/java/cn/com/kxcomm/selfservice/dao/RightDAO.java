package cn.com.kxcomm.selfservice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import cn.com.kxcomm.base.dao.CommonDAO;
import cn.com.kxcomm.entity.RightEntity;
import cn.com.kxcomm.selfservice.vo.MenuEntity;

/**
 * 
* 功能描述:权限数据交互层
* 版权所有：康讯通讯
* 未经本公司许可，不得以任何方式复制或使用本程序任何部分
* @author chenliang 新增日期：2013-9-10
* @author chenliang 修改日期：2013-9-10
* @since system_center_cms
 */
public class RightDAO extends CommonDAO<RightEntity> {
	public static Logger log = Logger.getLogger(RightDAO.class);

	public ArrayList<MenuEntity> queryMenu() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsMenu = null;
		ResultSet rsRight = null;
		ArrayList<MenuEntity> list = null;
		try {
			list = new ArrayList<MenuEntity>();
			conn = this.getSqlMapClient().getDataSource().getConnection();// 获得连接
			String sql = "SELECT * FROM tb_ringht where level =1";
			log.debug(sql);
			pstmt = conn.prepareStatement(sql);
			rsMenu = pstmt.executeQuery();
			while (rsMenu.next()) {
				MenuEntity entityMenu = new MenuEntity();
				entityMenu.setCreateTime(rsMenu.getTimestamp("create_time"));
				entityMenu.setLevel(rsMenu.getShort("level"));
				entityMenu.setMenuId(rsMenu.getInt("right_id"));
				entityMenu.setMenuName(rsMenu.getString("right_name"));
				entityMenu.setUrl(rsMenu.getString("url"));
				ArrayList<RightEntity> listRight = null;
				sql = "SELECT * FROM tb_ringht where level =2 and parent_id = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, entityMenu.getMenuId());
				rsRight = pstmt.executeQuery();
				listRight = new ArrayList<RightEntity>();
				while (rsRight.next()) {
					RightEntity entityRight = new RightEntity();
					entityRight.setCreateTime(rsRight
							.getTimestamp("create_time"));
					entityRight.setLevel(rsRight.getShort("level"));
					entityRight.setParentId(rsRight.getInt("parent_id"));
					entityRight.setRightId(rsRight.getInt("right_id"));
					entityRight.setRightName(rsRight.getString("right_name"));
					entityRight.setUrl(rsRight.getString("url"));
					listRight.add(entityRight);
//					log.debug(entityRight.toString());
				}
				entityMenu.setList(listRight);
				list.add(entityMenu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rsMenu != null)
					rsMenu.close();
				if (rsRight != null)
					rsRight.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
				log.error(e);
			}
		}
		return list;
	}
	
	/**
	 * 
	* 方法用途和描述: 根据用户角色ID，返回角色具有的菜单及权限列表
	* @return
	* @author chenhui 新增日期：2010-6-23
	* @author 你的姓名 修改日期：2010-6-23
	* @since zte_crbt_bi
	 */
	public ArrayList<MenuEntity> queryMenu(Integer roleId) {
		long startTime = System.currentTimeMillis();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsMenu = null;
		ResultSet rsRight = null;
		ArrayList<MenuEntity> list = null;
		ArrayList<RightEntity> rightEListInMenu = null;
//		HashMap<Integer,MenuEntity> tempMenuMap = null;
		
		try {
//          方案1:经测试，查询时间大概范围为：15ms--47ms			
			list = new ArrayList<MenuEntity>();
			conn = this.getSqlMapClient().getDataSource().getConnection();// 获得连接
			String sql = "select distinct(t3.right_id) as right_id,t3.right_name,t3.url,t3.level, t3.parent_id,t3.create_time "
				+ " from tb_ringht t3 where t3.is_menu=1 and t3.right_id in "
				+ " ( "
				+ " select t2.right_id "
				+ " from tb_rs_role_ringht t1,tb_ringht t2 "
				+ " where t2.right_id=t1.right_id "
				+ " and t1.role_id=? "
				+ " ) or t3.parent_id in "
				+ " ( " 
				+ " select right_id from tb_ringht t4 " 
				+ " where t4.parent_id in ( "
				+ " select t2.right_id "
				+ " from tb_rs_role_ringht t1,tb_ringht t2 "
				+ " where t2.right_id=t1.right_id "
				+ " and t1.role_id=? )"
				+ " ) or t3.parent_id in "
				+ " ( "
				+ " select t2.right_id  " 
				+ " from tb_rs_role_ringht t1,tb_ringht t2  "
				+ " where t2.right_id=t1.right_id  "
				+ " and t1.role_id=? "
				+ " )or t3.right_id in "
				+ " ( "
				+ " select t2.parent_id "
				+ " from tb_rs_role_ringht t1,tb_ringht t2 "
				+ " where t2.right_id=t1.right_id "
				+ " and t1.role_id=? "
				+ " ) "; 
			log.debug("sql:"+sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roleId);
			pstmt.setInt(2, roleId);
			pstmt.setInt(3, roleId);
			pstmt.setInt(4, roleId);
			rsRight = pstmt.executeQuery();
			
			ArrayList<RightEntity> rightEntityList =  new ArrayList<RightEntity>();
			RightEntity rightEntity;
			RightEntity tempRightEntity;
			MenuEntity menuEntity;
			int tempid; // 一级菜单ID
			while (rsRight.next()) {					
				rightEntity = new RightEntity();
				rightEntity.setCreateTime(rsRight.getTimestamp("create_time"));
				rightEntity.setLevel(rsRight.getShort("level"));
				rightEntity.setParentId(rsRight.getInt("parent_id"));
				rightEntity.setRightId(rsRight.getInt("right_id"));
				rightEntity.setRightName(rsRight.getString("right_name"));
				rightEntity.setUrl(rsRight.getString("url"));
				rightEntityList.add(rightEntity);
			}
			if(null!=rightEntityList&&rightEntityList.size()>0){
				ArrayList<RightEntity> tempREL = new ArrayList<RightEntity>();
			    tempREL.addAll(rightEntityList);	 // 对象拷贝，用来比较
				for(int i=0;i<rightEntityList.size();i++){
					rightEntity = rightEntityList.get(i);					
					if(1==(short)rightEntity.getLevel()){	
						menuEntity = new MenuEntity();
						menuEntity.setCreateTime(rightEntity.getCreateTime());
						menuEntity.setLevel(rightEntity.getLevel());
						menuEntity.setMenuId(rightEntity.getRightId());
						menuEntity.setMenuName(rightEntity.getRightName());
						menuEntity.setUrl(rightEntity.getUrl());
						tempid = rightEntity.getRightId();
						rightEListInMenu = new ArrayList<RightEntity>();
						for(int j=0;j<tempREL.size();j++){
							tempRightEntity = tempREL.get(j);
							if(tempid==tempRightEntity.getParentId()&&2==(short)tempRightEntity.getLevel()){ //如果是二级菜单，并且父菜单ID对应外层一级菜单的ID
								rightEListInMenu.add(tempRightEntity);
							}
						} // end for 内层
						menuEntity.setList(rightEListInMenu);
						list.add(menuEntity);
					}					    
				} // end for 外层				
			}
			
			
//          方案2:经测试，查询时间大概范围为：850ms--910ms			
//			list = new ArrayList<MenuEntity>();
////			****************************************
////			1     查询角色具有的权限信息
////			****************************************
//			conn = this.getSqlMapClient().getDataSource().getConnection();// 获得连接
////			1-1  查询角色具有的二级菜单
//			String sql = " SELECT t2.right_id,t2.right_name,t2.url,t2.level, t2.parent_id,t2.create_time "
//				       + " FROM tb_rs_role_ringht t1,tb_ringht t2 where t2.level =2 and t1.right_id = t2.right_id"
//				       +"  and t1.role_id="+roleId;
//			log.debug("sql:"+sql);
//			String sql2 = "";
//			pstmt = conn.prepareStatement(sql);
//			rsRight = pstmt.executeQuery();
//			
//			ArrayList<RightEntity> listRight =  new ArrayList<RightEntity>();
//			RightEntity entityRight;
//			MenuEntity entityMenu;
//			tempMenuMap = new HashMap<Integer,MenuEntity>();
//			Integer keyArry[] = new Integer[100];
//			int keySize=0;
//			while (rsRight.next()) {					
//				entityRight = new RightEntity();
//				entityRight.setCreateTime(rsRight.getTimestamp("create_time"));
//				entityRight.setLevel(rsRight.getShort("level"));
//				entityRight.setParentId(rsRight.getInt("parent_id"));
//				entityRight.setRightId(rsRight.getInt("right_id"));
//				entityRight.setRightName(rsRight.getString("right_name"));
//				entityRight.setUrl(rsRight.getString("url"));
//				listRight.add(entityRight);
////				查询二级菜单拥有的一级菜单：
//				sql2 = " SELECT t2.right_id,t2.right_name,t2.url,t2.level, t2.parent_id,t2.create_time "
//				       + " FROM tb_ringht t2 where t2.level =1  and  t2.right_id in ( "
//				       + " select t.parent_id from tb_ringht t where t.right_id = "+entityRight.getRightId()
//				       +"  ) ";
//				pstmt = conn.prepareStatement(sql2);
////				pstmt.setInt(1, entityRight.getRightId());
////				log.info("sql2:"+sql2);
//				rsMenu = pstmt.executeQuery();				
//				while (rsMenu.next()) {
//					entityMenu= new MenuEntity();					
//					entityMenu.setCreateTime(rsMenu.getTimestamp("create_time"));
//					entityMenu.setLevel(rsMenu.getShort("level"));
//					entityMenu.setMenuId(rsMenu.getInt("right_id"));
//					entityMenu.setMenuName(rsMenu.getString("right_name"));
//					entityMenu.setUrl(rsMenu.getString("url"));	
//					if(tempMenuMap.containsKey(rsMenu.getInt("right_id"))){
//						
//					}else{
//						keyArry[keySize]=rsMenu.getInt("right_id");
//						keySize++;						
//					    tempMenuMap.put(rsMenu.getInt("right_id"), entityMenu);
//				    }
//				}  // end while 2
//			} // end while 1	
////			****************************************
////			2     构造结构化的一二级菜单输出列表
////			****************************************
//			if (null != tempMenuMap && tempMenuMap.size() > 0) {
//				log.debug("keySize:"+keySize);
//				for (int i = 0; i < keySize; i++) { // 循环一级菜单
//
//					entityMenu = tempMenuMap.get(keyArry[i]);
//
//					if (null != listRight && listRight.size() > 0) {
//						rightEListInMenu = new ArrayList<RightEntity>();
//						for (int j = 0; j < listRight.size(); j++) { // 循环二级菜单
//							entityRight = listRight.get(j);
////							log.info("j:"+j+",entityRight"+entityRight);
////							log.info("entityMenu:"+entityMenu);
//							if (null != entityRight&& entityRight.getParentId() == entityMenu.getMenuId()) {
//								rightEListInMenu.add(entityRight);
//							}
//						}
//						entityMenu.setList(rightEListInMenu);
//					} // end if
//					list.add(entityMenu);
//				} // end for
//			}// end if 
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rsMenu != null)
					rsMenu.close();
				if (rsRight != null)
					rsRight.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
				log.error(e);
			}
		}
		long endTime = System.currentTimeMillis();
		log.debug("query Menu cost:"+(endTime-startTime));
		return list;
	}
}
