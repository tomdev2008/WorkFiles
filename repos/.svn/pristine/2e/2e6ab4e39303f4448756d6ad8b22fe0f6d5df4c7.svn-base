package com.unicom.mms.mcp.webservice;

import java.rmi.RemoteException;

import javax.xml.rpc.ServiceException;

public class TestMain {

	/**
	 * 方法用途和描述: 调用mcp接口
	 * @param args
	 * @author chenliang 新增日期：2013-4-24
	 * @since mms-cms
	 */
	public static void main(String[] args) {
		try {
			Mcp mcp = new McpServiceLocator().getMcpPort();
			mcp.sendMms("");
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
