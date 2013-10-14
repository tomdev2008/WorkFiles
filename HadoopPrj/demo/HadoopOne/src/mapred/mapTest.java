package mapred;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mrunit.mapreduce.MapDriver;

import org.junit.Before;
import org.junit.Test;


@SuppressWarnings("all")
public class mapTest {

	private Mapper map;
	private MapDriver driver;
	
	@Before
	public void init()
	{
		map=new FindIPMap();
		driver=new MapDriver(map);
	}
	
	@Test
	public void Test()
	{
		String data="192.168.1.1	20121101=1	20121102=1	20121103=1	20121104=1	20121105=1	20121106=1";
		driver.withInput(" ", new Text(data))
			  .withOutput(new Text("192.168.1.1"), new Text("20121101=1"))
			  .withOutput(new Text("192.168.1.1"), new Text("20121102=1"))
			  .withOutput(new Text("192.168.1.1"), new Text("20121103=1"))
			  .withOutput(new Text("192.168.1.1"), new Text("20121104=1"))
			  .withOutput(new Text("192.168.1.1"), new Text("20121105=1"))
			  .withOutput(new Text("192.168.1.1"), new Text("20121106=1"))
			  .runTest();
	}
}
