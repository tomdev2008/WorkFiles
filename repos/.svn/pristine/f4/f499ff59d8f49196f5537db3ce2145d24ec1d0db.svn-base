package com.unicom.mms;

import org.mortbay.jetty.Server;
import org.mortbay.jetty.servlet.Context;
import org.mortbay.jetty.servlet.DefaultServlet;
import org.mortbay.jetty.servlet.ServletHolder;

import com.unicom.mms.mm7.MyReceiveServlet;

public class JettyRun {
	private static void addDefaultServletTo(Context parent) {
		ServletHolder holder = new ServletHolder(DefaultServlet.class);
		holder.setInitParameter("dirAllowed", "false");
		holder.setInitParameter("welcomeServlets", "index.html");
		holder.setInitParameter("resourceBase", ".");
		parent.addServlet(holder, "/*");
	}

	public static void main(String[] args) throws Exception {
		Server server = new Server(9008);
		Context root = new Context(server, "/", Context.SESSIONS);
//		addDefaultServletTo(root);
		root.addServlet(new ServletHolder(new MyReceiveServlet()), "/");
		server.start();
		server.join();
	}
}
