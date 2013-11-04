package cn.com.kxcomm.systemcenter.vmsync.model;

/**
 * 
 * 功能描述:硬件配置信息实体 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-10-31
 * @author chenliang 修改日期：2013-10-31
 * @since system_center_sdk
 */
public class WarePorfileModel {

	public String cpuCount; // cpu个数
	public String memory; // 内存大小MB
	public String dynamicMemoryEnabled; //
	public String dynamicMemoryMaximumMB;
	public String dynamicMemoryBufferPercentage;
	public String memoryWeight;
	public String virtualVideoAdapterEnabled;
	public String monitorMaximumCount;
	public String monitorResolutionMaximum;
	public String bootOrder;
	public String undoDisksEnabled;
	public String cpuType;
	public String isHighlyAvailable;
	public String havmPriority;
	public String isDRProtectionRequired;
	public String limitCPUFunctionality;
	public String limitCPUForMigration;
	public String expectedCPUUtilization;
	public String diskIO;
	public String networkUtilization;
	public String relativeWeight;
	public String cpuReserve;
	public String cpuMax;
	public String cpuPerVirtualNumaNodeMaximum;
	public String memoryPerVirtualNumaNodeMaximumMB;
	public String virtualNumaNodesPerSocketMaximum;
	public String dynamicMemoryMinimumMB;
	public String numLockEnabled;
	public String numaIsolationRequired;
	public String virtualDVDDrives;
	public String shareSCSIBus;
	public String virtualNetworkAdapters;
	public String virtualFloppyDrive;
	public String virtualCOMPorts;
	public String virtualSCSIAdapters;
	public String capabilityProfile;
	public String capabilityProfileCompatibilityState;
	public String grantedToList;
	public String userRoleID;
	public String userRole;
	public String owner; // 拥有者
	public String objectType; //
	public String accessibility;
	public String name; // 名字
	public String isViewOnly;
	public String description; // 描述
	public String addedTime; // 添加时间
	public String modifiedTime; // 修改时间
	public String enabled;
	public String mostRecentTask;
	public String serverConnection;
	public String id;
	public String markedForDeletion;
	public String isFullyCached;
	public String mostRecentTaskIfLocal;

	public String getCpuCount() {
		return cpuCount;
	}

	public void setCpuCount(String cpuCount) {
		this.cpuCount = cpuCount;
	}

	public String getMemory() {
		return memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}

	public String getDynamicMemoryEnabled() {
		return dynamicMemoryEnabled;
	}

	public void setDynamicMemoryEnabled(String dynamicMemoryEnabled) {
		this.dynamicMemoryEnabled = dynamicMemoryEnabled;
	}

	public String getDynamicMemoryMaximumMB() {
		return dynamicMemoryMaximumMB;
	}

	public void setDynamicMemoryMaximumMB(String dynamicMemoryMaximumMB) {
		this.dynamicMemoryMaximumMB = dynamicMemoryMaximumMB;
	}

	public String getDynamicMemoryBufferPercentage() {
		return dynamicMemoryBufferPercentage;
	}

	public void setDynamicMemoryBufferPercentage(
			String dynamicMemoryBufferPercentage) {
		this.dynamicMemoryBufferPercentage = dynamicMemoryBufferPercentage;
	}

	public String getMemoryWeight() {
		return memoryWeight;
	}

	public void setMemoryWeight(String memoryWeight) {
		this.memoryWeight = memoryWeight;
	}

	public String getVirtualVideoAdapterEnabled() {
		return virtualVideoAdapterEnabled;
	}

	public void setVirtualVideoAdapterEnabled(String virtualVideoAdapterEnabled) {
		this.virtualVideoAdapterEnabled = virtualVideoAdapterEnabled;
	}

	public String getMonitorMaximumCount() {
		return monitorMaximumCount;
	}

	public void setMonitorMaximumCount(String monitorMaximumCount) {
		this.monitorMaximumCount = monitorMaximumCount;
	}

