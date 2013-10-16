package com.bonc.URLMatch;

import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.util.Tool;

import com.bonc.URLMatch.URLMatch.MatchMapper;
import com.bonc.plugins.ToolUtil;
import com.bonc.util.SessionContext;



/**
 * 数据清洗
 * (过滤扩展名，去广告，排重, 匹配规则)
 * @author hq
 * @date 2013-4-30
 */
public class URLCleanMemcached extends Configured implements Tool {

	@Override
	public int run(String[] arg0) throws Exception {
		FileSystem fs = FileSystem.get(getConf());
		String output =this.getConf().get("url.recognition.data.clean.output");
		System.out.println("output="+output);
//		String input = ToolUtil.getCombinationString(getConf().get("url.recognition.data.input"),arg0);
		String input = "/user/root/BONC/gnfiles/hb";
		System.out.println("input="+input);

		if (fs.exists(new Path(output))) {
	     	    fs.delete(new Path(output), true);
	     	 }
		//getConf().set("mapred.job.tracker", "10.1.24.108:54311");
		
		Job job = new Job(getConf(), "GnDataClean");
		//org.apache.hadoop.mapred.JobConf jConf = (org.apache.hadoop.mapred.JobConf)job.getConfiguration();
		job.setNumReduceTasks(168); 
		job.setJarByClass(URLCleanMemcached.class);
	    job.setMapperClass(DataCleanMapper.class);
	    
	    job.setReducerClass(DataCleanReduce.class);
	    job.setOutputFormatClass(TextOutputFormat.class);
	    job.setOutputKeyClass(LongWritable.class);
	    job.setOutputValueClass(Text.class);
	    job.setMapOutputKeyClass(Text.class);
	    job.setMapOutputValueClass(Text.class);
	    FileInputFormat.addInputPath(job, new Path(input));
	    FileOutputFormat.setOutputPath(job, new Path(output));
	    return job.waitForCompletion(true) ? 0 : 1;
	}
	
	
	public static class DataCleanReduce extends Reducer<Text, Text, Text, Text> {

		private HTable table;
		private long index = 0;
		private Map<String, Object> rules = new HashMap(); //缓存规则

		
		@Override
		protected void reduce(Text arg0, Iterable<Text> arg1,
				Context context)
				throws IOException, InterruptedException {

		
			int count =0;  //当前用户url匹配次数
			for(Text c:arg1){
				count++;
			}
//			for(Text content:arg1){
//				String[] lines = content.toString().split("\\|");
//				  if(!lines[1].equals("O")){
//					context.write(new Text("Y" +"\t"+ phone), new Text(url + "\t" + lines[1] +"\t"+getDate(lines[0])+"\t"+count));
//				  }else{
//					context.write(new Text("N" +"\t"+ phone), new Text(url + "\t" +"O"+"\t"+getDate(lines[0])+"\t"+count));
//				  }
//			}
			
			if(count>=7){
				  context.write(new Text("Y"+"\t"+arg0.toString()), new Text(String.valueOf(count)));
			 }else{
				  context.write(new Text("N"+"\t"+arg0.toString()), new Text(String.valueOf(count)));
			}
				 
			

		}
		
		
		
		public String getDate(String times){
			  Calendar c = Calendar.getInstance();
			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			  return sdf.format(c.getTime()).substring(0, 8)+times.substring(0,2);
	          
		}
		
		/**
		private void insertData2DB(String url, String name, String income){
			try{
				String sql = "insert into url_match(url, name, income) values(?,?,?)";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, url);
				ps.setString(2, name);
				ps.setString(3, income);
				ps.executeUpdate();
				ps.close();
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		**/

	
		
		
		
	}
	
	public static class DataCleanMapper extends Mapper<LongWritable, Text, Text, Text>{
		
