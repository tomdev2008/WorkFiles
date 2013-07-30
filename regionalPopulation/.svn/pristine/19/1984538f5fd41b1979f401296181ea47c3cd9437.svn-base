package kxcom.hd.common;

import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.PreparedStatement;

public class PersonService {
	/**
	 * 经度和纬度都是100公里 一个纬度，广州位于赤道这里，
	 * 通过半径和选点 确定该范围内人口的性别数据 
	 * @param jin     用户选定一个地点的经度和纬度
	 * @param wei
	 * @param r
	 * @return   男人数目:女人数目
	 * @throws Exception 
	 */
	public static String SexNum(double jin,double wei,int r) throws Exception{
		double i=r/100;
		String sql="SELECT count(*) as sex_num ,'man' as sex from tb_user where sex=0 and "+
				"longitude<=? and latitude<=? and  longitude>=?  and  latitude>=? union ALL SELECT count(*) as sex_num ,'man' as sex from tb_user where sex=1 and  "+
				"longitude<=? and latitude<=? and  longitude>=?  and  latitude>=? ";
		Connection conn=DBManager.getInstance().getConnection("proxool");
		PreparedStatement psmt=(PreparedStatement) conn.prepareStatement(sql);
		psmt.setString(1, String.valueOf(jin+i));
		psmt.setString(2, String.valueOf(wei+i));
		psmt.setString(3, String.valueOf(jin-i));
		psmt.setString(4, String.valueOf(wei-i));
		psmt.setString(5, String.valueOf(jin+i));
		psmt.setString(6, String.valueOf(wei+i));
		psmt.setString(7, String.valueOf(jin-i));
		psmt.setString(8, String.valueOf(wei-i));
		ResultSet rs=psmt.executeQuery();
		StringBuffer buffer=new StringBuffer();
		while(rs.next()){
			buffer.append(rs.getString(1));
			buffer.append(":");
		}
		System.out.println("buffer:"+buffer.toString());
		return buffer.substring(0, buffer.length()-1).toString();
		
	}
	/**
	 * 通过半径和选点 确定该范围内人口的固定人口和流动人口数据
	 * @param jin   
	 * @param wei
	 * @param r
	 * @return  固定人口数据：工作人口数目
	 * @throws Exception 
	 */
	public static String CategoryNum(double jin,double wei,int r) throws Exception{
		double i=r/100;
		String sql="SELECT count(*) as sex_num ,'man' as sex from tb_user where state=0 and "+
				"longitude<=? and latitude<=? and  longitude>=?  and  latitude>=? union ALL SELECT count(*) as sex_num ,'man' as sex from tb_user where state=1 and  "+
				"longitude<=? and latitude<=? and  longitude>=?  and  latitude>=? ";
		Connection conn=DBManager.getInstance().getConnection("proxool");
		PreparedStatement psmt=(PreparedStatement) conn.prepareStatement(sql);
		psmt.setString(1, String.valueOf(jin+i));
		psmt.setString(2, String.valueOf(wei+i));
		psmt.setString(3, String.valueOf(jin-i));
		psmt.setString(4, String.valueOf(wei-i));
		psmt.setString(5, String.valueOf(jin+i));
		psmt.setString(6, String.valueOf(wei+i));
		psmt.setString(7, String.valueOf(jin-i));
		psmt.setString(8, String.valueOf(wei-i));
		ResultSet rs=psmt.executeQuery();
		StringBuffer buffer=new StringBuffer();
		while(rs.next()){
			buffer.append(rs.getString(1));
			buffer.append(":");
		}
		return buffer.substring(0, buffer.length()-1).toString();
	}
	
	public static void main(String[] args) throws Exception {
		System.out.println(CategoryNum(112.4,22.5,100));
	}
}