	public String getMonitorResolutionMaximum() {
		return monitorResolutionMaximum;
	}

	public void setMonitorResolutionMaximum(String monitorResolutionMaximum) {
		this.monitorResolutionMaximum = monitorResolutionMaximum;
	}

	public String getBootOrder() {
		return bootOrder;
	}

	public void setBootOrder(String bootOrder) {
		this.bootOrder = bootOrder;
	}

	public String getUndoDisksEnabled() {
		return undoDisksEnabled;
	}

	public void setUndoDisksEnabled(String undoDisksEnabled) {
		this.undoDisksEnabled = undoDisksEnabled;
	}

	public String getCpuType() {
		return cpuType;
	}

	public void setCpuType(String cpuType) {
		this.cpuType = cpuType;
	}

	public String getIsHighlyAvailable() {
		return isHighlyAvailable;
	}

	public void setIsHighlyAvailable(String isHighlyAvailable) {
		this.isHighlyAvailable = isHighlyAvailable;
	}

	public String getHavmPriority() {
		return havmPriority;
	}

	public void setHavmPriority(String havmPriority) {
		this.havmPriority = havmPriority;
	}

	public String getIsDRProtectionRequired() {
		return isDRProtectionRequired;
	}

	public void setIsDRProtectionRequired(String isDRProtectionRequired) {
		this.isDRProtectionRequired = isDRProtectionRequired;
	}

	public String getLimitCPUFunctionality() {
		return limitCPUFunctionality;
	}

	public void setLimitCPUFunctionality(String limitCPUFunctionality) {
		this.limitCPUFunctionality = limitCPUFunctionality;
	}

	public String getLimitCPUForMigration() {
		return limitCPUForMigration;
	}

	public void setLimitCPUForMigration(String limitCPUForMigration) {
		this.limitCPUForMigration = limitCPUForMigration;
	}

	public String getExpectedCPUUtilization() {
		return expectedCPUUtilization;
	}

	public void setExpectedCPUUtilization(String expectedCPUUtilization) {
		this.expectedCPUUtilization = expectedCPUUtilization;
	}

	public String getDiskIO() {
		return diskIO;
	}

	public void setDiskIO(String diskIO) {
		this.diskIO = diskIO;
	}

	public String getNetworkUtilization() {
		return networkUtilization;
	}

	public void setNetworkUtilization(String networkUtilization) {
		this.networkUtilization = networkUtilization;
	}

	public String getRelativeWeight() {
		return relativeWeight;
	}

	public void setRelativeWeight(String relativeWeight) {
		this.relativeWeight = relativeWeight;
	}

	public String getCpuReserve() {
		return cpuReserve;
	}

	public void setCpuReserve(String cpuReserve) {
		this.cpuReserve = cpuReserve;
	}

	public String getCpuMax() {
		return cpuMax;
	}

	public void setCpuMax(String cpuMax) {
		this.cpuMax = cpuMax;
	}

	public String getCpuPerVirtualNumaNodeMaximum() {
		return cpuPerVirtualNumaNodeMaximum;
	}

	public void setCpuPerVirtualNumaNodeMaximum(
			String cpuPerVirtualNumaNodeMaximum) {
		this.cpuPerVirtualNumaNodeMaximum = cpuPerVirtualNumaNodeMaximum;
	}

	public String getMemoryPerVirtualNumaNodeMaximumMB() {
		return memoryPerVirtualNumaNodeMaximumMB;
	}

	public void setMemoryPerVirtualNumaNodeMaximumMB(
			String memoryPerVirtualNumaNodeMaximumMB) {
		this.memoryPerVirtualNumaNodeMaximumMB = memoryPerVirtualNumaNodeMaximumMB;
	}

	public String getVirtualNumaNodesPerSocketMaximum() {
		return virtualNumaNodesPerSocketMaximum;
	}

