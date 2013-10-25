package com.unicom.mms.socket;

/**
 * 
 * 上传对象
 * 
 * @author zhangjh 新增日期：2013-4-24
 * @since mms-resources
 */
public class UploadObject {
	/**
	 * 文件路径+名字
	 */
	private String newLocalFile;
	/**
	 * 文件类型
	 */
	private String fileType;
	private String path;
	private String createDir;
	
	public String getNewLocalFile() {
		return newLocalFile;
	}
	public void setNewLocalFile(String newLocalFile) {
		this.newLocalFile = newLocalFile;
	}
	public String getFileType() {
		return fileType;
	}
	public String getCreateDir() {
		return createDir;
	}
	public void setCreateDir(String createDir) {
		this.createDir = createDir;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@Override
	public String toString() {
		return "UploadObject [newLocalFile=" + newLocalFile + ", fileType="
				+ fileType + ", path=" + path + "]";
	}
	
	
}
