/**
 * McpServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.unicom.mms.mcp.webservice;

public class McpServiceLocator extends org.apache.axis.client.Service implements com.unicom.mms.mcp.webservice.McpService {

    public McpServiceLocator() {
    }


    public McpServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public McpServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for McpPort
    private java.lang.String McpPort_address = "http://192.168.7.183:8080/mms-mcp/cxf/McpService";

    public java.lang.String getMcpPortAddress() {
        return McpPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String McpPortWSDDServiceName = "McpPort";

    public java.lang.String getMcpPortWSDDServiceName() {
        return McpPortWSDDServiceName;
    }

    public void setMcpPortWSDDServiceName(java.lang.String name) {
        McpPortWSDDServiceName = name;
    }

    public com.unicom.mms.mcp.webservice.Mcp getMcpPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(McpPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getMcpPort(endpoint);
    }

    public com.unicom.mms.mcp.webservice.Mcp getMcpPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.unicom.mms.mcp.webservice.McpServiceSoapBindingStub _stub = new com.unicom.mms.mcp.webservice.McpServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getMcpPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setMcpPortEndpointAddress(java.lang.String address) {
        McpPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.unicom.mms.mcp.webservice.Mcp.class.isAssignableFrom(serviceEndpointInterface)) {
                com.unicom.mms.mcp.webservice.McpServiceSoapBindingStub _stub = new com.unicom.mms.mcp.webservice.McpServiceSoapBindingStub(new java.net.URL(McpPort_address), this);
                _stub.setPortName(getMcpPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("McpPort".equals(inputPortName)) {
            return getMcpPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://webservice.mcp.mms.unicom.com", "McpService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://webservice.mcp.mms.unicom.com", "McpPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("McpPort".equals(portName)) {
            setMcpPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
