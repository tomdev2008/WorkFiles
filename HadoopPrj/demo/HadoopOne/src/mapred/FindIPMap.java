package mapred;

import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class FindIPMap extends Mapper<Object, Text, Text, Text>{
		private Text IP=new Text("");
		private Text Date=new Text();
		public void map(Object key, Text value, Context context) throws IOException, InterruptedException 
	    {
			String values=value.toString();
			String ip=values.substring(0, values.indexOf("	"));
			IP.set(ip.trim());
			String date=values.substring(values.indexOf("	"), values.length());
			StringTokenizer tokenzer=new StringTokenizer(date.trim());
			while(tokenzer.hasMoreTokens()){
				Date.set(tokenzer.nextToken().trim());
				context.write(IP, Date);
			}
	    }
}
