package make;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;

public class PageRank {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub

		File file = new File("E:/PageRank.txt");
		if (file.exists()) {
			file.deleteOnExit();
			file.createNewFile();
		} else {
			file.createNewFile();
		}
		BufferedWriter out = new BufferedWriter(new FileWriter(file));
		for (int i = 1; i <= 20; i++) {
			if(i<10)
			{
				out.write("0"+i + "&" + ( new Random(). nextInt(50)+10)+"&"+"Page1"+"&"+"Page2"+"&"+"Page3"+"&"+"Page4"+"&"+"Page5"+"&"+"Page6"+"&"+"Page7"+"&"+"Page8"+"&"+"Page9"+"&"+"Page10"+ "\r\n");
			}
			else{
			out.write(i + "&" + ( new Random(). nextInt(50)+10)+"&"+"Page1"+"&"+"Page2"+"&"+"Page3"+"&"+"Page4"+"&"+"Page5"+"&"+"Page6"+"&"+"Page7"+"&"+"Page8"+"&"+"Page9"+"&"+"Page10"+ "\r\n");
			}
		}
		out.close();
	}
}
