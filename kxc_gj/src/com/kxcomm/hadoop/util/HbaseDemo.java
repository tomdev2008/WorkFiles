package com.kxcomm.hadoop.util;  

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.MasterNotRunningException;
import org.apache.hadoop.hbase.ZooKeeperConnectionException;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.HTableInterface;
import org.apache.hadoop.hbase.client.HTablePool;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.PageFilter;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.util.Bytes;

import com.gaoxing.bean.UserInfo;

public class HbaseDemo {  

	public static Configuration configuration;  
	static {  
		configuration = HBaseConfiguration.create();  
		configuration.set("hbase.zookeeper.property.clientPort", "2181");  
		configuration.set("hbase.zookeeper.quorum", "192.168.1.103,192.168.1.102,192.168.1.101");  
		configuration.set("hbase.master", "192.168.1.103:600000");  
	}  

	public static void main(String[] args) {  

		try {
//			createTable("dongGod"); 
//			insertData("dongGod");
//			QueryAll("kxcomm_gj");  
			queryByScanFilter("kxcomm_gj");
			//QueryByCondition1("dongGod");  
			//QueryByCondition2("dongGod");  
			//QueryByCondition3("dongGod");  
//			deleteRow("dongGod","abcdef");  
//			deleteByCondition("dongGod","abcdef");  
		} catch (Exception e) {
			e.printStackTrace();
		}  
	}  

	/** 
	 * 创建表 
	 * @param tableName 
	 */  
	public static void createTable(String tableName) {  
		System.out.println("start create table ......");  
		try {  
			HBaseAdmin hBaseAdmin = new HBaseAdmin(configuration);  
			if (hBaseAdmin.tableExists(tableName)) {// 如果存在要创建的表，那么先删除，再创建  
				hBaseAdmin.disableTable(tableName);  
				hBaseAdmin.deleteTable(tableName);  
				System.out.println(tableName + " is exist,detele....");  
			}  
			HTableDescriptor tableDescriptor = new HTableDescriptor(tableName);  
			tableDescriptor.addFamily(new HColumnDescriptor("content"));  
			//			tableDescriptor.addFamily(new HColumnDescriptor("column2"));  
			//			tableDescriptor.addFamily(new HColumnDescriptor("column3")); 
			//			tableDescriptor.
			hBaseAdmin.createTable(tableDescriptor);  
		} catch (MasterNotRunningException e) {  
			e.printStackTrace();  
		} catch (ZooKeeperConnectionException e) {  
			e.printStackTrace();  
		} catch (IOException e) {  
			e.printStackTrace();  
		}  
		System.out.println("end create table ......");  
	}  

	/** 
	 * 插入数据 
	 * @param tableName 
	 * @throws IOException 
	 */  
	public static void insertData(String tableName) throws IOException {  
		System.out.println("start insert data ......");  
		HTablePool pool = new HTablePool(configuration, 1000);  
		HTableInterface  table =  pool.getTable(tableName);  
		Put put = new Put(("1598692184020120808131313").getBytes());// 一个PUT代表一行数据，再NEW一个PUT表示第二行数据,每行一个唯一的ROWKEY，此处rowkey为put构造方法中传入的值  
		put.add("content".getBytes(), "url".getBytes(), "www.baidu.com".getBytes());
		table.put(put);  

		put = new Put(("1598692184020120808131313").getBytes());
		put.add("content".getBytes(), "internet_type".getBytes(), "2G".getBytes());
		table.put(put);  

		put = new Put(("1598692184020120808131313").getBytes());
		put.add("content".getBytes(), "file_sizes".getBytes(), "33".getBytes());
		table.put(put);  

		put = new Put(("1598692184020120808131313").getBytes());
		put.add("content".getBytes(), "state".getBytes(), "200".getBytes());
		table.put(put);

		//第2条数据
		put = new Put(("1598692184020120801131313").getBytes());// 一个PUT代表一行数据，再NEW一个PUT表示第二行数据,每行一个唯一的ROWKEY，此处rowkey为put构造方法中传入的值  
		put.add("content".getBytes(), "url".getBytes(), "www.草榴.com".getBytes());
		table.put(put);  

		put = new Put(("1598692184020120801131313").getBytes());
		put.add("content".getBytes(), "internet_type".getBytes(), "3G".getBytes());
		table.put(put);  

		put = new Put(("1598692184020120801131313").getBytes());
		put.add("content".getBytes(), "file_sizes".getBytes(), "431".getBytes());
		table.put(put);  

		put = new Put(("1598692184020120801131313").getBytes());
		put.add("content".getBytes(), "state".getBytes(), "302".getBytes());
		table.put(put);

		//第3条数据
		put = new Put(("1598692184020130801131314").getBytes());// 一个PUT代表一行数据，再NEW一个PUT表示第二行数据,每行一个唯一的ROWKEY，此处rowkey为put构造方法中传入的值  
		put.add("content".getBytes(), "url".getBytes(), "www.17173.com".getBytes());
		table.put(put);  

		put = new Put(("1598692184020130801131314").getBytes());
		put.add("content".getBytes(), "internet_type".getBytes(), "3G".getBytes());
		table.put(put);  

		put = new Put(("1598692184020130801131314").getBytes());
		put.add("content".getBytes(), "file_sizes".getBytes(), "556".getBytes());
		table.put(put);  

		put = new Put(("1598692184020130801131314").getBytes());
		put.add("content".getBytes(), "state".getBytes(), "404".getBytes());
		table.put(put);

		System.out.println("end insert data ......");  
	}  

