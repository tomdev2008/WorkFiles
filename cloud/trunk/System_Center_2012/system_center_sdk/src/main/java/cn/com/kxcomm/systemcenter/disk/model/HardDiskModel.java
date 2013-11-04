package cn.com.kxcomm.systemcenter.disk.model;

/**
 * 
 * 功能描述:硬盘信息实体 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-10-12
 * @author chenliang 修改日期：2013-10-12
 * @since system_center_sdk
 */
public class HardDiskModel {

	public String operatingSystem; // 操作系统
	public String vhdType; // vhd类型
	public String vhdFormatType; // vhd格式类型
	public String maximumSize; // 最大内存
	public String location; // vhd存放目录
	public String state; // 状态
	public String size; // 当前展开大小(动态扩展)
	public String hostName; // 主机名
	public String vmHost; // vm主机
	public String owner; // 拥有者
	public String name; // 名字
	public String description; // 描述
	public String addedTime; // 添加时间
	public String modifiedTime; // 修改时间
	public String enabled; // 是否可用
	public String mostRecentTask; // 操作描述
	public String mostRecentTaskIfLocal; // 操作

	public String getOperatingSystem() {
		return operatingSystem;
	}

	public void setOperatingSystem(String operatingSystem) {
		this.operatingSystem = operatingSystem;
	}

	public String getVhdType() {
		return vhdType;
	}

	public void setVhdType(String vhdType) {
		this.vhdType = vhdType;
	}

	public String getVhdFormatType() {
		return vhdFormatType;
	}

	public void setVhdFormatType(String vhdFormatType) {
		this.vhdFormatType = vhdFormatType;
	}

	public String getMaximumSize() {
		return maximumSize;
	}

	public void setMaximumSize(String maximumSize) {
		this.maximumSize = maximumSize;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getVmHost() {
		return vmHost;
	}

	public void setVmHost(String vmHost) {
		this.vmHost = vmHost;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAddedTime() {
		return addedTime;
	}

	public void setAddedTime(String addedTime) {
		this.addedTime = addedTime;
	}

	public String getModifiedTime() {
		return modifiedTime;
	}

	public void setModifiedTime(String modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getMostRecentTask() {
		return mostRecentTask;
	}

	public void setMostRecentTask(String mostRecentTask) {
		this.mostRecentTask = mostRecentTask;
	}

	public String getMostRecentTaskIfLocal() {
		return mostRecentTaskIfLocal;
	}

	public void setMostRecentTaskIfLocal(String mostRecentTaskIfLocal) {
		this.mostRecentTaskIfLocal = mostRecentTaskIfLocal;
	}

	@Override
	public String toString() {
		return "HardDiskModel [operatingSystem=" + operatingSystem
				+ ", vhdType=" + vhdType + ", vhdFormatType=" + vhdFormatType
				+ ", maximumSize=" + maximumSize + ", location=" + location
				+ ", state=" + state + ", size=" + size + ", hostName="
				+ hostName + ", vmHost=" + vmHost + ", owner=" + owner
				+ ", name=" + name + ", description=" + description
				+ ", addedTime=" + addedTime + ", modifiedTime=" + modifiedTime
				+ ", enabled=" + enabled + ", mostRecentTask=" + mostRecentTask
				+ ", mostRecentTaskIfLocal=" + mostRecentTaskIfLocal + "]";
	}

}
