/*
 * Created on 2005-12-2
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.jpkj.crbt.gdcms.database;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;
import java.util.StringTokenizer;
import java.util.Vector;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

/**
 * @author lifeng
 *
 * ����ΰ�޸ģ��ڲ���ʵ���߼�����DBCP�����ӳأ����֮ǰ����̫��û�ö�����´�ʹ��ʱ�������ӶϿ���BUG
 * 
 */
public class DBManager {
	class DBConnectionPool {
		private BasicDataSource dataSource;
		private String name;


		public synchronized void freeConnection(Connection con)	{
			try {
				con.close();
				log.debug("�ͷ�1������.��Ծ��:"+dataSource.getNumActive()+",������:"+dataSource.getNumIdle());
//				System.out.println("�ͷ�1������.��Ծ��:"+dataSource.getNumActive()+",������:"+dataSource.getNumIdle());
			} catch (SQLException e) {
				log.error("�޷��ͷ��������", e);
			}
		}

		public synchronized Connection getConnection() throws Exception	{
			Connection con = dataSource.getConnection();
			log.debug("��ȡ1������.��Ծ��:"+dataSource.getNumActive()+",������:"+dataSource.getNumIdle());
//			System.out.println("��ȡ1������.��Ծ��:"+dataSource.getNumActive()+",������:"+dataSource.getNumIdle());
			return con;
		}


		public synchronized void release() {
			try {
				dataSource.close();
			} catch (SQLException e) {
				log.error("�޷��ر����ӳ�", e);
			}
		}



		public DBConnectionPool(String name, String URL, String user, String password, int maxConn)	{
			dataSource=new BasicDataSource();
			this.name = name;
			dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
			dataSource.setUrl(URL);
			dataSource.setUsername(user);
			dataSource.setPassword(password);
			dataSource.setMaxActive(maxConn);
			dataSource.setMaxIdle(5);
			dataSource.setMinIdle(1);
			dataSource.setMaxWait(500);
			dataSource.setTestOnBorrow(true); //�������ʱ��������Ƿ����
			dataSource.setValidationQuery("select 1 from dual"); //���ڼ�����ӵ�SQL
			dataSource.setTestWhileIdle(true); //�����е�����
			dataSource.setTimeBetweenEvictionRunsMillis(30*60*1000); //�ڿ������ӻ������߳������ڼ����ߵ�ʱ��ֵ,�Ժ���Ϊ��λ.
			dataSource.setMinEvictableIdleTimeMillis(20*60*1000);
		}
	}


	private static DBManager instance;
	private static int clients;
	private Vector drivers;
	private Hashtable pools;
	private Logger log;

	public static synchronized DBManager getInstance() throws Exception	{
		if(instance == null)
			instance = new DBManager();
		clients++;
		return instance;
	}

	private DBManager()	throws Exception {
		drivers = new Vector();
		pools = new Hashtable();
		init();
	}

	public void freeConnection(String name, Connection con)	{
		DBConnectionPool pool = (DBConnectionPool)pools.get(name);
		if(pool != null)
			pool.freeConnection(con);
	}

	public Connection getConnection(String name) throws Exception {
		DBConnectionPool pool = (DBConnectionPool)pools.get(name);
		if(pool != null)
			return pool.getConnection();
		else
			return null;
	}

	/**
	 * Ϊ�˼���֮ǰ�Ľӿڱ����˷���
	 * @param name
	 * @param time
	 * @return
	 * @throws Exception
	 */
	public Connection getConnection(String name, long time)	throws Exception {
		DBConnectionPool pool = (DBConnectionPool)pools.get(name);
		if(pool != null)
			return pool.getConnection();
		else
			return null;
	}

	public synchronized void release() {
		if(--clients != 0)
			return;
		DBConnectionPool pool;
		for(Enumeration allPools = pools.elements(); allPools.hasMoreElements(); pool.release())
			pool = (DBConnectionPool)allPools.nextElement();

		for(Enumeration allDrivers = drivers.elements(); allDrivers.hasMoreElements();)	{
			Driver driver = (Driver)allDrivers.nextElement();
			try	{
				DriverManager.deregisterDriver(driver);
				log.info(String.valueOf(String.valueOf((new StringBuffer("����JDBC����� ")).append(driver.getClass().getName()).append("��ע��"))));
			}
			catch(SQLException e) {
				log.error("�޷���������JDBC������ע��: ".concat(String.valueOf(String.valueOf(driver.getClass().getName()))), e);
			}
		}

	}

