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
 * 功能描述:相框实体类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_PHOTO_FRAME_ID",sequenceName="SEQ_PHOTO_FRAME_ID",allocationSize=1)
@Table(name = "tb_photo_frame")
public class TbPhotoFrame implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_PHOTO_FRAME_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 相框名
	 */
	@Column(name = "name", updatable = true, nullable = false, insertable = true, length = 150)
	private String name;

	/**
	 * 文件地址
	 */
	@Column(name = "pic_url", updatable = true, nullable = false, insertable = true, length = 200)
	private String picUrl;

	/**
	 * 状态：0显示，1不显示
	 */
	@Column(name = "stauts", updatable = true, nullable = false, insertable = true, length = 32)
	private Integer stauts;
	/**
	 * 用于前端展示的小图
	 */
	@Column(name="small_frame",updatable=true,nullable=true,insertable=true,length=200)
	private String smallFrame;
	
	/**
	 * 相框类型
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "frame_type_id", nullable = false)
	private TbFrameType frameType;

	public TbPhotoFrame() {
	}

	public TbPhotoFrame(Integer id, String name, String picUrl, Integer stauts,
			TbFrameType frameType) {
		super();
		this.id = id;
		this.name = name;
		this.picUrl = picUrl;
		this.stauts = stauts;
		this.frameType = frameType;
	}

	@Override
	public String toString() {
		return "TbPhotoFrame [id=" + id + ", name=" + name + ", picUrl="
				+ picUrl + ", stauts=" + stauts + ", smallFrame=" + smallFrame
				+ ", frameType=" + frameType + "]";
	}

	public String getSmallFrame() {
		return smallFrame;
	}

	public void setSmallFrame(String smallFrame) {
		this.smallFrame = smallFrame;
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


	public TbFrameType getFrameType() {
		return frameType;
	}

	public void setFrameType(TbFrameType frameType) {
		this.frameType = frameType;
	}
	
}
