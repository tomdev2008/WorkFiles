package com.unicom.mms;

import java.io.File;
import java.io.FileInputStream;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;



public class ExcelView {
	public static void main(String[] args) {
		File f = new File("D:\\data.xlsx");
		try {
			XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(f));
			if(workbook!=null){
				XSSFSheet  sheet = workbook.getSheetAt(0);
				
				for(int i=0;i<sheet.getLastRowNum();i++){
					XSSFRow row = sheet.getRow(i);
					String bigPic = row.getCell(0).toString();
					System.out.println(bigPic);
					for(int j =0 ;j<row.getLastCellNum();j++){
						System.out.print(","+row.getCell(j));
					}
					System.out.println("\n");
				}
				System.out.println("ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
