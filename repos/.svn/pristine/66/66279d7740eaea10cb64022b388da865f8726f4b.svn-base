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
 * 功能描述:最热推荐实体类
 * 
 * @author chenliang 新增日期：2013-1-31
 * @since mms-cms-unicom
 */
@Entity
@SequenceGenerator(name="SEQ_HOT_BILLBOARD_ID",sequenceName="SEQ_HOT_BILLBOARD_ID",allocationSize=1)
@Table(name = "tb_hot_billboard")
public class TbHotBillboard implements java.io.Serializable {

	// Fields
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="SEQ_HOT_BILLBOARD_ID")
	@Column(name = "id", updatable = false, nullable = false, insertable = false, length = 32)
	private Integer id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "top1", nullable = false)
	private TbTemplateCard top1;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "top2", nullable = false)
	private TbTemplateCard top2;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "top3", nullable = false)
	private TbTemplateCard top3;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "top4", nullable = false)
	private TbTemplateCard top4;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "top5", nullable = false)
	private TbTemplateCard top5;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "top6", nullable = false)
	private TbTemplateCard top6;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "top7", nullable = false)
	private TbTemplateCard top7;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "top8", nullable = false)
	private TbTemplateCard top8;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "top9", nullable = false)
	private TbTemplateCard top9;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "top10", nullable = false)
	private TbTemplateCard top10;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TbTemplateCard getTop1() {
		return top1;
	}

	public void setTop1(TbTemplateCard top1) {
		this.top1 = top1;
	}

	public TbTemplateCard getTop2() {
		return top2;
	}

	public void setTop2(TbTemplateCard top2) {
		this.top2 = top2;
	}

	public TbTemplateCard getTop3() {
		return top3;
	}

	public void setTop3(TbTemplateCard top3) {
		this.top3 = top3;
	}

	public TbTemplateCard getTop4() {
		return top4;
	}

	public void setTop4(TbTemplateCard top4) {
		this.top4 = top4;
	}

	public TbTemplateCard getTop5() {
		return top5;
	}

	public void setTop5(TbTemplateCard top5) {
		this.top5 = top5;
	}

	public TbTemplateCard getTop6() {
		return top6;
	}

	public void setTop6(TbTemplateCard top6) {
		this.top6 = top6;
	}

	public TbTemplateCard getTop7() {
		return top7;
	}

	public void setTop7(TbTemplateCard top7) {
		this.top7 = top7;
	}

	public TbTemplateCard getTop8() {
		return top8;
	}

	public void setTop8(TbTemplateCard top8) {
		this.top8 = top8;
	}

	public TbTemplateCard getTop9() {
		return top9;
	}

	public void setTop9(TbTemplateCard top9) {
		this.top9 = top9;
	}

	public TbTemplateCard getTop10() {
		return top10;
	}

	public void setTop10(TbTemplateCard top10) {
		this.top10 = top10;
	}

	public TbHotBillboard() {
		super();
	}

}
