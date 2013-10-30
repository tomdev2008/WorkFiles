package cn.com.mmsweb.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbSendMmsQueue;

import cn.com.mmsweb.dao.CommonDAO;
import cn.com.mmsweb.dao.SendMmsQueueDAO;
import cn.com.mmsweb.service.SendMmsQueueService;

@Service("sendMmsQueueService")
public class SendMmsQueueServiceImpl extends CommonServiceImpl<TbSendMmsQueue> implements SendMmsQueueService{

	private static Logger log = Logger.getLogger(SendMmsQueueServiceImpl.class);
	@Autowired(required = true)
	private SendMmsQueueDAO sendMmsQueueDAO;
	@Override
	public CommonDAO<TbSendMmsQueue> getBindDao() {
		return sendMmsQueueDAO;
	}
	@Override
	public void batchSave(List<TbSendMmsQueue> queuelist) {
		for (int i = 0; i < queuelist.size(); i++) {
			TbSendMmsQueue entity = queuelist.get(i);
			sendMmsQueueDAO.save(entity);
		}
	}
	
}
