package cn.com.kxcomm.common;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * 
 * 功能描述:http连接公共处理类
 * <p>
 * 版权所有：金鹏科技
 * <p>
 * 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chuzq 新增日期：2009-1-7
 * @author 你的姓名 修改日期：2009-1-7
 * @since wapportal_manager version(2.0)
 */
public class HttpURLUtil {
	/**
	 * 
	 * 方法用途和描述: 根据url返回对应的字符串
	 * 
	 * @param url
	 * @param encoding
	 * @return
	 * @throws Exception
	 * @author chuzq 新增日期：2009-1-7
	 * @author 你的姓名 修改日期：2009-1-7
	 * @since wapportal_manager version(2.0)
	 */
	public static String httpToString(String url, String encoding)
			throws Exception {
		StringWriter writer = new StringWriter();
		java.net.URL source = null;
		source = new java.net.URL(url);

		PrintWriter output = new PrintWriter(writer);
		HttpURLConnection conn = null;
		InputStream is = null;
		BufferedReader in = null;
		try {
			conn = (HttpURLConnection) source.openConnection();
			conn.setRequestProperty("Connection", "close");
			is = conn.getInputStream();

			in = new BufferedReader(new InputStreamReader(is,
					encoding));

			String inputLine;

			while ((inputLine = in.readLine()) != null)
				output.println(inputLine);

			output.flush();
		} finally {
			try {
				if (in != null)
					in.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (output != null)
					output.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (conn != null)
					conn.disconnect();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return writer.toString();
	}

	/**
	 * 
	 * 方法用途和描述: 根据url返回对应的字符串
	 * 
	 * @param url
	 * @param encoding
	 * @return
	 * @throws Exception
	 * @author chuzq 新增日期：2009-1-7
	 * @author 你的姓名 修改日期：2009-1-7
	 * @since wapportal_manager version(2.0)
	 */
	public static String httpToString(URL url, String encoding)
			throws Exception {
		StringWriter writer = new StringWriter();

		PrintWriter output = new PrintWriter(writer);
		HttpURLConnection conn = null;
		InputStream is = null;
		BufferedReader in = null;
		try {
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestProperty("Connection", "close");
			is = conn.getInputStream();

			in = new BufferedReader(new InputStreamReader(is,
					encoding));

			String inputLine;

			while ((inputLine = in.readLine()) != null)
				output.println(inputLine);

			output.flush();
		} finally {
			try {
				if (in != null)
					in.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (output != null)
					output.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (conn != null)
					conn.disconnect();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return writer.toString();
	}
	
	public static void main(String[] args){
		String urlString = "http://211.95.193.85/wap/merchant/index.jsp?indexShow=1";
		try {
			String res = httpToString(urlString,"UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
