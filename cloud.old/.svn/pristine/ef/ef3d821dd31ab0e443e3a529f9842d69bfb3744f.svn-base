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
 * 功能描述:订单表 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-11
 * @author chenliang 修改日期：2013-9-11
 * @since system_center_share
 */
@Entity
@SequenceGenerator(name="SEQ_VHDDISK_ID",sequenceName="SEQ_VHDDISK_ID",allocationSize=1)
@Table(name = "tb_vhd_disk")
public class VhdDiskEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_VHDDISK_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;
	
	@Column(name = "disk_name", updatable = true, nullable = false, insertable = true, length = 150)
	private String diskName;
	
	@Column(name = "disk_size", updatable = true, nullable = false, insertable = true, length = 32)
	private Long diskSize;

	@OneToMany(mappedBy = "tbVhdDiskId")
	@Cascade({ CascadeType.ALL })
	private Set<VirtualMachineEntity> virtualMachineEntity;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDiskName() {
		return diskName;
	}

	public void setDiskName(String diskName) {
		this.diskName = diskName;
	}

	public Long getDiskSize() {
		return diskSize;
	}

	public void setDiskSize(Long diskSize) {
		this.diskSize = diskSize;
	}

	@Override
	public String toString() {
		return "VhdDisk [id=" + id + ", diskName=" + diskName + ", diskSize="
				+ diskSize + "]";
	}

}
