package cn.com.mmsweb.vo;

import cn.com.common.Page;
import com.unicom.mms.entity.TbTemplateCard;

public class TemplateCardtVo {

	private String name; // 模板类型名称
	private String id; // 模板类型id
	private Page<TbTemplateCard> templateCard; //模板明信片集合

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Page<TbTemplateCard> getTemplateCard() {
		return templateCard;
	}

	public void setTemplateCard(Page<TbTemplateCard> templateCard) {
		this.templateCard = templateCard;
	}


}
