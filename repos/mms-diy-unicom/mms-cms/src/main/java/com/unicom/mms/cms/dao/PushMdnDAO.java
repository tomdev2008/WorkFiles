package com.unicom.mms.cms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;


import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.unicom.mms.entity.TbMdnType;
import com.unicom.mms.entity.TbPushMdn;

/**
 * 
* 功能描述:推送号码数据交互层
* @author chenliang 新增日期：2013-6-27
* @since mms-cms
 */
public class PushMdnDAO extends CommonDAO<TbPushMdn> {

	private static Logger log = Logger.getLogger(PushMdnDAO.class);
	
	public void saveMdn(final TbMdnType mdnType,final List<String> mdnList){

		getHibernateTemplate().execute(new HibernateCallback() {
			Connection conn = null; 
			PreparedStatement ps = null;
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				try {
					String sql = "insert into tb_push_mdn(id,mdn,mdn_type_id) values(SEQ_PUSH_MDN_ID.nextVal,?,"+mdnType.getId()+")";
					conn = session.connection();
					ps = conn.prepareStatement(sql);
					for (int i = 0; i < mdnList.size(); i++) {
						String pushMdn = mdnList.get(i);    
						ps.setString(1, pushMdn);
						ps.addBatch();
						if (i % 1000 == 0) {
							ps.executeBatch();
						}
					}
					if(mdnList.size() % 1000 != 0){
						ps.executeBatch();
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally{
					try {
						if(null!=ps){
							ps.close();
						}
						if(null!=conn){
							conn.close();
						}
						if(null!=session){
							session.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				return null;
			}
		});
		
	}
	
}

