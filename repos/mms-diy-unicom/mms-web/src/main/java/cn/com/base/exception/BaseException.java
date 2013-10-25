package cn.com.base.exception;

/**
 * 
 * 功能描述:异常处理基类
 * <p>
 * 版权扄1�7�1�7�：北京康讯通讯
 * <p>
 * 未经本公司许可，不得以任何方式复制或使用本程序任何部刄1�7�1�7
 * 
* @author chenliang 新增日期＄1�713-1-14
* @since mms-cms-unicom
 */
public class BaseException extends Exception {
	/**
	 * 类序列化ID
	 */
	private static final long serialVersionUID = -5246579929018578466L;
	/**
	 * 国际化信息key
	 */
	private String errorCode;

	public BaseException() {
		super();
	}

	public BaseException(final String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

}
