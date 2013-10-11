package cn.com.kxcomm.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * 
 * 功能描述:虚拟网络交换机
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-11
 * @author chenliang 修改日期：2013-9-11
 * @since system_center_share
 */
@Entity
@SequenceGenerator(name="SEQ_VIRTUAL_NETWORK_SWITCH_ID",sequenceName="SEQ_VIRTUAL_NETWORK_SWITCH_ID",allocationSize=1)
@Table(name = "tb_virtual_network_switch")
public class VirtualNetworkSwitchEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_VIRTUAL_NETWORK_SWITCH_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;
	
	@Column(name = "network_name", updatable = false, nullable = false, insertable = false, length = 150)
	private String networkName;
	
	@Column(name = "start_ip", updatable = false, nullable = false, insertable = false, length = 150)
	private String startIp; //起始ip
	
	@Column(name = "end_ip", updatable = false, nullable = false, insertable = false, length = 150)
	private String endIp; //结尾ip
	
	@Column(name = "vlan_id", updatable = false, nullable = false, insertable = false, length = 150)
	private Integer vlanId; //vlan-id
	
	@Column(name = "gateway_ip", updatable = false, nullable = false, insertable = false, length = 150)
	private String gatewayIp; //网关ip
	
	@Column(name = "mask_ip", updatable = false, nullable = false, insertable = false, length = 150)
	private String maskIp; //掩码ip
	
	@Column(name = "remark", updatable = false, nullable = false, insertable = false, length = 150)
	private String remark; //备注
	
	@Column(name = "use_range", updatable = false, nullable = false, insertable = false, length = 150)
	private Integer useRange; //使用范围  1、内网 ，2外网
	
	@OneToMany(mappedBy = "tbVirtualNetWorkSwitchId")
	@Cascade({ CascadeType.ALL })
	private Set<VirtualMachineEntity> virtualMachineEntity;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNetworkName() {
		return networkName;
	}
	public void setNetworkName(String networkName) {
		this.networkName = networkName;
	}
	public String getStartIp() {
		return startIp;
	}
	public void setStartIp(String startIp) {
		this.startIp = startIp;
	}
	public String getEndIp() {
		return endIp;
	}
	public void setEndIp(String endIp) {
		this.endIp = endIp;
	}
	public int getVlanId() {
		return vlanId;
	}
	public void setVlanId(int vlanId) {
		this.vlanId = vlanId;
	}
	public String getGatewayIp() {
		return gatewayIp;
	}
	public void setGatewayIp(String gatewayIp) {
		this.gatewayIp = gatewayIp;
	}
	public String getMaskIp() {
		return maskIp;
	}
	public void setMaskIp(String maskIp) {
		this.maskIp = maskIp;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getUseRange() {
		return useRange;
	}
	public void setUseRange(int useRange) {
		this.useRange = useRange;
	}
	@Override
	public String toString() {
		return "VirtualNetworkSwitchEntity [id=" + id + ", networkName="
				+ networkName + ", startIp=" + startIp + ", endIp=" + endIp
				+ ", vlanId=" + vlanId + ", gatewayIp=" + gatewayIp + ", maskIp="
				+ maskIp + ", remark=" + remark + ", useRange=" + useRange + "]";
	}


}
