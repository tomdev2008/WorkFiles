package zbd.hadoop.hbase;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.client.HBaseAdmin;

public class HBaseTest {
    static Configuration cfg=HBaseConfiguration.create();
    
	
    /**
     * hbase  
     * @param tableName
     * @param columnFamily
     * @throws Exception
     */
    public static void create(String tableName,String columnFamily) throws Exception{
    	HBaseAdmin admin = new HBaseAdmin(cfg);
    	
    	if(admin.tableExists(tableName)){
    		System.out.println("������ SB , create����");
    		System.exit(0);
    	}else{
    		HTableDescriptor tableDesc=new HTableDescriptor(tableName);
    		tableDesc.addFamily(new HColumnDescriptor(columnFamily));
    		admin.createTable(tableDesc);
    		System.out.println("create table success..");
    	}
    }
	public static void main(String args[]){
		cfg.set("hbase.master", "192.168.1.103:60000");
		cfg.set("hbase.zookeeper.quorum", "192.168.1.103");
		cfg.set("hbase.zookeeper.property.clientPort", "2181");
		try {
			HBaseTest.create("FuckMePlease", "OK");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
