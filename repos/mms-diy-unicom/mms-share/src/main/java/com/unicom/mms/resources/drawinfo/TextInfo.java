package com.unicom.mms.resources.drawinfo;

public class TextInfo {
	/**
	 * 祝福语
	 */
	private String text;
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
	/**
	 * 字体大小
	 */
	private int fontSize;
	/**
	 * 字库文件
	 */
	private String fontsTTF;
	
	/**
	 * 字体颜色
	 */
	private String fontsColor;
	
	public TextInfo(){
		
	}

	/**
	 * 初始化字体<br/>
	 * 格式：中国人民共和国,10,20,120,120,40,systemData/fonts/BAUHS93.TTF,blue
	 * @param arg
	 */
	public TextInfo(String arg) {
		if(arg==null||"".equals(arg.trim())){
			return ;
		}
		String[] tmp = arg.split(",");
		if(tmp.length<8){
			return ;
		}
		this.setText(tmp[0]);
		this.setxPos(Integer.parseInt(tmp[1]));
		this.setyPos(Integer.parseInt(tmp[2]));
		this.setWidth(Integer.parseInt(tmp[3]));
		this.setHeight(Integer.parseInt(tmp[4]));
		this.setFontSize(Integer.parseInt(tmp[5]));
		this.setFontsTTF(tmp[6]);
		this.setFontsColor(tmp[7]);
	}

	public String getText() {
		return text;
	}

	
	public String getFontsColor() {
		return fontsColor;
	}

	public void setFontsColor(String fontsColor) {
		this.fontsColor = fontsColor;
	}

	public int getFontSize() {
		return fontSize;
	}

	public void setFontSize(int fontSize) {
		this.fontSize = fontSize;
	}

	public String getFontsTTF() {
		return fontsTTF;
	}

	@Override
	public String toString() {
		return "TextInfo [text=" + text + ", xPos=" + xPos + ", yPos=" + yPos
				+ ", width=" + width + ", height=" + height + ", fontSize="
				+ fontSize + ", fontsTTF=" + fontsTTF + ", fontsColor="
				+ fontsColor + "]";
	}

	public void setFontsTTF(String fontsTTF) {
		this.fontsTTF = fontsTTF;
	}

	public void setText(String text) {
		this.text = text;
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

}
