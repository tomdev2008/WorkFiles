package cn.com.mmsweb.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbSendedMmsRecs;

import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.SendRecsDAO;
import cn.com.mmsweb.service.SendRecsService;
import cn.com.mmsweb.vo.SendRecsVo;

@Service("sendRecsService")
public class SendRecsServiceImpl extends CommonServiceImpl<TbSendedMmsRecs> implements SendRecsService{

	private static Logger log = Logger.getLogger(SendRecsServiceImpl.class);
	@Autowired(required = true)
	private SendRecsDAO sendRecsDAO;
	@Override
	public CommonDAO<TbSendedMmsRecs> getBindDao() {
		return sendRecsDAO;
	}
	
	@Override
	 public List<SendRecsVo> queryByPage (int pageSize, int pageNow,String sponsor) {
	  return sendRecsDAO.queryByPage(pageSize, pageNow,sponsor);
	 }
	
	@Override
	 public int maxPage(int pageSize, int pageNow,String sponsor)
	 {
		 return sendRecsDAO.maxPage(pageSize, pageNow,sponsor);
	 }
}
