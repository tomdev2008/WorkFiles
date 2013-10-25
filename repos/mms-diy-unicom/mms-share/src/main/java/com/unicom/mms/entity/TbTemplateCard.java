package com.unicom.mms.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * 
* 功能描述: 模板实体类
* @author chenliang 新增日期：2013-1-31
* @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_TEMPLATE_CARD_ID",sequenceName="SEQ_TEMPLATE_CARD_ID",allocationSize=1)
@Table(name = "tb_template_card")
public class TbTemplateCard implements java.io.Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="SEQ_TEMPLATE_CARD_ID")
	@Column(name="id",updatable=false,nullable=false,insertable=false,length=32)
	private Integer id;  //主键id
	
	@Column(name="card_title",updatable=true,nullable=false,insertable=true,length=150)
	private String cardTitle; 
	
	/**
	 * 祝福语
	 */
	@Column(name="wish_word",updatable=true,nullable=false,insertable=true,length=200)
	private String wishWord;
	
	/**
	 * 收藏数
	 */
	@Column(name="collect_num",updatable=true,nullable=false,insertable=true,length=200)
	private Integer collectNum;
	
	/**
	 * 存放地址url
	 */
	@Column(name="pic_url",updatable=true,nullable=false,insertable=true,length=200)
	private String picUrl;
	
	/**
	 * 用于前端展示的小图
	 */
	@Column(name="small_pic",updatable=true,nullable=true,insertable=true,length=200)
	private String smallPic;
	
	/**
	 * 输入文字的x坐标
	 */
	@Column(name="xpos_text",updatable=true,nullable=true,insertable=true)
	private Integer xPosText;
	
	/**
	 * 输入文字的y坐标
	 */
	@Column(name="ypos_text",updatable=true,nullable=true,insertable=true)
	private Integer yPosText;
	
	/**
	 * 输入文字的宽度
	 */
	@Column(name="width_text",updatable=true,nullable=true,insertable=true)
	private Integer widthText;
	
	/**
	 * 输入文字的高度
	 */
	@Column(name="height_text",updatable=true,nullable=true,insertable=true)
	private Integer heightText; 
	
	/**
	 * 状态:0显示，1不显示
	 */
	@Column(name="status",updatable=true,nullable=false,insertable=true,length=200)
	private Integer status;
	
	/**
	 * 模板类型
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "card_type_id", nullable = false)
	private TbCardType cardType;
	
	/**
	 * 最新推荐
	 */
	@OneToMany(mappedBy = "top1")
	@Cascade({ CascadeType.ALL })
	private Set<TbNewBillboard> newBillBoardTop1;
	
	@OneToMany(mappedBy = "top2")
	@Cascade({ CascadeType.ALL })
	private Set<TbNewBillboard> newBillBoardTop2;
	
	@OneToMany(mappedBy = "top3")
	@Cascade({ CascadeType.ALL })
	private Set<TbNewBillboard> newBillBoardTop3;
	
	@OneToMany(mappedBy = "top4")
	@Cascade({ CascadeType.ALL })
	private Set<TbNewBillboard> newBillBoardTop4;
	
	@OneToMany(mappedBy = "top5")
	@Cascade({ CascadeType.ALL })
	private Set<TbNewBillboard> newBillBoardTop5;

	@OneToMany(mappedBy = "top6")
	@Cascade({ CascadeType.ALL })
	private Set<TbNewBillboard> newBillBoardTop6;
	
	@OneToMany(mappedBy = "top7")
	@Cascade({ CascadeType.ALL })
	private Set<TbNewBillboard> newBillBoardTop7;
	
	@OneToMany(mappedBy = "top8")
	@Cascade({ CascadeType.ALL })
	private Set<TbNewBillboard> newBillBoardTop8;
	
	@OneToMany(mappedBy = "top9")
	@Cascade({ CascadeType.ALL })
	private Set<TbNewBillboard> newBillBoardTop9;
	
	@OneToMany(mappedBy = "top10")
	@Cascade({ CascadeType.ALL })
	private Set<TbNewBillboard> newBillBoardTop10;
	
	/**
	 * 最热推荐
	 */
	@OneToMany(mappedBy = "top1")
	@Cascade({ CascadeType.ALL })
	private Set<TbHotBillboard> hotBillboardTop1;
	
	@OneToMany(mappedBy = "top2")
	@Cascade({ CascadeType.ALL })
	private Set<TbHotBillboard> hotBillboardTop2;
	
	@OneToMany(mappedBy = "top3")
	@Cascade({ CascadeType.ALL })
	private Set<TbHotBillboard> hotBillboardTop3;
	
	@OneToMany(mappedBy = "top4")
	@Cascade({ CascadeType.ALL })
	private Set<TbHotBillboard> hotBillboardTop4;
	
	@OneToMany(mappedBy = "top5")
	@Cascade({ CascadeType.ALL })
	private Set<TbHotBillboard> hotBillboardTop5;

	@OneToMany(mappedBy = "top6")
	@Cascade({ CascadeType.ALL })
	private Set<TbHotBillboard> hotBillboardTop6;
	
	@OneToMany(mappedBy = "top7")
	@Cascade({ CascadeType.ALL })
	private Set<TbHotBillboard> hotBillboardTop7;
	
	@OneToMany(mappedBy = "top8")
	@Cascade({ CascadeType.ALL })
	private Set<TbHotBillboard> hotBillboardTop8;
	
	@OneToMany(mappedBy = "top9")
	@Cascade({ CascadeType.ALL })
	private Set<TbHotBillboard> hotBillboardTop9;
	
	@OneToMany(mappedBy = "top10")
	@Cascade({ CascadeType.ALL })
	private Set<TbHotBillboard> hotBillboardTop10;

	public TbTemplateCard(Integer id, String cardTitle, String wishWord,
			Integer collectNum, String picUrl, Integer status,
			TbCardType cardType) {
		super();
		this.id = id;
		this.cardTitle = cardTitle;
		this.wishWord = wishWord;
		this.collectNum = collectNum;
		this.picUrl = picUrl;
		this.status = status;
		this.cardType = cardType;
	}

	public String getSmallPic() {
		return smallPic;
	}

	public void setSmallPic(String smallPic) {
		this.smallPic = smallPic;
	}

	public Integer getxPosText() {
		return xPosText;
	}

	public void setxPosText(Integer xPosText) {
		this.xPosText = xPosText;
	}

	public Integer getyPosText() {
		return yPosText;
	}

	public void setyPosText(Integer yPosText) {
		this.yPosText = yPosText;
	}

	public Integer getWidthText() {
		return widthText;
	}

	public void setWidthText(Integer widthText) {
		this.widthText = widthText;
	}

	public Integer getHeightText() {
		return heightText;
	}

	public void setHeightText(Integer heightText) {
		this.heightText = heightText;
	}

	@Override
	public String toString() {
		return "TbTemplateCard [id=" + id + ", cardTitle=" + cardTitle
				+ ", wishWord=" + wishWord + ", collectNum=" + collectNum
				+ ", picUrl=" + picUrl + ", status=" + status +"]";
	}

	public TbTemplateCard() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCardTitle() {
		return cardTitle;
	}

	public void setCardTitle(String cardTitle) {
		this.cardTitle = cardTitle;
	}

	public String getWishWord() {
		return wishWord;
	}

	public void setWishWord(String wishWord) {
		this.wishWord = wishWord;
	}

	public Integer getCollectNum() {
		return collectNum;
	}

	public void setCollectNum(Integer collectNum) {
		this.collectNum = collectNum;
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

	public TbCardType getCardType() {
		return cardType;
	}

	public void setCardType(TbCardType cardType) {
		this.cardType = cardType;
	}
	
	
	
}
