package com.unicom.mms.entity;

// default package

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
 * 功能描述:饰品类别实体类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_DECORATION_TYPE_ID",sequenceName="SEQ_DECORATION_TYPE_ID",allocationSize=1)
@Table(name = "tb_decoration_type")
public class TbDecorationType implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_DECORATION_TYPE_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	@Column(name = "name", updatable = true, nullable = false, insertable = true, length = 150)
	private String name;

	// Constructors
	@OneToMany(mappedBy = "decorationType")
	@Cascade({ CascadeType.ALL })
	private Set<TbDecoration> decoration;
	
	public TbDecorationType() {
		super();
	}

	public TbDecorationType(Integer id, String name,
			Set<TbDecoration> decoration) {
		super();
		this.id = id;
		this.name = name;
		this.decoration = decoration;
	}
	
	@Override
	public String toString() {
		return "TbDecorationType [id=" + id + ", name=" + name + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<TbDecoration> getDecoration() {
		return decoration;
	}

	public void setDecoration(Set<TbDecoration> decoration) {
		this.decoration = decoration;
	}


}