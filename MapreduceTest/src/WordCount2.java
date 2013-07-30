  
  
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;
  
/* 
 *@author huangdou 
 *created on 2011-4-1下午03:20:11 
 */  
public class WordCount2 {  
  
  
    public static void main(String[] args) throws Exception {  
        //不配置一个入口类会导致底层无法调用setJarByClass方法,运行时ClassNotFound  
        JobConf conf = new JobConf(WordCount2.class);     
        //设置map类  
        conf.setMapperClass(WordCountMapper.class);  
        //设置reduce类  
        conf.setReducerClass(WordCountReducer.class);  
        //设置输出类型  
        conf.setOutputKeyClass(Text.class);  
        conf.setOutputValueClass(IntWritable.class);  
  
        String[] test={"CAO","NI","MA"};
        //输入参数除最后一个外都是input path,最后一个是output path  
        for (int i = 0; i < test.length - 1; i++) {  
            FileInputFormat.addInputPath(conf, new Path(test[i]));  
        }  
  
        FileOutputFormat.setOutputPath(conf, new Path(test[test.length - 1]));  
  
        JobClient.runJob(conf);  
    }  
}  
