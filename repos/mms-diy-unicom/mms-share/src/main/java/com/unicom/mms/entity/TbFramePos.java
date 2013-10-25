package com.unicom.mms.entity;

// default package

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
 * 功能描述:相框各种元素坐标
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_FRAME_POS_ID",sequenceName="SEQ_FRAME_POS_ID",allocationSize=1)
@Table(name = "tb_frame_pos")
public class TbFramePos implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_FRAME_POS_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 类型:1、邮票,2、邮戳,3、文字
	 */
	@Column(name = "type", updatable = true, nullable = false, insertable = true, length = 50)
	private String type;

	/**
	 * x坐标
	 */
	@Column(name = "xpos", updatable = true, nullable = false, insertable = true, length = 50)
	private Double xpos;

	/**
	 *  y坐标
	 */
	@Column(name = "ypos", updatable = true, nullable = false, insertable = true, length = 50)
	private Double ypos;

	/**
	 * 宽度
	 */
	@Column(name = "width", updatable = true, nullable = false, insertable = true, length = 50)
	private Double width;
	
	/**
	 * 高度
	 */
	@Column(name = "height", updatable = true, nullable = false, insertable = true, length = 50)
	private Double height;
	
	/**
	 * 相框外键
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "photo_frame_id", nullable = false)
	private TbPhotoFrame photoFrame;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Double getXpos() {
		return xpos;
	}

	public void setXpos(Double xpos) {
		this.xpos = xpos;
	}

	public Double getYpos() {
		return ypos;
	}

	public void setYpos(Double ypos) {
		this.ypos = ypos;
	}

	public TbPhotoFrame getPhotoFrame() {
		return photoFrame;
	}

	public void setPhotoFrame(TbPhotoFrame photoFrame) {
		this.photoFrame = photoFrame;
	}

	public Double getWidth() {
		return width;
	}

	public void setWidth(Double width) {
		this.width = width;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	@Override
	public String toString() {
		return "TbFrameProperty [id=" + id + ", type=" + type + ", xpos="
				+ xpos + ", ypos=" + ypos + ", photoFrame=" + photoFrame + "]";
	}

}