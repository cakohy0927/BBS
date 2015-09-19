package com.cako.basic.index;

import com.cako.platform.menu.entity.Menu;

public class TestTree {

	private String id;
	private String name;
	private String href;
	private String pId;
	private String pName;

	public TestTree(Menu menu) {
		this.id = menu.getId();
		this.name = menu.getName();
		this.href = menu.getHref();
		this.pId = menu.getMenu() != null ? menu.getMenu().getId() : "";
		this.pName = menu.getMenu() != null ? menu.getMenu().getName() : "";
	}

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

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}
}
