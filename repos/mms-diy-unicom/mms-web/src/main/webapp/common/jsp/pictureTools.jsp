<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<head>
<%
	String realPath = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/"; 
	String ctx = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	session.setAttribute("realPath",realPath);
	session.setAttribute("ctx",ctx);
	java.util.Properties prop = System.getProperties();		
	String os = prop.getProperty("os.name");		
	System.out.println(os);
	//最后合成的图片的导出地址
	String exportTheEndPricture = request.getSession().getServletContext().getRealPath("download/quotations/")+ java.io.File.separator;
	
	if(os.startsWith("win") || os.startsWith("Win")) {//windows操作系统
		exportTheEndPricture = exportTheEndPricture.replaceAll("\\\\","//");
	} else {	//linux
		exportTheEndPricture = exportTheEndPricture.replaceAll("\\\\","/");
	}
	try {
	      //读取第一张图片
	      File fileOne = new File("F:/MyPhoTo/gerfgreger.jpg");
	      BufferedImage ImageOne = ImageIO.read(fileOne);
	      int width = ImageOne.getWidth();//图片宽度
	      int height = ImageOne.getHeight();//图片高度
	      System.out.println("width:" +width +"    "+"height:"+height);
	      //从图片中读取RGB
	      int[] ImageArrayOne = new int[width*height];
	      ImageArrayOne = ImageOne.getRGB(0,0,width,height,ImageArrayOne,0,width);
	      //对第二张图片做相同的处理
	      File fileTwo = new File("F:/MyPhoTo/ws.jpg");
	      BufferedImage ImageTwo = ImageIO.read(fileTwo);
	      int width1 = ImageTwo.getWidth();//图片宽度
	      int height1 = ImageTwo.getHeight();//图片高度
	      System.out.println("width1:" +width1 +"    "+"height1:"+height1);
	      int[] ImageArrayTwo = new int[width1*height1];
	      ImageArrayTwo = ImageTwo.getRGB(0,0,width1,height1,ImageArrayTwo,0,width1);
	      //生成新图片
	      BufferedImage ImageNew = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
	      ImageNew.setRGB(0,0,width,height,ImageArrayOne,0,width);//设置左半部分的RGB
	      ImageNew.setRGB(40,50,width1,height1,ImageArrayTwo,0,width1);//设置右半部分的RGB
	      File outFile = new File("F:/MyPhoTo/girlfriend.jpg");
	      ImageIO.write(ImageNew, "jpg", outFile);//写图片
	    } catch(Exception e) {
	      e.printStackTrace();
	    }
%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>