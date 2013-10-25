package com.kxcomm.hadoop.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.KeyValue;
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
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.PageFilter;
import org.apache.hadoop.hbase.util.Bytes;

import com.gaoxing.bean.UserInfo;

/**
 * 最简单的Hbase类操作,同时作连接池使.
 * @author DongGod
 *
 */
public class HbaseUtil {

	private static Configuration cfg;
	private static HTablePool pool;  
	
	static{
		cfg = HBaseConfiguration.create(); 
		pool = new HTablePool(cfg, 1000);
		cfg.set("hbase.zookeeper.property.clientPort", "2181");  
		cfg.set("hbase.zookeeper.quorum", "192.168.1.103,192.168.1.102,192.168.1.101");  
		cfg.set("hbase.master", "192.168.1.103:600000");  
	}
	
	public HbaseUtil(){  

	}
	
	private HbaseUtil(String master,String quorum,String clientPort){
		cfg.set("hbase.master", master);
		cfg.set("hbase.zookeeper.quorum", quorum);
		cfg.set("hbase.zookeeper.property.clientPort", clientPort);
	}
	/**
	 * hbase建表
	 * @author DongGod
	 * @param tableName
	 * @param columnFamily
	 * @throws IOException
	 */
	public void createTable(String tableName,String columnFamily) throws IOException{
		HBaseAdmin hBaseAdmin = new HBaseAdmin(cfg);  
		if (hBaseAdmin.tableExists(tableName)) {// 如果存在要创建的表，那么先删除，再创建  
		}else{
			HTableDescriptor tableDesc=new HTableDescriptor(tableName);
			tableDesc.addFamily(new HColumnDescriptor(columnFamily));
			hBaseAdmin.createTable(tableDesc);
		}
	}

	/**
	 * hbase 插入数据
	 * @author DongGod
	 * @param tableName
	 * @param put
	 * @throws IOException 
	 */
	public void putLists(String tableName,List<Put> put) throws IOException{
		HTableInterface  table =  pool.getTable(tableName);  
		if(table!=null){
			for(Put putsomething:put){
				table.put(putsomething);
			}
		}
		table.flushCommits(); 
		pool.closeTablePool(tableName.getBytes());
	}
	
	public void put(String tableName,Put put) throws IOException{
		HTableInterface  table =  pool.getTable(tableName);  
		table.put(put);
		table.flushCommits(); 
		pool.closeTablePool(tableName.getBytes());
	}
	

	/**
	 * 通过rowkey获得数据
	 * @author DongGod
	 * @param tableName
	 * @param rowkey
	 */
	public Result getByPk(String tableName,String rowkey){  
		HTableInterface  table =  pool.getTable(tableName); 
		Result r=null;
		try {  
			Get scan = new Get(rowkey.getBytes());// 根据rowkey查询  
			r = table.get(scan);  
			table.flushCommits(); 
			pool.closeTablePool(tableName.getBytes());
		} catch (IOException e) {  
			e.printStackTrace();  
		}
		return r;
	}
	
	/**
	 * 删除rowkey相关数据
	 * @author DongGod
	 * @param tableName
	 * @param rowkey
	 */
	public void deleteByRowKey(String tableName,String rowkey){
		try {  
			HTableInterface table = new HTable(cfg, tableName);  
			List list = new ArrayList();  
			Delete d1 = new Delete(rowkey.getBytes());  
			list.add(d1);  
			table.delete(list);   

		} catch (IOException e) {  
			e.printStackTrace();  
		}  
	}
	/*
	 * 通过手机号码和时间创建rowkey
	 */
	public byte[] getRowkey(String num,String datetime){
		String temp=num+datetime;
		return Bytes.toBytes(temp);
	}
	
	public static List<UserInfo> queryByScanFilter(String tableName,String start,String end,String last) throws IOException{
		HTablePool pool = new HTablePool(cfg, 1000);  
		HTableInterface table =  pool.getTable(tableName);  
		//实例化PageFilter，5行(row)为一页
		Filter filter= new PageFilter(5);
		
		String startkey=null;
		
		if(last!=null){
			startkey=start;
		}else{
			startkey=last;
		}
		
		Scan scan = new Scan(Bytes.toBytes(startkey), Bytes.toBytes(end));
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
		return lists;
	}
}
