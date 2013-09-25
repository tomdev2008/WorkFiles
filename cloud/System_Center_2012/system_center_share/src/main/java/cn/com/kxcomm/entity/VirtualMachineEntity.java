package cn.com.kxcomm.entity;

import java.util.Date;

import javax.mail.search.StringTerm;

/**
 * 
 * 功能描述:订单表
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-11
 * @author chenliang 修改日期：2013-9-11
 * @since system_center_share
 */
public class VirtualMachineEntity {
private Long id;
private Long tbVhdDiskId;
private Long tbIsoId;
private Long tbVirtualTypeId;
private Long tbVirtualNetWorkSwitchId;
private String hostName;
private String intranetIp;
private String extranetIp;
private Date destructionTime;
private Date createTime;
private Date bootTime;
private Date shutDownTime;
private Long cpuSize;
private Long memorySizeLong;
private Long diskSize;
private String extranetPort;
private int state;
private String cpuUnit;
private String memoryUnit;
private String diskUnit;
private String operatingSystem;
private Long dataDiskSize;
private String dataDiskUnit;
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public Long getTbVhdDiskId() {
	return tbVhdDiskId;
}
public void setTbVhdDiskId(Long tbVhdDiskId) {
	this.tbVhdDiskId = tbVhdDiskId;
}
public Long getTbIsoId() {
	return tbIsoId;
}
public void setTbIsoId(Long tbIsoId) {
	this.tbIsoId = tbIsoId;
}
public Long getTbVirtualTypeId() {
	return tbVirtualTypeId;
}
public void setTbVirtualTypeId(Long tbVirtualTypeId) {
	this.tbVirtualTypeId = tbVirtualTypeId;
}
public Long getTbVirtualNetWorkSwitchId() {
	return tbVirtualNetWorkSwitchId;
}
public void setTbVirtualNetWorkSwitchId(Long tbVirtualNetWorkSwitchId) {
	this.tbVirtualNetWorkSwitchId = tbVirtualNetWorkSwitchId;
}
public String getHostName() {
	return hostName;
}
public void setHostName(String hostName) {
	this.hostName = hostName;
}
public String getIntranetIp() {
	return intranetIp;
}
public void setIntranetIp(String intranetIp) {
	this.intranetIp = intranetIp;
}
public String getExtranetIp() {
	return extranetIp;
}
public void setExtranetIp(String extranetIp) {
	this.extranetIp = extranetIp;
}
public Date getDestructionTime() {
	return destructionTime;
}
public void setDestructionTime(Date destructionTime) {
	this.destructionTime = destructionTime;
}
public Date getCreateTime() {
	return createTime;
}
public void setCreateTime(Date createTime) {
	this.createTime = createTime;
}
public Date getBootTime() {
	return bootTime;
}
public void setBootTime(Date bootTime) {
	this.bootTime = bootTime;
}
public Date getShutDownTime() {
	return shutDownTime;
}
public void setShutDownTime(Date shutDownTime) {
	this.shutDownTime = shutDownTime;
}
public Long getCpuSize() {
	return cpuSize;
}
public void setCpuSize(Long cpuSize) {
	this.cpuSize = cpuSize;
}
public Long getMemorySizeLong() {
	return memorySizeLong;
}
public void setMemorySizeLong(Long memorySizeLong) {
	this.memorySizeLong = memorySizeLong;
}
public Long getDiskSize() {
	return diskSize;
}
public void setDiskSize(Long diskSize) {
	this.diskSize = diskSize;
}
public String getExtranetPort() {
	return extranetPort;
}
public void setExtranetPort(String extranetPort) {
	this.extranetPort = extranetPort;
}
public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}
public String getCpuUnit() {
	return cpuUnit;
}
public void setCpuUnit(String cpuUnit) {
	this.cpuUnit = cpuUnit;
}
public String getMemoryUnit() {
	return memoryUnit;
}
public void setMemoryUnit(String memoryUnit) {
	this.memoryUnit = memoryUnit;
}
public String getDiskUnit() {
	return diskUnit;
}
public void setDiskUnit(String diskUnit) {
	this.diskUnit = diskUnit;
}
public String getOperatingSystem() {
	return operatingSystem;
}
public void setOperatingSystem(String operatingSystem) {
	this.operatingSystem = operatingSystem;
}
public Long getDataDiskSize() {
	return dataDiskSize;
}
public void setDataDiskSize(Long dataDiskSize) {
	this.dataDiskSize = dataDiskSize;
}
public String getDataDiskUnit() {
	return dataDiskUnit;
}
public void setDataDiskUnit(String dataDiskUnit) {
	this.dataDiskUnit = dataDiskUnit;
}
@Override
public String toString() {
	return "VirtualMachineEntity [id=" + id + ", tbVhdDiskId=" + tbVhdDiskId
			+ ", tbIsoId=" + tbIsoId + ", tbVirtualTypeId=" + tbVirtualTypeId
			+ ", tbVirtualNetWorkSwitchId=" + tbVirtualNetWorkSwitchId
			+ ", hostName=" + hostName + ", intranetIp=" + intranetIp
			+ ", extranetIp=" + extranetIp + ", destructionTime="
			+ destructionTime + ", createTime=" + createTime + ", bootTime="
			+ bootTime + ", shutDownTime=" + shutDownTime + ", cpuSize="
			+ cpuSize + ", memorySizeLong=" + memorySizeLong + ", diskSize="
			+ diskSize + ", extranetPort=" + extranetPort + ", state=" + state
			+ ", cpuUnit=" + cpuUnit + ", memoryUnit=" + memoryUnit
			+ ", diskUnit=" + diskUnit + ", operatingSystem=" + operatingSystem
			+ ", dataDiskSize=" + dataDiskSize + ", dataDiskUnit="
			+ dataDiskUnit + "]";
}


}
