package com.unicom.mms.cms.vo;

import java.io.Serializable;

public class TemplateCardEntity implements Serializable {

	private String id;
	private String wishWord; // 祝福语
	private String cardTitle; // 标题
	private String state; // 状态
	private String cardTypeName; // 类型名称

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWishWord() {
		return wishWord;
	}

	public void setWishWord(String wishWord) {
		this.wishWord = wishWord;
	}

	public String getCardTitle() {
		return cardTitle;
	}

	public void setCardTitle(String cardTitle) {
		this.cardTitle = cardTitle;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCardTypeName() {
		return cardTypeName;
	}

	public void setCardTypeName(String cardTypeName) {
		this.cardTypeName = cardTypeName;
	}

	@Override
	public String toString() {
		return "TemplateCardEntity [wishWord=" + wishWord + ", cardTitle="
				+ cardTitle + ", state=" + state + ", cardTypeName="
				+ cardTypeName + "]";
	}

}
