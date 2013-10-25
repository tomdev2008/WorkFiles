package com.unicom.mms.mcp.webservice;

public class McpProxy implements com.unicom.mms.mcp.webservice.Mcp {
  private String _endpoint = null;
  private com.unicom.mms.mcp.webservice.Mcp mcp = null;
  
  public McpProxy() {
    _initMcpProxy();
  }
  
  public McpProxy(String endpoint) {
    _endpoint = endpoint;
    _initMcpProxy();
  }
  
  private void _initMcpProxy() {
    try {
      mcp = (new com.unicom.mms.mcp.webservice.McpServiceLocator()).getMcpPort();
      if (mcp != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)mcp)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)mcp)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (mcp != null)
      ((javax.xml.rpc.Stub)mcp)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.unicom.mms.mcp.webservice.Mcp getMcp() {
    if (mcp == null)
      _initMcpProxy();
    return mcp;
  }
  
  public java.lang.String sendMms(java.lang.String param) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.sendMms(param);
  }
  
  public java.lang.String newBillboardManage(java.lang.String param) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.newBillboardManage(param);
  }
  
  public java.lang.String addServiceLog(java.lang.String json) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.addServiceLog(json);
  }
  
  public java.lang.String hotBillboardManage(java.lang.String param) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.hotBillboardManage(param);
  }
  
  public java.lang.String collectionManage(java.lang.String param, int actMode) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.collectionManage(param, actMode);
  }
  
  public java.lang.String postMarkManage(java.lang.String param, int actMode) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.postMarkManage(param, actMode);
  }
  
  public java.lang.String contactManage(java.lang.String param, int actMode) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.contactManage(param, actMode);
  }
  
  public java.lang.String stampManage(java.lang.String param, int actMode) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.stampManage(param, actMode);
  }
  
  public java.lang.String decorationManage(java.lang.String param, int actMode) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.decorationManage(param, actMode);
  }
  
  public java.lang.String userPhotoManage(java.lang.String param, int actMode) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.userPhotoManage(param, actMode);
  }
  
  public java.lang.String photoFrameManage(java.lang.String param, int actMode) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.photoFrameManage(param, actMode);
  }
  
  public java.lang.String musicManage(java.lang.String param, int actMode) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.musicManage(param, actMode);
  }
  
  public java.lang.String cardTypeManage(java.lang.String param, int actMode) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.cardTypeManage(param, actMode);
  }
  
  public java.lang.String groupManage(java.lang.String param, int actMode) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.groupManage(param, actMode);
  }
  
  public java.lang.String decorationTypeManage(java.lang.String param, int actMode) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.decorationTypeManage(param, actMode);
  }
  
  public java.lang.String templateCardManage(java.lang.String param, int actMode) throws java.rmi.RemoteException{
    if (mcp == null)
      _initMcpProxy();
    return mcp.templateCardManage(param, actMode);
  }
  
  
}