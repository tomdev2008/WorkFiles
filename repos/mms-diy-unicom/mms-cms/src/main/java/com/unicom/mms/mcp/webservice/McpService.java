/**
 * McpService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.unicom.mms.mcp.webservice;

public interface McpService extends javax.xml.rpc.Service {
    public java.lang.String getMcpPortAddress();

    public com.unicom.mms.mcp.webservice.Mcp getMcpPort() throws javax.xml.rpc.ServiceException;

    public com.unicom.mms.mcp.webservice.Mcp getMcpPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
