package com.cako.platform.utils;

public class MessageObject {

	private Integer resposeCode;

	private String result;

	private String currentPage;

	/**
	 * 总记录数
	 */
	private Integer totalNumber;

	/**
	 * 自定义 信息
	 */
	private String inforamation;

	private String errorInformation;

	private Object object;

	public MessageObject(String inforamation) {
		this.inforamation = inforamation;
	}

	public MessageObject() {

	}

	public final Integer getResposeCode() {
		return resposeCode;
	}

	public final void setResposeCode(Integer resposeCode) {
		this.resposeCode = resposeCode;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	public String getInforamation() {
		return inforamation;
	}

	public void setInforamation(String inforamation) {
		this.resposeCode = MessageObject.ResposeCode.code_200;
		this.inforamation = inforamation;
	}

	public String getErrorInformation() {
		return errorInformation;
	}

	public void setErrorInformation(String errorInformation) {
		this.resposeCode = ResposeCode.code_404;
		this.errorInformation = errorInformation;
	}

	public Integer getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(Integer totalNumber) {
		this.totalNumber = totalNumber;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public static interface Result {
		public static final String SUCCESS = "success";
		public static final String FAILIAR = "failiar";
	}

	public interface OperateInformation {

		public static final String SAVE_SUCCESS = "保存成功";
		public static final String SAVE_ERROR = "保存失败";

		public static final String EDIT_SUCCESS = "修改成功";
		public static final String EDIT_ERROR = "修改失败";

		public static final String DELETE_SUCCESS = "删除成功";
		public static final String DELETE_ERROR = "删除失败";

		public static final String CONFIRM_INFO = "你确定删除";
	}

	public static interface ResposeCode {
		/**
		 * 请求成功代码
		 */
		public static final Integer code_200 = 200;
		/**
		 * 请求失败代码
		 */
		public static final Integer code_404 = 404;
		/**
		 * 请求错误代码
		 */
		public static final Integer code_403 = 403;

		public static final Integer code_100 = 100;
	}
}
