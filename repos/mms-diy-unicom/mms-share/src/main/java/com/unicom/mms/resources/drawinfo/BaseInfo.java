package com.unicom.mms.resources.drawinfo;

public class BaseInfo {
	/**
	 * 图片路径systemData/Accessories/katongxingxiang_01.png
	 */
	private String path;
	/**
	 * x坐标
	 */
	private int xPos;
	/**
	 * y坐标
	 */
	private int yPos;
	/**
	 * 宽
	 */
	private int width;
	/**
	 * 高
	 */
	private int height;
	
	public BaseInfo (){
	}
	
	public BaseInfo (String arg){
		if(arg==null||"".equals(arg.trim())){
			return ;
		}
		String[] tmp = arg.split(",");
		if(tmp.length<5){
			return ;
		}
		this.setPath(tmp[0]) ;
		this.setxPos(Integer.parseInt(tmp[1]));
		this.setyPos(Integer.parseInt(tmp[2]));
		this.setWidth(Integer.parseInt(tmp[3]));
		this.setHeight(Integer.parseInt(tmp[4]));
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getxPos() {
		return xPos;
	}
	public void setxPos(int xPos) {
		this.xPos = xPos;
	}
	public int getyPos() {
		return yPos;
	}
	public void setyPos(int yPos) {
		this.yPos = yPos;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	@Override
	public String toString() {
		return "BaseInfo [path=" + path + ", xPos=" + xPos + ", yPos=" + yPos
				+ ", width=" + width + ", height=" + height + "]";
	}
	
	
}
