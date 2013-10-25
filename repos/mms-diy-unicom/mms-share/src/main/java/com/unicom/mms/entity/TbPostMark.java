package com.unicom.mms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 
* 功能描述:邮戳实体类
* @author chenliang 新增日期：2013-1-31
* @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_POST_MARK_ID",sequenceName="SEQ_POST_MARK_ID",allocationSize=1)
@Table(name = "tb_postmark")
public class TbPostMark implements java.io.Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_POST_MARK_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;
	
	@Column(name = "name", updatable = true, nullable = false, insertable = true, length = 150)
	private String name;
	
	@Column(name = "pic_url", updatable = true, nullable = false, insertable = true, length = 200)
	private String picUrl;
	
	@Column(name = "stauts", updatable = true, nullable = false, insertable = true, length = 32)
	private Integer stauts;
	
	@Override
	public String toString() {
		return "TbPostMark [id=" + id + ", name=" + name + ", picUrl=" + picUrl
				+ ", stauts=" + stauts + "]";
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

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public Integer getStauts() {
		return stauts;
	}

	public void setStauts(Integer stauts) {
		this.stauts = stauts;
	}

	public TbPostMark(){}
	
	public TbPostMark(Integer id, String name, String picUrl, Integer stauts) {
		super();
		this.id = id;
		this.name = name;
		this.picUrl = picUrl;
		this.stauts = stauts;
	}
	
	
}
