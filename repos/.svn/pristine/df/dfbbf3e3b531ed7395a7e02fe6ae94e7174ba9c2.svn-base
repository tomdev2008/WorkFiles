package com.unicom.mms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 
* 功能描述: 饰品实体类
* @author chenliang 新增日期：2013-1-31
* @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_DECORATION_ID",sequenceName="SEQ_DECORATION_ID",allocationSize=1)
@Table(name = "tb_decoration")
public class TbDecoration implements java.io.Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="SEQ_DECORATION_ID")
	@Column(name="id",updatable=false,nullable=false,insertable=false,length=32)
	private Integer id;  //主键id
	
	@Column(name="name",updatable=true,nullable=false,insertable=true,length=150)
	private String name; 
	
	/**
	 * 存放地址url
	 */
	@Column(name="pic_url",updatable=true,nullable=false,insertable=true,length=200)
	private String picUrl;
	
	/**
	 * 状态:0显示，1不显示
	 */
	@Column(name="status",updatable=true,nullable=false,insertable=true,length=200)
	private Integer status;
	
	/**
	 * 模板类型
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "deco_type_id", nullable = false)
	private TbDecorationType decorationType;

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

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public TbDecorationType getDecorationType() {
		return decorationType;
	}

	public void setDecorationType(TbDecorationType decorationType) {
		this.decorationType = decorationType;
	}

	public TbDecoration(Integer id, String name, String picUrl, Integer status,
			TbDecorationType decorationType) {
		super();
		this.id = id;
		this.name = name;
		this.picUrl = picUrl;
		this.status = status;
		this.decorationType = decorationType;
	}

	public TbDecoration() {
		super();
	}

	@Override
	public String toString() {
		return "TbDecoration [id=" + id + ", name=" + name + ", picUrl="
				+ picUrl + ", status=" + status  + "]";
	}
}
