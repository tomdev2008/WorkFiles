package com.unicom.mms.cms.service.ipml;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.axis.session.Session;
import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.action.util.FileUtil;
import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.MdnTypeDAO;
import com.unicom.mms.cms.dao.PushMdnDAO;
import com.unicom.mms.cms.service.MdnTypeService;
import com.unicom.mms.cms.service.PushMdnService;
import com.unicom.mms.entity.TbMdnType;
import com.unicom.mms.entity.TbPushMdn;
import com.unicom.mms.entity.TbTemplateCard;

/**
 * 
 * 功能描述:推送号码管理
 * 
 * @author lujia 新增日期：2013-3-3
 * @since mms-cms-unicom
 */
@Service("pushMdnService")
public class PushMdnServiceImpl extends CommonServiceImpl<TbPushMdn> implements
		PushMdnService {
	public static Logger log = Logger.getLogger(PushMdnServiceImpl.class);

	@Autowired(required = true)
	private PushMdnDAO pushMdnDAO;
	@Autowired(required = true)
	private MdnTypeDAO mdnTypeDAO;

	@Override
	public CommonDAO<TbPushMdn> getBindDao() {
		return pushMdnDAO;
	}

	@Override
	public void savePushMdn(TbMdnType mdnType, Map<String, Object> map) {
		try {
			// 1、TXT文件上传到服务器
			File file = (File) map.get("file");
			String fileName = (String) map.get("fileName");
			String txtUrl = (String) map.get("txtUrl");
			FileUtil.bakTemplatesDoc(file, txtUrl, fileName, false, 0);

			// 2、读取txt文件,放入到list
			String encoding = "GBK";
			File txtfile = new File(txtUrl + File.separator + fileName);
			List<String> mdnList = new ArrayList<String>();
			if (txtfile.isFile() && txtfile.exists()) { // 判断文件是否存在
				InputStreamReader read = new InputStreamReader(new FileInputStream(txtfile),
						encoding);
				// 考虑到编码格式
				BufferedReader bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					mdnList.add(lineTxt);
				}
				read.close();
			} else {
				System.out.println("找不到指定的文件");
			}
			
			// 3、保存操作
			if(mdnList.size()>0){
				// 3.1、保存号码类型
				mdnTypeDAO.save(mdnType);
				mdnTypeDAO.flush();
				// 3.2、保存推送号码
				pushMdnDAO.saveMdn(mdnType, mdnList);
			}else{
				log.info("mdn txt is null.");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