	private void createPools(Properties props) {
		Enumeration propNames = props.propertyNames();
		do {
			if(!propNames.hasMoreElements())
				break;
			String name = (String)propNames.nextElement();
			System.out.println("name="+name);
			if(name.endsWith(".url")) {
				String poolName = name.substring(0, name.lastIndexOf("."));
				String url = props.getProperty(String.valueOf(String.valueOf(poolName)).concat(".url"));
				if(url == null)	{
					log.error(String.valueOf(String.valueOf((new StringBuffer("û��Ϊ���ӳ�")).append(poolName).append("ָ��URL"))));
				}
				else {
					String user = props.getProperty(String.valueOf(String.valueOf(poolName)).concat(".user"));
					String password = props.getProperty(String.valueOf(String.valueOf(poolName)).concat(".password"));
					String maxconn = props.getProperty(String.valueOf(String.valueOf(poolName)).concat(".maxconn"), "0");
					int max;
					try	{
						max = Integer.valueOf(maxconn).intValue();
					}
					catch(NumberFormatException e) {
						log.error(String.valueOf(String.valueOf((new StringBuffer("������������������: ")).append(maxconn).append(" .���ӳ�: ").append(poolName))));
						max = 0;
					}
					DBConnectionPool pool = new DBConnectionPool(poolName, url, user, password, max);
					pools.put(poolName, pool);
					log.info("�ɹ��������ӳ�".concat(String.valueOf(String.valueOf(poolName))));
				}
			}
		} while(true);
	}

	private void init()	throws Exception {
		InputStream is = getClass().getResourceAsStream("/crbtcms.properties");
		Properties dbProps = new Properties();
		try	{
			dbProps.load(is);
		}
		catch(Exception e) {
			System.out.println("���ܶ�ȡ�����ļ�. ��ȷ��crbtweb.properties��CLASSPATHָ����·����");
			throw new Exception("���ܶ�ȡ�����ļ�. ��ȷ��crbtweb.properties��CLASSPATHָ����·����");
		}
		String log4jLocation = dbProps.getProperty("log4j");
		if(log4jLocation == null || log4jLocation.equals("")) {
			System.out.println("log4j����������crbtweb.properties�ļ���û�����ã���ȷ���˻���������ȷ���ã�");
			throw new Exception("log4j����������crbtweb.properties�ļ���û�����ã���ȷ���˻���������ȷ���ã�");
		}
		else {
			PropertyConfigurator.configure(log4jLocation);
			log = Logger.getLogger(getClass());
			loadDrivers(dbProps);
			createPools(dbProps);
			return;
		}
	}

	private void loadDrivers(Properties props) {
		String driverClasses = props.getProperty("drivers");
		for(StringTokenizer st = new StringTokenizer(driverClasses); st.hasMoreElements();)	{
			String driverClassName = st.nextToken().trim();
			try	{
				if(driverClassName.equals("com.sybase.jdbc2.jdbc.SybDriver")) {
					//SybDriver sybDriver = (SybDriver)Class.forName(driverClassName).newInstance();
					//sybDriver.setVersion(com.sybase.jdbcx.SybDriver.VERSION_6);
					//DriverManager.registerDriver(sybDriver);
					//drivers.addElement(sybDriver);
				}
				else {
					Driver driver = (Driver)Class.forName(driverClassName).newInstance();
					DriverManager.registerDriver(driver);
					drivers.addElement(driver);
				}
				log.info("�ɹ�ע��JDBC�����".concat(String.valueOf(String.valueOf(driverClassName))));
			}
			catch(Exception e) {
				log.error(String.valueOf(String.valueOf((new StringBuffer("�޷�ע��JDBC�����: ")).append(driverClassName).append(", ����: ").append(e))));
			}
		}

	}
	public static void main(String args[]) {
		try	{
			DBManager connMgr = getInstance();
			Connection conn = connMgr.getConnection("database1");
			if(conn == null) {
				System.out.println("�޷������ݿ����ӣ�");
				System.exit(1);
			}
			connMgr.freeConnection("database1", conn);
			System.out.println("success!");
//			conn = connMgr.getConnection("database2");
//			if(conn == null) {
//				System.out.println("�޷������ݿ����ӣ�");
//				System.exit(1);
//			}
//			
//			connMgr.freeConnection("database2", conn);
		}
		catch(Exception e) {
			e.printStackTrace();
			System.err.println("Exception is ".concat(String.valueOf(String.valueOf(e))));
		}
	}
}
