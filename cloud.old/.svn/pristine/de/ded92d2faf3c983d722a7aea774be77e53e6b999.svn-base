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
 * 功能描述:虚拟机类型表
 * 版权所有：康讯通讯 未经本公司许可，不得以任何方式复制或使用本程序任何部分
 * 
 * @author chenliang 新增日期：2013-9-11
 * @author chenliang 修改日期：2013-9-11
 * @since system_center_share
 */
@Entity
@SequenceGenerator(name="SEQ_VIRTUAL_TYPE_ID",sequenceName="SEQ_VIRTUAL_TYPE_ID",allocationSize=1)
@Table(name = "tb_virtual_type")
public class VirtualTypeEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_VIRTUAL_TYPE_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Long id;
	
	@Column(name = "virturl_type_name", updatable = false, nullable = false, insertable = false, length = 32)
	private String virturlTypeName;
	
	@OneToMany(mappedBy = "tbVirtualTypeId")
	@Cascade({ CascadeType.ALL })
	private Set<VirtualMachineEntity> virtualMachineEntity;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getVirturlTypeName() {
		return virturlTypeName;
	}
	public void setVirturlTypeName(String virturlTypeName) {
		this.virturlTypeName = virturlTypeName;
	}
	@Override
	public String toString() {
		return "VirtualTypeEntity [id=" + id + ", virturlTypeName="
				+ virturlTypeName + "]";
	}
 
 
}