	public void setVirtualNumaNodesPerSocketMaximum(
			String virtualNumaNodesPerSocketMaximum) {
		this.virtualNumaNodesPerSocketMaximum = virtualNumaNodesPerSocketMaximum;
	}

	public String getDynamicMemoryMinimumMB() {
		return dynamicMemoryMinimumMB;
	}

	public void setDynamicMemoryMinimumMB(String dynamicMemoryMinimumMB) {
		this.dynamicMemoryMinimumMB = dynamicMemoryMinimumMB;
	}

	public String getNumLockEnabled() {
		return numLockEnabled;
	}

	public void setNumLockEnabled(String numLockEnabled) {
		this.numLockEnabled = numLockEnabled;
	}

	public String getNumaIsolationRequired() {
		return numaIsolationRequired;
	}

	public void setNumaIsolationRequired(String numaIsolationRequired) {
		this.numaIsolationRequired = numaIsolationRequired;
	}

	public String getVirtualDVDDrives() {
		return virtualDVDDrives;
	}

	public void setVirtualDVDDrives(String virtualDVDDrives) {
		this.virtualDVDDrives = virtualDVDDrives;
	}

	public String getShareSCSIBus() {
		return shareSCSIBus;
	}

	public void setShareSCSIBus(String shareSCSIBus) {
		this.shareSCSIBus = shareSCSIBus;
	}

	public String getVirtualNetworkAdapters() {
		return virtualNetworkAdapters;
	}

	public void setVirtualNetworkAdapters(String virtualNetworkAdapters) {
		this.virtualNetworkAdapters = virtualNetworkAdapters;
	}

	public String getVirtualFloppyDrive() {
		return virtualFloppyDrive;
	}

	public void setVirtualFloppyDrive(String virtualFloppyDrive) {
		this.virtualFloppyDrive = virtualFloppyDrive;
	}

	public String getVirtualCOMPorts() {
		return virtualCOMPorts;
	}

	public void setVirtualCOMPorts(String virtualCOMPorts) {
		this.virtualCOMPorts = virtualCOMPorts;
	}

	public String getVirtualSCSIAdapters() {
		return virtualSCSIAdapters;
	}

	public void setVirtualSCSIAdapters(String virtualSCSIAdapters) {
		this.virtualSCSIAdapters = virtualSCSIAdapters;
	}

	public String getCapabilityProfile() {
		return capabilityProfile;
	}

	public void setCapabilityProfile(String capabilityProfile) {
		this.capabilityProfile = capabilityProfile;
	}

	public String getCapabilityProfileCompatibilityState() {
		return capabilityProfileCompatibilityState;
	}

	public void setCapabilityProfileCompatibilityState(
			String capabilityProfileCompatibilityState) {
		this.capabilityProfileCompatibilityState = capabilityProfileCompatibilityState;
	}

	public String getGrantedToList() {
		return grantedToList;
	}

	public void setGrantedToList(String grantedToList) {
		this.grantedToList = grantedToList;
	}

	public String getUserRoleID() {
		return userRoleID;
	}

