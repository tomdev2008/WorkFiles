package cn.com.kxcomm.systemcenter.entity;

import java.io.Serializable;

/**
 * 
 * 功能描述:服务器信息实体 
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-10-12
 * @author chenliang 修改日期：2013-10-12
 * @since system_center_sdk
 */
public class ServerModel implements Serializable {

	public String libServer; // 库服务器地址，计算机名
	public String hostServer; // 虚拟机宿主服务器，计算机名,(主机节点)
	public String serverVHD; // vhd镜像文件名称
	public String hardConfig; // 硬件配置文件名称
	public String vmLeavePath; // vm存储地址,存储在虚拟机宿主服务器上的地址

	public String getLibServer() {
		return libServer;
	}

	public void setLibServer(String libServer) {
		this.libServer = libServer;
	}

	public String getHostServer() {
		return hostServer;
	}

	public void setHostServer(String hostServer) {
		this.hostServer = hostServer;
	}

	public String getServerVHD() {
		return serverVHD;
	}

	public void setServerVHD(String serverVHD) {
		this.serverVHD = serverVHD;
	}

	public String getHardConfig() {
		return hardConfig;
	}

	public void setHardConfig(String hardConfig) {
		this.hardConfig = hardConfig;
	}

	public String getVmLeavePath() {
		return vmLeavePath;
	}

	public void setVmLeavePath(String vmLeavePath) {
		this.vmLeavePath = vmLeavePath;
	}

	@Override
	public String toString() {
		return "ServerModel [libServer=" + libServer + ", hostServer="
				+ hostServer + ", serverVHD=" + serverVHD + ", hardConfig="
				+ hardConfig + ", vmLeavePath=" + vmLeavePath + "]";
	}

}