	/** 
	 * 删除一张表 
	 * @param tableName 
	 */  
	public static void dropTable(String tableName) {  
		try {  
			HBaseAdmin admin = new HBaseAdmin(configuration);  
			admin.disableTable(tableName);  
			admin.deleteTable(tableName);  
		} catch (MasterNotRunningException e) {  
			e.printStackTrace();  
		} catch (ZooKeeperConnectionException e) {  
			e.printStackTrace();  
		} catch (IOException e) {  
			e.printStackTrace();  
		}  

	}  
	/** 
	 * 根据 rowkey删除一条记录 
	 * @param tablename 
	 * @param rowkey 
	 */  
	public static void deleteRow(String tablename, String rowkey)  {  
		try {  
			HTable table = new HTable(configuration, tablename);  
			List list = new ArrayList();  
			Delete d1 = new Delete(rowkey.getBytes());  
			list.add(d1);  

			table.delete(list);  
			System.out.println("删除行成功!");  

		} catch (IOException e) {  
			e.printStackTrace();  
		}  


	}  

	/** 
	 * 组合条件删除 
	 * @param tablename 
	 * @param rowkey 
	 */  
	public static void deleteByCondition(String tablename, String rowkey)  {  
		//目前还没有发现有效的API能够实现 根据非rowkey的条件删除 这个功能能，还有清空表全部数据的API操作  

	}  


	/** 
	 * 查询所有数据 
	 * @param tableName 
	 */  
	public static void QueryAll(String tableName) {  
		HTablePool pool = new HTablePool(configuration, 1000);  
		HTableInterface  table =  pool.getTable(tableName); 
		try {  
			ResultScanner rs = table.getScanner(new Scan());  
			System.out.println("查询所有");
			for (Result r : rs) {  
				System.out.println("rowkey:" + new String(r.getRow()));  
				for (KeyValue keyValue : r.raw()) {  
					System.out.println("列：" + new String(keyValue.getFamily())  
					+ "----cloumn:"+new String(keyValue.getQualifier())+"====值:" + new String(keyValue.getValue()));  
				}  
			}  
		} catch (IOException e) {  
			e.printStackTrace();  
		}  
	}  

	/** 
	 * 单条件查询,根据rowkey查询唯一一条记录 
	 * @param tableName 
	 */  
	public static void QueryByCondition1(String tableName) {  

		HTablePool pool = new HTablePool(configuration, 1000);  
		HTableInterface  table =  pool.getTable(tableName); 
		try {  
			Get scan = new Get("112233bbbcccc".getBytes());// 根据rowkey查询  
			Result r = table.get(scan);  
			System.out.println("获得到rowkey:" + new String(r.getRow()));  
			for (KeyValue keyValue : r.raw()) {  
				System.out.println("列：" + new String(keyValue.getFamily())  
				+ "====值:" + new String(keyValue.getValue()));  
			}  
		} catch (IOException e) {  
			e.printStackTrace();  
		}  
	}  

