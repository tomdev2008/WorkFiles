package com.unicom.mms.base.exception;

/**
 * 
 * 鍔熻兘鎻忚堪:涓氬姟寮傚父绫伙紝璇ョ被鍨嬪紓甯稿彲涓嶇敤鍐欐棩蹇楋紝寮傚父淇℃伅闇��佸湪鎻愮ず缁欑敤鎴��
 * <p>
 * 鐗堟潈鎵��夛細鍖椾含搴疯閫氳璁惧鏈夐檺鍏徃
 * <p>
 * 鏈粡鏈叕鍙歌鍙紝涓嶅緱浠ヤ换浣曟柟寮忓鍒舵垨浣跨敤鏈▼搴忎换浣曢儴鍒��
 * 
	* @author chenliang 鏂板鏃ユ湡锛�13-1-14
	* @since mms-cms-unicom
 */
public class OperationException extends BaseException {
	/**
	 * 绫诲簭鍒楀寲ID
	 */
	private static final long serialVersionUID = -2657816827277800681L;

	public OperationException() {
		super();
	}

	public OperationException(final String errorCode) {
		super(errorCode);
	}
}
