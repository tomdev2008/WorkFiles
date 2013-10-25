package cn.com.mmsweb.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.NewBillBoardDAO;
import cn.com.mmsweb.service.NewBillBoardService;

import com.unicom.mms.entity.TbNewBillboard;

@Service("newBillBoardService")
public class NewBillBoardServiceImpl extends CommonServiceImpl<TbNewBillboard> implements NewBillBoardService{
	private static Logger log = Logger.getLogger(NewBillBoardServiceImpl.class);
	
	@Autowired(required = true)
	private NewBillBoardDAO newBillBoardDAO;

	@Override
	public CommonDAO<TbNewBillboard> getBindDao() {
		return newBillBoardDAO;
	}
	
	
}