	public void setUserRoleID(String userRoleID) {
		this.userRoleID = userRoleID;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getObjectType() {
		return objectType;
	}

	public void setObjectType(String objectType) {
		this.objectType = objectType;
	}

	public String getAccessibility() {
		return accessibility;
	}

	public void setAccessibility(String accessibility) {
		this.accessibility = accessibility;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIsViewOnly() {
		return isViewOnly;
	}

	public void setIsViewOnly(String isViewOnly) {
		this.isViewOnly = isViewOnly;
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

	public String getServerConnection() {
		return serverConnection;
	}

	public void setServerConnection(String serverConnection) {
		this.serverConnection = serverConnection;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMarkedForDeletion() {
		return markedForDeletion;
	}

	public void setMarkedForDeletion(String markedForDeletion) {
		this.markedForDeletion = markedForDeletion;
	}

	public String getIsFullyCached() {
		return isFullyCached;
	}

	public void setIsFullyCached(String isFullyCached) {
		this.isFullyCached = isFullyCached;
	}

	public String getMostRecentTaskIfLocal() {
		return mostRecentTaskIfLocal;
	}

	public void setMostRecentTaskIfLocal(String mostRecentTaskIfLocal) {
		this.mostRecentTaskIfLocal = mostRecentTaskIfLocal;
	}

	@Override
	public String toString() {
		return "WarePorfileModel [cpuCount=" + cpuCount + ", memory=" + memory
				+ ", dynamicMemoryEnabled=" + dynamicMemoryEnabled
				+ ", dynamicMemoryMaximumMB=" + dynamicMemoryMaximumMB
				+ ", dynamicMemoryBufferPercentage="
				+ dynamicMemoryBufferPercentage + ", memoryWeight="
				+ memoryWeight + ", virtualVideoAdapterEnabled="
				+ virtualVideoAdapterEnabled + ", monitorMaximumCount="
				+ monitorMaximumCount + ", monitorResolutionMaximum="
				+ monitorResolutionMaximum + ", bootOrder=" + bootOrder
				+ ", undoDisksEnabled=" + undoDisksEnabled + ", cpuType="
				+ cpuType + ", isHighlyAvailable=" + isHighlyAvailable
				+ ", havmPriority=" + havmPriority
				+ ", isDRProtectionRequired=" + isDRProtectionRequired
				+ ", limitCPUFunctionality=" + limitCPUFunctionality
				+ ", limitCPUForMigration=" + limitCPUForMigration
				+ ", expectedCPUUtilization=" + expectedCPUUtilization
				+ ", diskIO=" + diskIO + ", networkUtilization="
				+ networkUtilization + ", relativeWeight=" + relativeWeight
				+ ", cpuReserve=" + cpuReserve + ", cpuMax=" + cpuMax
				+ ", cpuPerVirtualNumaNodeMaximum="
				+ cpuPerVirtualNumaNodeMaximum
				+ ", memoryPerVirtualNumaNodeMaximumMB="
				+ memoryPerVirtualNumaNodeMaximumMB
				+ ", virtualNumaNodesPerSocketMaximum="
				+ virtualNumaNodesPerSocketMaximum
				+ ", dynamicMemoryMinimumMB=" + dynamicMemoryMinimumMB
				+ ", numLockEnabled=" + numLockEnabled
				+ ", numaIsolationRequired=" + numaIsolationRequired
				+ ", virtualDVDDrives=" + virtualDVDDrives + ", shareSCSIBus="
				+ shareSCSIBus + ", virtualNetworkAdapters="
				+ virtualNetworkAdapters + ", virtualFloppyDrive="
				+ virtualFloppyDrive + ", virtualCOMPorts=" + virtualCOMPorts
				+ ", virtualSCSIAdapters=" + virtualSCSIAdapters
				+ ", capabilityProfile=" + capabilityProfile
				+ ", capabilityProfileCompatibilityState="
				+ capabilityProfileCompatibilityState + ", grantedToList="
				+ grantedToList + ", userRoleID=" + userRoleID + ", userRole="
				+ userRole + ", owner=" + owner + ", objectType=" + objectType
				+ ", accessibility=" + accessibility + ", name=" + name
				+ ", isViewOnly=" + isViewOnly + ", description=" + description
				+ ", addedTime=" + addedTime + ", modifiedTime=" + modifiedTime
				+ ", enabled=" + enabled + ", mostRecentTask=" + mostRecentTask
				+ ", serverConnection=" + serverConnection + ", id=" + id
				+ ", markedForDeletion=" + markedForDeletion
				+ ", isFullyCached=" + isFullyCached
				+ ", mostRecentTaskIfLocal=" + mostRecentTaskIfLocal + "]";
	}

}
