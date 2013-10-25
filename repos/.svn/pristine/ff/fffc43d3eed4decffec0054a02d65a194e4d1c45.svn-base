package com.unicom.mms.GraphicsMagick;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.im4java.core.Operation;

/**
 * 
 * 运行gm命令
 * 
 * @author zhangjh 新增日期：2013-5-7
 * @since mms-resources
 */
public class ImageCmd {
	public void run(Operation pOperation) {
		try {
			StringBuffer cmdout = new StringBuffer();
			ProcessBuilder pb = new ProcessBuilder(pOperation.getCmdArgs());
			System.out.println("args.toString():"
					+ pOperation.getCmdArgs().toString());
			Process p = pb.start();
			InputStream fis = p.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(fis,
					"gb2312"));
			String line = null;
			while ((line = br.readLine()) != null) {
				cmdout.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
