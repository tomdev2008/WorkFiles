package org.jeecgframework.core.util.excel;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.RichTextString;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.jeecgframework.core.annotation.excel.Excel;
import org.jeecgframework.core.annotation.excel.ExcelCollection;
import org.jeecgframework.core.annotation.excel.ExcelEntity;
import org.jeecgframework.core.annotation.excel.ExcelTarget;
import org.jeecgframework.core.util.excel.entity.ComparatorExcelField;
import org.jeecgframework.core.util.excel.entity.ExcelExportEntity;
import org.jeecgframework.core.util.excel.entity.ExcelTitle;

/**
 * excel 导出工具类
 * 
 * @author jueyue
 * 
 */
public class ExcelExportUtil {
	/**
	 * 一个excel 创建多个sheet
	 * 
	 * @param list
	 *            多个Map key title 对应表格Title key entity 对应表格对应实体 key data
	 *            Collection 数据
	 * @return
	 */
	public static HSSFWorkbook exportExcel(List<Map<String, Object>> list) {
		HSSFWorkbook workbook = new HSSFWorkbook();
		for (Map<String, Object> map : list) {
			createSheetInUserModel2File(workbook,
					(ExcelTitle) map.get("title"),
					(Class<?>) map.get("entity"),
					(Collection<?>) map.get("data"));
		}
		return workbook;
	}

	/**
	 * 
	 * @param entity
	 *            表格标题属性
	 * @param pojoClass
	 *            Excel对象Class
	 * @param dataSet
	 *            Excel对象数据List
	 * @param out
	 *            输出流
	 */
	public static HSSFWorkbook exportExcel(ExcelTitle entity,
			Class<?> pojoClass, Collection<?> dataSet) {
		HSSFWorkbook workbook = new HSSFWorkbook();
		createSheetInUserModel2File(workbook, entity, pojoClass, dataSet);
		return workbook;
	}

