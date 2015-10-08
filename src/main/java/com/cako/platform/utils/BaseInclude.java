package com.cako.platform.utils;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

@SuppressWarnings("serial")
public class BaseInclude extends TagSupport {

	/**
	 * 继承
	 */
	private String extend;

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			out.write("");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_PAGE;
	}

	public String getExtend() {
		return extend;
	}

	public void setExtend(String extend) {
		this.extend = extend;
	}
}
