/**
 * Mcp.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.unicom.mms.mcp.webservice;

public interface Mcp extends java.rmi.Remote {
    public java.lang.String sendMms(java.lang.String param, java.lang.String channel, java.lang.String userMdn) throws java.rmi.RemoteException;
    public java.lang.String newBillboardManage(java.lang.String param) throws java.rmi.RemoteException;
    public java.lang.String hotBillboardManage(java.lang.String param) throws java.rmi.RemoteException;
    public java.lang.String collectionManage(java.lang.String param, int actMode) throws java.rmi.RemoteException;
    public java.lang.String postMarkManage(java.lang.String param, int actMode, java.lang.String fileName) throws java.rmi.RemoteException;
    public java.lang.String contactManage(java.lang.String param, int groupId, int actMode, java.lang.String channel, java.lang.String userMdn) throws java.rmi.RemoteException;
    public java.lang.String stampManage(java.lang.String param, int actMode, java.lang.String fileName) throws java.rmi.RemoteException;
    public java.lang.String decorationManage(java.lang.String param, int actMode, java.lang.String fileName) throws java.rmi.RemoteException;
    public java.lang.String userPhotoManage(java.lang.String param, int actMode, java.lang.String channel, java.lang.String userMdn) throws java.rmi.RemoteException;
    public java.lang.String photoFrameManage(java.lang.String param, int actMode, java.lang.String fileName) throws java.rmi.RemoteException;
    public java.lang.String bgPicManage(java.lang.String param, int actMode) throws java.rmi.RemoteException;
    public java.lang.String musicManage(java.lang.String param, int actMode, java.lang.String fileName) throws java.rmi.RemoteException;
    public java.lang.String cardTypeManage(java.lang.String param, int actMode) throws java.rmi.RemoteException;
    public java.lang.String decorationTypeManage(java.lang.String param, int actMode) throws java.rmi.RemoteException;
    public java.lang.String groupManage(java.lang.String param, java.lang.String contactList, int actMode, java.lang.String channel, java.lang.String userMdn) throws java.rmi.RemoteException;
    public java.lang.String templateCardManage(java.lang.String param, int actMode, java.lang.String fileName) throws java.rmi.RemoteException;
}
