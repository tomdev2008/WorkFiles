package cn.com.kxcomm.selfservice.vo;

import java.util.ArrayList;
import java.util.Date;

import cn.com.kxcomm.entity.RightEntity;

public class MenuEntity {
	private Integer menuId;
	private String menuName;
	private String url;
	private Date createTime;
	private Short level;
	private ArrayList<RightEntity> list;

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Short getLevel() {
		return level;
	}

	public void setLevel(Short level) {
		this.level = level;
	}

	public ArrayList<RightEntity> getList() {
		return list;
	}

	public void setList(ArrayList<RightEntity> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "MenuEntity [createTime=" + createTime + ", level=" + level
				+ ", list=" + list + ", menuId=" + menuId + ", menuName="
				+ menuName + ", url=" + url + "]";
	}


}