	private static void createSheetInUserModel2File(HSSFWorkbook workbook,
			ExcelTitle entity, Class<?> pojoClass, Collection<?> dataSet) {
		try {
			Sheet sheet = workbook.createSheet(entity.getSheetName());
			Drawing patriarch = sheet.createDrawingPatriarch(); 
			List<ExcelExportEntity> excelParams = new ArrayList<ExcelExportEntity>();
			// 得到所有字段
			Field fileds[] = getClassFields(pojoClass);
			ExcelTarget etarget = pojoClass.getAnnotation(ExcelTarget.class);
			String targetId = null;
			if (etarget != null) {
				targetId = etarget.id();
			}
			getAllExcelField(targetId, fileds, excelParams, pojoClass, null);
			sortAllParams(excelParams);
			int index = 0;
			int feildWidth = getFieldWidth(excelParams);
			if (entity.getTitle() != null) {
				int i =  createHeaderRow(entity, sheet, workbook, feildWidth);
				sheet.createFreezePane(0, 2+i, 0, 2+i);
				index += i;
			} else {
				sheet.createFreezePane(0, 2, 0, 2);
			}
			createTitleRow(entity,sheet, workbook, index, excelParams);
			index += 2;
			setCellWith(excelParams, sheet);
			Iterator<?> its = dataSet.iterator();
			while (its.hasNext()) {
				Object t = its.next();
				index += createCells(patriarch,index, t, excelParams, sheet, workbook);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 对字段根据用户设置排序
	 */
	private static void sortAllParams(List<ExcelExportEntity> excelParams) {
		Collections.sort(excelParams,new ComparatorExcelField());
		for(ExcelExportEntity entity:excelParams){
			if(entity.getList() != null){
				Collections.sort(entity.getList(),new ComparatorExcelField());
			}
		}
	}

	/**
	 * 创建 最主要的 Cells
	 * @throws Exception
	 */
	private static int createCells(Drawing patriarch, int index, Object t,
			List<ExcelExportEntity> excelParams, Sheet sheet,
			HSSFWorkbook workbook) throws Exception {
		ExcelExportEntity entity;
		Row row = sheet.createRow(index);
		row.setHeight((short) 350);
		int maxHeight = 1, cellNum = 0;
		for (int k = 0, paramSize = excelParams.size(); k < paramSize; k++) {
			entity = excelParams.get(k);
			if (entity.getList() != null) {
				Collection<?> list = (Collection<?>) entity.getGetMethod()
						.invoke(t, new Object[] {});
				int listC = 0;
				for (Object obj : list) {
					createListCells(patriarch,index + listC, cellNum, obj,
							entity.getList(), sheet, workbook);
					listC++;
				}
				cellNum += entity.getList().size();
				if (list.size() > maxHeight) {
					maxHeight = list.size();
				}
			} else {
				Object value = entity.getGetMethods() != null ? getFieldBySomeMethod(
						entity.getGetMethods(), t) : entity.getGetMethod()
						.invoke(t, new Object[] {});
				if (entity.getType() == 1) {
					createStringCell(row, cellNum++,
							value == null ? "" : value.toString(),
							index % 2 == 0 ? getTwoStyle(workbook,entity)
									: getOneStyle(workbook,entity),entity);
				} else {
					createImageCell(patriarch,entity, row, cellNum++, value == null ? ""
							: value.toString());
				}
			}
		}
		//合并需要合并的单元格
		cellNum = 0;
		for(int k = 0, paramSize = excelParams.size(); k < paramSize; k++){
			entity = excelParams.get(k);
			if (entity.getList() != null) {
				cellNum += entity.getList().size();
			}else if (entity.isNeedMerge()) {
				sheet.addMergedRegion(new CellRangeAddress(index, index + maxHeight-1, cellNum,
						cellNum));
				cellNum++;
			}
		}
		return maxHeight;

	}

	/**
	 * 创建List之后的各个Cells
	 */
	private static void createListCells(Drawing patriarch, int index, int cellNum, Object obj,
			List<ExcelExportEntity> excelParams, Sheet sheet,
			HSSFWorkbook workbook) throws Exception {
		ExcelExportEntity entity;
		Row row;
		if(sheet.getRow(index)==null){
			row = sheet.createRow(index);
			row.setHeight((short) 350);
		}else{
			row = sheet.getRow(index);
		}
		for (int k = 0, paramSize = excelParams.size(); k < paramSize; k++) {
			entity = excelParams.get(k);
			Object value = entity.getGetMethods() != null ? getFieldBySomeMethod(
					entity.getGetMethods(), obj) : entity.getGetMethod()
					.invoke(obj, new Object[] {});
			if (entity.getType() == 1) {
				createStringCell(row, cellNum++,
						value == null ? "" : value.toString(),
								row.getRowNum() % 2 == 0 ? getTwoStyle(workbook,entity)
										: getOneStyle(workbook,entity),entity);
			}else {
				createImageCell(patriarch,entity, row, cellNum++, value == null ? ""
						: value.toString());
			}
		}
	}

	/**
	 * 多个反射获取值
	 * 
	 * @param list
	 * @param t
	 * @return
	 * @throws Exception
	 */
	private static Object getFieldBySomeMethod(List<Method> list, Object t) {
		try{
			for (Method m : list) {
				t = m.invoke(t, new Object[] {});
			}
		}catch(Exception e){
			//e.printStackTrace();
		}
		return t;
	}

	private static void setCellWith(List<ExcelExportEntity> excelParams,
			Sheet sheet) {
		int index = 0;
		for (int i = 0; i < excelParams.size(); i++) {
			if (excelParams.get(i).getList() != null) {
				List<ExcelExportEntity> list = excelParams.get(i).getList();
				for (int j = 0; j < list.size(); j++) {
					sheet.setColumnWidth(index, 256 * list.get(j).getWidth());
					index++;
				}
			} else {
				sheet.setColumnWidth(index, 256 * excelParams.get(i).getWidth());
				index++;
			}
		}
	}

	/**
	 * 创建表头
	 * @param entity 
	 * 
	 * @param index
	 */
	private static void createTitleRow(ExcelTitle title, Sheet sheet, HSSFWorkbook workbook,
			int index, List<ExcelExportEntity> excelParams) {
		Row row = sheet.createRow(index);
		Row row1 = sheet.createRow(index + 1);
		row.setHeight((short) 450);
		int cellIndex = 0;
		CellStyle titleStyle = getTitleStyle(workbook,title);
		for (int i = 0, exportFieldTitleSize = excelParams.size(); i < exportFieldTitleSize; i++) {
			ExcelExportEntity entity = excelParams.get(i);
			createStringCell(row, cellIndex, entity.getName(), titleStyle,entity);
			if (entity.getList() != null) {
				List<ExcelExportEntity> sTitel = entity.getList();
				sheet.addMergedRegion(new CellRangeAddress(index, index,cellIndex,cellIndex
						+ sTitel.size() - 1));
				for (int j = 0, size = sTitel.size(); j < size; j++) {
					createStringCell(row1, cellIndex, sTitel.get(j).getName(),
							titleStyle,entity);
					cellIndex++;
				}
			} else {
				sheet.addMergedRegion(new CellRangeAddress(index, index + 1, cellIndex,
						cellIndex));
				cellIndex++;
			}
		}

	}

	/**
	 * 创建文本类型的Cell
	 * 
	 * @param row
	 * @param index
	 * @param text
	 * @param style
	 * @param entity 
	 */
	private static void createStringCell(Row row, int index, String text,
			CellStyle style, ExcelExportEntity entity) {
		Cell cell = row.createCell(index);
		RichTextString Rtext = new HSSFRichTextString(text);
		cell.setCellValue(Rtext);
		cell.setCellStyle(style);
	}

	/**
	 * 图片类型的Cell
	 * @param patriarch 
	 * 
	 * @param entity
	 * @param row
	 * @param i
	 * @param string
	 */
	private static void createImageCell(Drawing patriarch, ExcelExportEntity entity, Row row,
			int i, String string) {
		row.setHeight((short) (50*entity.getHeight()));
		row.createCell(i);
		HSSFClientAnchor anchor = new HSSFClientAnchor(
		          0,0,0,0, (short) i, row.getRowNum(),
		          (short) (i+1),row.getRowNum()+1);
		ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
		BufferedImage bufferImg;
		try {
			String path = ExcelExportUtil.class.getClassLoader().getResource("") +string;
			path = path.replace("WEB-INF/classes/","");
			path = path.replace("file:/","");
			bufferImg = ImageIO.read(
					new File(path));
			ImageIO.write(bufferImg,string.substring(string.indexOf(".")+1,string.length()),byteArrayOut);
		} catch (IOException e) {
			e.printStackTrace();
		}
		patriarch.createPicture(anchor,
				row.getSheet().getWorkbook().addPicture(byteArrayOut.toByteArray(),HSSFWorkbook.PICTURE_TYPE_JPEG));

	}

	/**
	 * 创建 表头
	 * 
	 * @param title
	 * @param sheet
	 * @param workbook
	 * @param feildWidth
	 */
	private static int createHeaderRow(ExcelTitle entity, Sheet sheet,
			HSSFWorkbook workbook, int feildWidth) {
		Row row = sheet.createRow(0);
		row.setHeight((short) 900);
		createStringCell(row, 0, entity.getTitle(), getHeaderStyle(workbook,entity),null);
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, feildWidth));
		if(entity.getSecondTitle()!=null){
			row = sheet.createRow(1);
			HSSFCellStyle style = workbook.createCellStyle();
			style.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
			createStringCell(row, 0, entity.getSecondTitle(), style,null);
			sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, feildWidth));
			return 2;
		}
		return 1;
	}

	/**
	 * 获取导出报表的字段总长度
	 * 
	 * @param exportFieldTitle
	 * @param secondTitle
	 * @return
	 */
	private static int getFieldWidth(List<ExcelExportEntity> excelParams) {
		int length = -1;// 从0开始计算单元格的
		for (ExcelExportEntity entity : excelParams) {
			length += entity.getList() != null ? entity.getList().size() : 1;
		}
		return length;
	}

	/**
	 * 获取需要导出的全部字段
	 * 
	 * @param targetId
	 *            目标ID
	 * @param filed
	 * @throws Exception
	 */
	private static void getAllExcelField(String targetId, Field[] fields,
			List<ExcelExportEntity> excelParams, Class<?> pojoClass,
			List<Method> getMethods) throws Exception {
		// 遍历整个filed
		ExcelExportEntity excelEntity;
		for (int i = 0; i < fields.length; i++) {
			Field field = fields[i];
			// 先判断是不是collection,在判断是不是java自带对象,之后就是我们自己的对象了
			if(isNotUserExcelUserThis(field, targetId)){continue;}
			if (isCollection(field.getType())) {
				ExcelCollection excel = field
						.getAnnotation(ExcelCollection.class);
				ParameterizedType pt = (ParameterizedType) field
						.getGenericType();
				Class<?> clz = (Class<?>) pt.getActualTypeArguments()[0];
				List<ExcelExportEntity> list = new ArrayList<ExcelExportEntity>();
				getExcelFieldList(targetId, getClassFields(clz), clz,
						list, null);
				excelEntity = new ExcelExportEntity();
				excelEntity.setName(getExcelName(excel.exportName(),
						targetId));
				excelEntity.setOrderNum(getCellOrder(excel.orderNum(), targetId));
				excelEntity.setGetMethod(getMethod(field.getName(),
						pojoClass));
				excelEntity.setList(list);
				excelParams.add(excelEntity);
			} else if (isJavaClass(field)) {
				Excel excel = field.getAnnotation(Excel.class);
				excelEntity = new ExcelExportEntity();
				excelEntity.setType(excel.exportType());
				getExcelField(targetId, field, excelEntity, excel,
						pojoClass);
				if (getMethods != null) {
					List<Method> newMethods = new ArrayList<Method>();
					newMethods.addAll(getMethods);
					newMethods.add(excelEntity.getGetMethod());
					excelEntity.setGetMethods(newMethods);
				}
				excelParams.add(excelEntity);
			} else {
				List<Method> newMethods = new ArrayList<Method>();
				if (getMethods != null) {
					newMethods.addAll(getMethods);
				}
				newMethods.add(getMethod(field.getName(), pojoClass));
				getAllExcelField(targetId, getClassFields(field.getType()), excelParams, field.getType(),
						newMethods);
			}
		}
	}
	
	/**
	 * 判断在这个单元格显示的名称
	 * 
	 * @param exportName
	 * @param targetId
	 * @return
	 */
	private static String getExcelName(String exportName, String targetId) {
		if (exportName.indexOf(",") < 0) {
			return exportName;
		}
		String[] arr = exportName.split(",");
		for (String str : arr) {
			if (str.indexOf(targetId) != -1) {
				return str.split("_")[0];
			}
		}
		return null;
	}
	/**
	 * 获取这个字段的顺序
	 * @param orderNum
	 * @param targetId
	 * @return
	 */
	private static int getCellOrder(String orderNum, String targetId) {
		if(isInteger(orderNum)||targetId == null){
			return Integer.valueOf(orderNum);
		}
		String[] arr = orderNum.split(",");
		for (String str : arr) {
			if (str.indexOf(targetId) != -1) {
				return Integer.valueOf(str.split("_")[0]);
			}
		}
		return 0;
	}
	
	 /**
     * 判断字符串是否是整数
     */
    public static boolean isInteger(String value) {
        try {
            Integer.parseInt(value);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

	/**
	 * 判断是不是使用
	 * 
	 * @param exportName
	 * @param targetId
	 * @return
	 */
	private static boolean isUseInThis(String exportName, String targetId) {
		return targetId == null || exportName.equals("")
				|| exportName.indexOf(",") < 0
				|| exportName.indexOf(targetId) != -1;
	}
	
	private static boolean isNotUserExcelUserThis(Field field, String targetId) {
		boolean boo = true;
		
		if(boo&&field.getAnnotation(ExcelCollection.class)!=null
				&&isUseInThis(field.getAnnotation(ExcelCollection.class).exportName(),targetId)){
			boo = false;
		}else if(boo&&field.getAnnotation(Excel.class)!=null
				&&isUseInThis(field.getAnnotation(Excel.class).exportName(),targetId)){
			boo = false;
		}else if(boo&&field.getAnnotation(ExcelEntity.class)!=null
				&&isUseInThis(field.getAnnotation(ExcelEntity.class).exportName(),targetId)){
			boo = false;
		}
		return boo;
	}

	private static void getExcelFieldList(String targetId, Field[] fields,
			Class<?> pojoClass, List<ExcelExportEntity> list,
			List<Method> getMethods) throws Exception {
		ExcelExportEntity excelEntity;
		for (int i = 0; i < fields.length; i++) {
			Field field = fields[i];
			if(isNotUserExcelUserThis(field, targetId)){continue;}
			if (isJavaClass(field)) {
				Excel excel = field.getAnnotation(Excel.class);
				excelEntity = new ExcelExportEntity();
				getExcelField(targetId, field, excelEntity, excel,
						pojoClass);
				excelEntity.setType(excel.exportType());
				if (getMethods != null) {
					List<Method> newMethods = new ArrayList<Method>();
					newMethods.addAll(getMethods);
					newMethods.add(excelEntity.getGetMethod());
					excelEntity.setGetMethods(newMethods);
				}
				list.add(excelEntity);
			} else {
				List<Method> newMethods = new ArrayList<Method>();
				if (getMethods != null) {
					newMethods.addAll(getMethods);
				}
				newMethods.add(getMethod(field.getName(), pojoClass));
				getExcelFieldList(targetId, getClassFields(field.getType()), field.getType(), list,
						newMethods);
			}
		}
	}

	public static void getExcelField(String targetId, Field field,
			ExcelExportEntity excelEntity, Excel excel, Class<?> pojoClass)
			throws Exception {
		excelEntity.setName(getExcelName(excel.exportName(), targetId));
		excelEntity.setWidth(excel.exportFieldWidth());
		excelEntity.setHeight(excel.exportFieldHeight());
		excelEntity.setNeedMerge(excel.needMerge());
		excelEntity.setOrderNum(getCellOrder(excel.orderNum(),targetId));
		excelEntity.setWrap(excel.isWrap());
		String fieldname = field.getName();
		excelEntity.setGetMethod(getMethod(fieldname, pojoClass));
		if (excel.exportConvertSign() == 1) {
			StringBuffer getConvertMethodName = new StringBuffer("convertGet");
			getConvertMethodName
					.append(fieldname.substring(0, 1).toUpperCase());
			getConvertMethodName.append(fieldname.substring(1));
			Method getConvertMethod = pojoClass.getMethod(
					getConvertMethodName.toString(), new Class[] {});
			excelEntity.setGetMethod(getConvertMethod);
		}
	}

	private static boolean isJavaClass(Field field) {
		Class<?> fieldType = field.getType();
		boolean isBaseClass = false;
		if(fieldType.isArray()){
			isBaseClass = false;
		}else if (fieldType.isPrimitive()||fieldType.getPackage()==null
				|| fieldType.getPackage().getName().equals("java.lang")
				|| fieldType.getPackage().getName().equals("java.math")
				|| fieldType.getPackage().getName().equals("java.util")) {
			isBaseClass =  true;
		}
		return isBaseClass;
	}

	/**
	 * 字段说明的Style
	 * @param workbook
	 * @return
	 */
	public static HSSFCellStyle getTitleStyle(HSSFWorkbook workbook, ExcelTitle entity) {
		HSSFCellStyle titleStyle = workbook.createCellStyle();
		titleStyle.setFillForegroundColor(entity.getHeaderColor()); // 填充的背景颜色
		titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		titleStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		titleStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND); // 填充图案
		titleStyle.setWrapText(true);
		return titleStyle;
	}
	/**
	 * 表明的Style
	 * @param workbook
	 * @return
	 */
	public static HSSFCellStyle getHeaderStyle(HSSFWorkbook workbook, ExcelTitle entity) {
		HSSFCellStyle titleStyle = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setFontHeightInPoints((short) 24);
		titleStyle.setFont(font);
		titleStyle.setFillForegroundColor(entity.getColor()); 
		titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		titleStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		return titleStyle;
	}

	public static HSSFCellStyle getTwoStyle(HSSFWorkbook workbook, ExcelExportEntity entity) {
		HSSFCellStyle style = workbook.createCellStyle();
		style.setBorderLeft((short) 1); // 左边框
		style.setBorderRight((short) 1); // 右边框
		style.setBorderBottom((short) 1);
		style.setBorderTop((short) 1);
		style.setFillForegroundColor(HSSFColor.LIGHT_TURQUOISE.index); // 填充的背景颜色
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND); // 填充图案
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		if(entity.isWrap()){style.setWrapText(true);}
		return style;
	}

	public static HSSFCellStyle getOneStyle(HSSFWorkbook workbook, ExcelExportEntity entity) {
		HSSFCellStyle style = workbook.createCellStyle();
		style.setBorderLeft((short) 1); // 左边框
		style.setBorderRight((short) 1); // 右边框
		style.setBorderBottom((short) 1);
		style.setBorderTop((short) 1);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		if(entity.isWrap()){style.setWrapText(true);}
		return style;
	}

	
	/**
	 * 判断是不是集合的实现类
	 * @param clazz
	 * @return
	 */
	private static boolean isCollection(Class<?> clazz) {
		String colleciton = "java.util.Collection";
		Class<?>[] faces = clazz.getInterfaces();
		for (Class<?> face : faces) {
			if(face.getName().equals(colleciton)){
				return true;
			}else{
				if(face.getSuperclass()!= Object.class&&face.getSuperclass()!=null){
					return isCollection(face.getSuperclass());
				}
			}
		}
		if(clazz.getSuperclass()!= Object.class&&clazz.getSuperclass()!=null){
			return isCollection(clazz.getSuperclass());
		}
		return false;
	}

	private static Method getMethod(String name, Class<?> pojoClass)
			throws Exception {
		StringBuffer getMethodName = new StringBuffer("get");
		getMethodName.append(name.substring(0, 1).toUpperCase());
		getMethodName.append(name.substring(1));
		return pojoClass.getMethod(getMethodName.toString(), new Class[] {});
	}
	/**
	 * 获取class的 包括父类的
	 * @param type
	 * @return
	 */
	private static Field[] getClassFields(Class<?> clazz) {
		List<Field> list = new ArrayList<Field>();
		Field[] fields;
		do{
			fields = clazz.getDeclaredFields();
			for(int i = 0;i<fields.length;i++){
				list.add(fields[i]);
			}
			clazz = clazz.getSuperclass();
		}while(clazz!= Object.class&&clazz!=null);
		return list.toArray(fields);
	}
	

}
