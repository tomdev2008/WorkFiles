package cn.com.kxcomm.selfservice.dao;

import org.apache.log4j.Logger;

import cn.com.kxcomm.base.dao.CommonDAO;
import cn.com.kxcomm.entity.TenantsEntity;

public class TenantsDAO extends CommonDAO<TenantsEntity>{

	public static Logger log = Logger.getLogger(TenantsDAO.class);
	
	/**
	 * 
	* 方法用途和描述: 分页查询方法
	* @param queryVO
	* @return
	* @throws SQLException
	* @author libu 新增日期：2010-6-8
	* @author 你的姓名 修改日期：2010-6-8
	* @since zte_crbt_bi
	 */
/*	public Page search(UserQueryVO queryVO) throws SQLException{
		Connection conn = this.getSqlMapClient().getDataSource().getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			try{
				String sql = "drop table #tmp";
				pstmt = conn.prepareStatement(sql);
				int result = pstmt.executeUpdate();
				log.debug(result+"删除临时表#tmp");
			}catch(Exception e){
				log.debug(e.getMessage());
			}
			
			StringBuilder countwhere = new StringBuilder(" where 1=1 ");
			if(!BlankUtil.isBlank(queryVO.getKeyword()) && !BlankUtil.isBlank(queryVO.getField())){
				countwhere.append(" and ");
				countwhere.append(queryVO.getField().trim());
				countwhere.append(" like '%");
				countwhere.append(queryVO.getKeyword());
				countwhere.append("%'");
			}
			StringBuilder where = new StringBuilder(countwhere);
			where.append(" and ");
			where.append("syiq > ");
			where.append(queryVO.getStatrtNum());
			where.append(" and syiq <=");
			where.append(queryVO.getEndNum());
			String sql = "create table #tmp (syiq  numeric(10,0) identity, ID VARCHAR(32) NOT NULL,ACCOUNT  VARCHAR(20) NULL DEFAULT NULL,"+
						"AGE  integer NULL DEFAULT NULL,"+
			 			"CREATE_TIME DATETIME NULL DEFAULT NULL,"+
			 			"DEP_ID  VARCHAR(32) NULL DEFAULT NULL,"+
						 "EMAIL  VARCHAR(30) NULL DEFAULT NULL,"+
						 "HEAD_SHIP_ID  VARCHAR(32) NULL DEFAULT NULL,"+
						 "LAST_LOGIN_TIME  DATETIME NULL DEFAULT NULL,"+
						 "name  VARCHAR(10) NULL DEFAULT NULL,"+
						 "PASSWORD  VARCHAR(32) NULL DEFAULT NULL,"+
						 "PHONE  VARCHAR(20) NULL DEFAULT NULL)";
			pstmt = conn.prepareStatement(sql);
			int result = pstmt.executeUpdate();
			log.debug(result+"创建临时表#tmp");
			
			sql = "insert into #tmp (ID,ACCOUNT,AGE,CREATE_TIME,DEP_ID,EMAIL,HEAD_SHIP_ID,LAST_LOGIN_TIME,name,PASSWORD,PHONE) select top "+queryVO.getEndNum()+" ID,ACCOUNT,AGE,CREATE_TIME,DEP_ID,EMAIL,HEAD_SHIP_ID,LAST_LOGIN_TIME,name,PASSWORD,PHONE from  tb_systemuser order by id desc";
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			log.debug(result+"数据加载到临时表#tmp");
			
			sql = "select * from #tmp "+where.toString();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			log.debug(result+"查询分页临时表#tmp");
			List<UserEntity> list = new ArrayList<UserEntity>();
			while (rs.next()) {
				UserEntity user = new UserEntity();
				user.setAccount(rs.getString("account"));
				user.setAge(rs.getInt("age"));
				list.add(user);
			}
			
			sql="select count(*) as num from tb_systemuser"+countwhere.toString();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 0;
			if(rs.next())
				count = rs.getInt("num");
			Page resultPage = new Page(queryVO.getStatrtNum(),count,queryVO.getPageSize(),list);
			return resultPage;
		} catch (SQLException e) {
			log.error(e);
			throw e;
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
				log.error(e);
			}
		}
	}*/
}
