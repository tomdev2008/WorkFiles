package mapred;

import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mrunit.mapreduce.ReduceDriver;
import org.junit.Before;
import org.junit.Test;



@SuppressWarnings("all")
public class reduceTest {
	

		private Reducer reduce;
		private ReduceDriver driver;
		
		@Before
		public void init()
		{
			reduce=new FindIPReduce();
			driver=new ReduceDriver(reduce);
		}
		
		@Test
		public void Test()
		{
			List AA=new ArrayList();
			AA.add(new Text("20121101=1"));
			AA.add(new Text("20121102=1"));
			AA.add(new Text("20121103=1"));
			AA.add(new Text("20121104=1"));
			AA.add(new Text("20121105=1"));
			AA.add(new Text("20121106=1"));
			
			driver.withInput(new Text("192.168.1.1"), AA)
				  .withOutput(new Text("192.168.1.1"), new Text("20121101=1"))
				  .withOutput(new Text("192.168.1.1"), new Text("20121102=1"))
				  .withOutput(new Text("192.168.1.1"), new Text("20121103=1"))
				  .withOutput(new Text("192.168.1.1"), new Text("20121104=1"))
				  .withOutput(new Text("192.168.1.1"), new Text("20121105=1"))
				  .withOutput(new Text("192.168.1.1"), new Text("20121106=1"))
				  .runTest();
		}
}
