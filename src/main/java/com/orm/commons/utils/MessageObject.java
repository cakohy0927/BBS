package com.orm.commons.utils;

public class MessageObject {

	public static interface ResponseCode {
		public static final Integer code_100 = 100;
		/**
		 * 请求成功代码
		 */
		public static final Integer code_200 = 200;
		/**
		 * 请求错误代码
		 */
		public static final Integer code_403 = 403;

		/**
		 * 请求失败代码
		 */
		public static final Integer code_404 = 404;
	}

	private String message;

	private Integer resposecode;

	public String getMessage() {
		return message;
	}

	public Integer getResposecode() {
		return resposecode;
	}

	public void setErrorMessage(String errorMessage) {
		this.message = errorMessage;
	}

	public void setInforMessage(String inforMessage) {
		this.message = inforMessage;
	}

	public void setResposecode(Integer resposecode) {
		this.resposecode = resposecode;
	}
}