		@Override
		protected void map(LongWritable key, Text value, Context context)
				throws IOException, InterruptedException {
			
			String lines = value.toString();
			String[] strs = lines.split("\\|");
			
			
			if(strs.length < 27){
				return;
			}
			
		
			String u = strs[14];
			
			if(!u.startsWith("http://")){
				u = "http://" +  u;
			}
			
			if(u.length() <= 10){
				return;
			}
			
			
			String contenttype = strs[26]; 
			if(contenttype == null || contenttype.length() == 0){
				return;
			}
			
			for(int i=0; i<SessionContext.contentTypeMap.length;i++){
				if(contenttype.toLowerCase().indexOf(SessionContext.contentTypeMap[i].toLowerCase())!=-1){
					return ;
				}
			}

			boolean bol = true;
			for(int i=0; i<contentType.length&&bol;i++){
				if(u.toLowerCase().indexOf(contentType[i].toLowerCase())!=-1){
//					if(isDay(strs[1])){
//						context.write(new Text(u+"|"+strs[0]), new Text(strs[1]+"|"+labelMap.get(contentType[i])));
					  context.write(new Text(strs[0]), new Text("iread"));
					   bol = false;
//					}
					
				}
			}
//			if(bol)
//				context.write(new Text(u+"|"+strs[0]), new Text(strs[1]+"|"+"O"));
			
		}
		public static boolean isDay(String times){
			return new Integer(times.substring(0,2))>4;
		}
		public  static String[] contentType =new String[42];
		static {
			contentType[0]="news.sina.cnsinasina.com";
			contentType[1]="news.sina.cn";
			contentType[2]="vip.book.sina.com";
			contentType[3]="vip.book.sina.com.cn";
			contentType[4]="news.sina.com";
			contentType[5]="news.sina.cn";
			contentType[6]="iread.wo.com.cn";
			contentType[7]="news.uc.com";
			contentType[8]="news.uc.cn";
			contentType[9]="ti.shuqi4.com";
			contentType[10]="shuqi4.com";
			contentType[11]="wo.shuqibook.com";
			contentType[12]="shuqishuqi.com";
			contentType[13]="shuqireader.com";
			contentType[14]="api1.shuqireader.com";
			contentType[15]="api.shuqireader.com";
			contentType[16]="tw.shuqi4.com";
			contentType[17]="shuqi.com";
			contentType[18]="th.shuqi4.com";
			contentType[19]="tw.shuqiread.com";
			contentType[20]="th.shuqiread.com";
			contentType[21]="on.shuqi4.com";
			contentType[22]="qidian.cnqidianqidian.cn";
			contentType[23]="cmread.com";
			contentType[24]="wap.cmread.com";
			contentType[25]="inews.qq.com";
			contentType[26]="book.sohu.com";
			contentType[27]="book1.easou.com";
			contentType[28]="iread.wo.com.cn";
			contentType[29]="book.easou.com";
			contentType[30]="www.tianya.cn";
			contentType[31]="m.tianya.cn";
			contentType[32]="i.ifeng.com";
			contentType[33]="qidian.cn";
			contentType[34]="www.03wx.com";
			contentType[35]="vip.book.sohu.com";
			contentType[36]="www.ifeng.com";
			contentType[37]="ebook12.3g.qq.com";
			contentType[38]="news.163.com";
			contentType[39]="ebook.3g.qq.com";
			contentType[40]="www.sohubook.com";
			contentType[41]="news.baidu.com";
		}
//		public static List<String>  mapflag = new java.util.ArrayList<String>();
//		public  static Map<String, String> labelMap =new java.util.HashMap<String, String>();
//		static {
//			labelMap.put("news.sina.cnsinasina.com","新浪新闻");
//			labelMap.put("news.sina.cn","新浪新闻");
//			labelMap.put("vip.book.sina.com","新浪新闻");
//			labelMap.put("vip.book.sina.com.cn","新浪新闻");
//			labelMap.put("news.sina.com","新浪新闻");
//			labelMap.put("news.sina.cn","新浪新闻");
//			labelMap.put("iread.wo.com.cn","wo阅读");
//			labelMap.put("news.uc.com","UC新闻");
//			labelMap.put("news.uc.cn","UC新闻");
//			labelMap.put("ti.shuqi4.com","书旗");
//			labelMap.put("shuqi4.com","书旗");
//			labelMap.put("wo.shuqibook.com","书旗");
//			labelMap.put("shuqi.com","书旗");
//			labelMap.put("shuqireader.com","书旗");
//			labelMap.put("api1.shuqireader.com","书旗");
//			labelMap.put("api.shuqireader.com","书旗");
//			labelMap.put("tw.shuqi4.com","书旗");
//			labelMap.put("shuqi.com","书旗");
//			labelMap.put("th.shuqi4.com","书旗");
//			labelMap.put("tw.shuqiread.com","书旗");
//			labelMap.put("th.shuqiread.com","书旗");
//			labelMap.put("on.shuqi4.com","书旗");
//			labelMap.put("qidian.cn","起点中文");
//			labelMap.put("cmread.com","中国移动手机阅读");
//			labelMap.put("wap.cmread.com","中国移动手机阅读");
//			labelMap.put("inews.qq.com","腾讯新闻客户端");
//			labelMap.put("book.sohu.com","搜狐读书");
//			labelMap.put("book1.easou.com","宜搜小说");
//			labelMap.put("iread.wo.com.cn","联通沃阅读");
//			labelMap.put("book.easou.com","宜搜小说");
//			labelMap.put("www.tianya.cn","天涯");
//			labelMap.put("m.tianya.cn","天涯");
//			labelMap.put("i.ifeng.com","手机凤凰网");
//			labelMap.put("www.03wx.com","理想文学");
//			labelMap.put("vip.book.sohu.com","搜狐读书");
//			labelMap.put("www.ifeng.com","凤凰网");
//			labelMap.put("ebook12.3g.qq.com","QQ书城");
//			labelMap.put("news.163.com","网易新闻");
//			labelMap.put("ebook.3g.qq.com","QQ书城");
//			labelMap.put("www.sohubook.com","搜狐读书");
//			labelMap.put("news.baidu.com","百度新闻");
//		}
		
	}
	
}