	/** 
	 * 单条件按查询，查询多条记录 
	 * @param tableName 
	 */  
	public static void QueryByCondition2(String tableName) {  

		try {  
			HTablePool pool = new HTablePool(configuration, 1000);  
			HTableInterface table =  pool.getTable(tableName);  
			Filter filter = new SingleColumnValueFilter(Bytes  
					.toBytes("content"), null, CompareOp.EQUAL, Bytes  
					.toBytes("aaa")); // 当列column1的值为aaa时进行查询  
			Scan s = new Scan();  
			s.setFilter(filter);  
			ResultScanner rs = table.getScanner(s);  
			for (Result r : rs) {  
				System.out.println("获得到rowkey:" + new String(r.getRow()));  
				for (KeyValue keyValue : r.raw()) {  
					System.out.println("列：" + new String(keyValue.getFamily())  
					+ "====值:" + new String(keyValue.getValue()));  
				}  
			}  
		} catch (Exception e) {  
			e.printStackTrace();  
		}  

	}  

	/** 
	 * 组合条件查询 
	 * @param tableName 
	 */  
	public static void QueryByCondition3(String tableName) {  

		try {  
			HTablePool pool = new HTablePool(configuration, 1000);  
			HTableInterface table =  pool.getTable(tableName);  

			List<Filter> filters = new ArrayList<Filter>();  

			Filter filter1 = new SingleColumnValueFilter(Bytes  
					.toBytes("column1"), null, CompareOp.EQUAL, Bytes  
					.toBytes("aaa"));  
			filters.add(filter1);  

			Filter filter2 = new SingleColumnValueFilter(Bytes  
					.toBytes("column2"), null, CompareOp.EQUAL, Bytes  
					.toBytes("bbb"));  
			filters.add(filter2);  

			Filter filter3 = new SingleColumnValueFilter(Bytes  
					.toBytes("column3"), null, CompareOp.EQUAL, Bytes  
					.toBytes("ccc"));  
			filters.add(filter3);  

			FilterList filterList1 = new FilterList(filters);  

			Scan scan = new Scan();  
			scan.setFilter(filterList1);  
			ResultScanner rs = table.getScanner(scan);  
			for (Result r : rs) {  
				System.out.println("获得到rowkey:" + new String(r.getRow()));  
				for (KeyValue keyValue : r.raw()) {  
					System.out.println("列：" + new String(keyValue.getFamily())  
					+ "====值:" + new String(keyValue.getValue()));  
				}  
			}  
			rs.close();  

		} catch (Exception e) {  
			e.printStackTrace();  
		}  

	}  

	/**
	 * @author DongGod
	 * 使用Scan与过滤条件进行查询	0423添加分页查询	
	 * @throws IOException 
	 */
	public static void queryByScanFilter(String tableName) throws IOException{
		HTablePool pool = new HTablePool(configuration, 1000);  
		HTableInterface table =  pool.getTable(tableName);  
		//实例化PageFilter，5行(row)为一页
		Filter filter= new PageFilter(5);
		Scan scan = new Scan(Bytes.toBytes("1300000000120130105061402"), Bytes.toBytes("1300000020"));
		scan.setFilter(filter);
		ResultScanner rs = table.getScanner(scan); 
		
		//第2页拿到最后那个ROWKEYS
		List<UserInfo> lists=new ArrayList<UserInfo>();
		
		for (Result r : rs) {   
			UserInfo info=new UserInfo();
			for (KeyValue keyValue : r.raw()) {  				
				if("mobile_num".equals(new String(keyValue.getQualifier()))){
					info.setTelphone(new String(keyValue.getValue()));
				}
				if("mobile_date".equals(new String(keyValue.getQualifier()))){
					info.setDatetime(new String(keyValue.getValue()));
				}
				if("mobile_url".equals(new String(keyValue.getQualifier()))){
					info.setUrl(new String(keyValue.getValue()));
				}
				if("size".equals(new String(keyValue.getQualifier()))){
					info.setFlowsize(new String(keyValue.getValue()));
				}
				if("httpcode".equals(new String(keyValue.getQualifier()))){
					info.setCode(new String(keyValue.getValue()));
				}
			} 
			lists.add(info);
		}
		JSONArray jsonArray2 = JSONArray.fromObject( lists );    
		System.out.println(jsonArray2);
	}

}  
