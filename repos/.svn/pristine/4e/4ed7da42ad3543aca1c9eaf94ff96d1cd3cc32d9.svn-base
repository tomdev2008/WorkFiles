package com.unicom.mms.resources.drawinfo;

/**
 * 
 * 多张素材照片
 * 
 * @author zhangjh 新增日期：2013-5-10
 * @since mms-resources
 */
public class PicturesInfo extends BaseInfo{
	private double rotate;
	
	public double getRotate() {
		return rotate;
	}

	public void setRotate(double rotate) {
		this.rotate = rotate;
	}

	@Override
	public String toString() {
		return "PicturesInfo [rotate=" + rotate + ", getPath()=" + getPath()
				+ ", getxPos()=" + getxPos() + ", getyPos()=" + getyPos()
				+ ", getWidth()=" + getWidth() + ", getHeight()=" + getHeight()
				+ "]";
	}

	/**
	 * 初始化多张素材,以#分割,先进先贴<br/>
	 * 格式：systemData/Accessories/katongxingxiang_01.png,10,240,120,120,2.0
	 * @param arg
	 */
	public PicturesInfo (String arg){
		if(arg==null||"".equals(arg.trim())){
			return ;
		}
		String[] tmp = arg.split(",");
		if(tmp.length<6){
			return ;
		}
		this.setPath(tmp[0]) ;
		this.setxPos(Integer.parseInt(tmp[1]));
		this.setyPos(Integer.parseInt(tmp[2]));
		this.setWidth(Integer.parseInt(tmp[3]));
		this.setHeight(Integer.parseInt(tmp[4]));
		this.setRotate(Double.parseDouble(tmp[5]));
	}
	
	public static void main(String[] args){
		PicturesInfo a = new PicturesInfo("systemData/Accessories/katongxingxiang_01.png,10,240,120,120,2.0");
		System.out.println(a.toString());
	}
}
