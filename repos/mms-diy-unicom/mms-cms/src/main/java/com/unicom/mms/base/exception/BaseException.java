package com.unicom.mms.base.exception;

/**
 * 
 * 鍔熻兘鎻忚堪:寮傚父澶勭悊鍩虹被
 * <p>
 * 鐗堟潈鎵��夛細鍖椾含搴疯閫氳
 * <p>
 * 鏈粡鏈叕鍙歌鍙紝涓嶅緱浠ヤ换浣曟柟寮忓鍒舵垨浣跨敤鏈▼搴忎换浣曢儴鍒��
 * 
* @author chenliang 鏂板鏃ユ湡锛�13-1-14
* @since mms-cms-unicom
 */
public class BaseException extends Exception {
	/**
	 * 绫诲簭鍒楀寲ID
	 */
	private static final long serialVersionUID = -5246579929018578466L;
	/**
	 * 鍥介檯鍖栦俊鎭痥ey
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
