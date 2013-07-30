  
  
import java.io.IOException;  
import java.util.Iterator;  
  
import org.apache.hadoop.io.IntWritable;  
import org.apache.hadoop.io.Text;  
import org.apache.hadoop.mapred.MapReduceBase;  
import org.apache.hadoop.mapred.OutputCollector;  
import org.apache.hadoop.mapred.Reducer;  
import org.apache.hadoop.mapred.Reporter;  
  

public class WordCountReducer extends MapReduceBase implements Reducer<Text,IntWritable,Text,IntWritable>{  
  
      
    @Override  
    public void reduce(Text key, Iterator<IntWritable> values,  
            OutputCollector<Text, IntWritable> output, Reporter reporter)  
            throws IOException {  
        Integer sum = 0;  
        while (values.hasNext()){  
            //map的输出其实会在每一个map中汇总,即同一个map如果出现"word"2次,那么map的输出就是word 2  
            //然后在进入reduce前会进行一个排序,即各个map的word统计会排在一起,同key的结果进入同一个reduce  
            sum += values.next().get();  
        }  
        //最终结果  
        output.collect(key, new IntWritable(sum));  
    }  
}  
