package cn.com.base.exception;

/**
 * 
 * 功能描述:系统异常类，该类型的异常要写日志
 * <p>
 * 版权扄1�7�1�7�：北京康讯通讯有限公司
 * <p>
 * 未经本公司许可，不得以任何方式复制或使用本程序任何部刄1�7�1�7
 * 
* @author chenliang 新增日期＄1�713-1-14
* @since mms-cms-unicom
 */
public class SystemException extends BaseException {
	/**
	 * 类序列化ID
	 */
	private static final long serialVersionUID = 2519586663837180588L;

	public SystemException() {
		super();
	}

	public SystemException(final String errorCode) {
		super(errorCode);   
	}
}
