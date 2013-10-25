package cn.com.mmsweb.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.HotBillBoardDAO;
import cn.com.mmsweb.service.HotBillBoardService;

import com.unicom.mms.entity.TbHotBillboard;

@Service("hotBillBoardService")
public class HotBillBoardServiceImpl extends CommonServiceImpl<TbHotBillboard> implements HotBillBoardService{
	private static Logger log = Logger.getLogger(HotBillBoardServiceImpl.class);
	
	@Autowired(required = true)
	private HotBillBoardDAO hotBillBoardDAO;

	@Override
	public CommonDAO<TbHotBillboard> getBindDao() {
		return hotBillBoardDAO;
	}
	
	
}
