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
 * 功能描述:背景音乐实体类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_BG_MUSIC_ID",sequenceName="SEQ_BG_MUSIC_ID",allocationSize=1)
@Table(name = "tb_bg_music")
public class TbBgMusic implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_BG_MUSIC_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	/**
	 * 文件名称
	 */
	@Column(name = "name", updatable = true, nullable = false, insertable = true, length = 150)
	private String name;

	/**
	 * 文件地址
	 */
	@Column(name = "file_url", updatable = true, nullable = false, insertable = true, length = 200)
	private String fileUrl;

	/**
	 * 状态：0显示,1不显示
	 */
	@Column(name = "stauts", updatable = true, nullable = false, insertable = true, length = 32)
	private Integer stauts;

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

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public Integer getStauts() {
		return stauts;
	}

	public void setStauts(Integer stauts) {
		this.stauts = stauts;
	}

	public TbBgMusic(Integer id, String name, String fileUrl, Integer stauts) {
		super();
		this.id = id;
		this.name = name;
		this.fileUrl = fileUrl;
		this.stauts = stauts;
	}

	public TbBgMusic() {
		super();
	}

	@Override
	public String toString() {
		return "TbBgMusic [id=" + id + ", name=" + name + ", fileUrl="
				+ fileUrl + ", stauts=" + stauts + "]";
	}

}
