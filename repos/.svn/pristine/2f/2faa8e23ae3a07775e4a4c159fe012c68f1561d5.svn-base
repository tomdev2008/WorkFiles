package com.unicom.mms.entity;

// default package

import java.util.Date;
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
 * 功能描述:用户照片类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_USER_PHOTO_ID",sequenceName="SEQ_USER_PHOTO_ID",allocationSize=1)
@Table(name = "tb_user_photo")
public class TbUserPhoto implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_USER_PHOTO_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 照片名
	 */
	@Column(name = "phototname", updatable = true, nullable = false, insertable = true, length = 200)
	private String photo_name;

	/**
	 * 照片地址
	 */
	@Column(name = "photo_url", updatable = true, nullable = false, insertable = true, length = 200)
	private String photo_url;

	/**
	 * 上传时间
	 */
	@Column(name = "updatetime", updatable = true, nullable = false, insertable = true)
	private Date upload_time;

	/**
	 * 终端用户
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	private TbUsers users;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPhoto_name() {
		return photo_name;
	}

	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}

	public String getPhoto_url() {
		return photo_url;
	}

	public void setPhoto_url(String photo_url) {
		this.photo_url = photo_url;
	}

	public Date getUpload_time() {
		return upload_time;
	}

	public void setUpload_time(Date upload_time) {
		this.upload_time = upload_time;
	}

	public TbUsers getUsers() {
		return users;
	}

	public void setUsers(TbUsers users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "TbUserPhoto [id=" + id + ", photo_name=" + photo_name
				+ ", photo_url=" + photo_url + ", upload_time=" + upload_time
				+  "]";
	}

	public TbUserPhoto() {
		super();
	}

	public TbUserPhoto(Integer id, String photo_name, String photo_url,
			Date upload_time, TbUsers users) {
		super();
		this.id = id;
		this.photo_name = photo_name;
		this.photo_url = photo_url;
		this.upload_time = upload_time;
		this.users = users;
	}

}