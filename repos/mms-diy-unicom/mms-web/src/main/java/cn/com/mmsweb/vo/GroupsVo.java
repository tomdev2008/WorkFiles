package cn.com.mmsweb.vo;

import java.io.Serializable;
import java.util.List;

public class GroupsVo implements Serializable {
	private String id;
	private String name;
	private List<ContractsVo> contactslist;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<ContractsVo> getContactslist() {
		return contactslist;
	}

	public void setContactslist(List<ContractsVo> contactslist) {
		this.contactslist = contactslist;
	}

	@Override
	public String toString() {
		return "GroupsVo [id=" + id + ", name=" + name + ", contactslist="
				+ contactslist + "]";
	}

}
