package com.kxcomm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.HTableInterface;
import org.apache.hadoop.hbase.client.HTablePool;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.PageFilter;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.io.MapFile.Writer;

import com.gaoxing.bean.UserInfo;
import com.kxcomm.hadoop.util.HbaseUtil;

public class QueryServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPost(req, resp);
		String starttime=req.getParameter("starttime");
		String endtime=req.getParameter("endtime");
		String mobilenum=req.getParameter("telphone");		
		String last=req.getParameter("last");
		
		String start=mobilenum+starttime;
		String end=mobilenum+endtime;
		
		List<UserInfo> list=HbaseUtil.queryByScanFilter("kxcomm_gj", start, end, last);
		
		JSONArray jsonArray2 = JSONArray.fromObject( list );    
		PrintWriter out=resp.getWriter();
		out.write(jsonArray2.toString());
		out.close();			
	}	
}
