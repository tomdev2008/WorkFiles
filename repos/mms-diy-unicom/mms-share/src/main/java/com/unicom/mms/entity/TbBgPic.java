package com.unicom.mms.entity;

// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 
 * 功能描述:背景图片
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_BG_PIC_ID",sequenceName="SEQ_BG_PIC_ID",allocationSize=1)
@Table(name = "tb_bg_pic")
public class TbBgPic implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_BG_PIC_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 背景图片名称
	 */
	@Column(name = "name", updatable = true, nullable = false, insertable = true, length = 150)
	private String name;
	
	/**
	 * 背景图片地址
	 */
	@Column(name = "pic_url", updatable = true, nullable = false, insertable = true, length = 150)
	private String picUrl;

	/**
	 * 状态
	 */
	@Column(name = "status", updatable = true, nullable = false, insertable = true, length = 32)
	private Integer status;
	/**
	 * 用于前端展示的小图
	 */
	@Column(name="small_bgpic",updatable=true,nullable=true,insertable=true,length=200)
	private String smallBgPic;
	
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

	
	public String getSmallBgPic() {
		return smallBgPic;
	}

	public void setSmallBgPic(String smallBgPic) {
		this.smallBgPic = smallBgPic;
	}

	@Override
	public String toString() {
		return "TbBgPic [id=" + id + ", name=" + name + ", picUrl=" + picUrl
				+ ", status=" + status + ", smallBgPic=" + smallBgPic + "]";
	}


	
}