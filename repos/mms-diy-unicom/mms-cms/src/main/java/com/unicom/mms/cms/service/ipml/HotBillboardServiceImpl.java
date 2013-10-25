package com.unicom.mms.cms.service.ipml;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.HotbillboardDAO;
import com.unicom.mms.cms.service.HotBillboardService;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.entity.TbHotBillboard;
import com.unicom.mms.entity.TbTemplateCard;

/**
 * 
* 功能描述:最热推荐管理业务逻辑处理类
* @author lujia 新增日期：2013-3-3
* @since mms-cms-unicom
 */
@Service("hotBillboardService")
public class HotBillboardServiceImpl extends CommonServiceImpl<TbHotBillboard> implements HotBillboardService{
	public static Logger log = Logger.getLogger(HotBillboardServiceImpl.class);

	@Autowired(required = true)
	private HotbillboardDAO hotbillboardDAO;
	
	
	public HotbillboardDAO getHotbillboardDAO() {
		return hotbillboardDAO;
	}


	public void setHotbillboardDAO(HotbillboardDAO hotbillboardDAO) {
		this.hotbillboardDAO = hotbillboardDAO;
	}


	@Override
	public CommonDAO<TbHotBillboard> getBindDao() {
		return hotbillboardDAO;
	}


	@Override
	public void addHotBillboard(String[] ids) {
		
		if(!BlankUtil.isBlank(ids) && ids.length==10){
			int[] pkids = new int[ids.length];
			for (int i = 0; i < ids.length; i++) {
				pkids[i] = Integer.parseInt(ids[i]);
			}
			//先删除之前的最热推荐
			deleteAll();
			//设置最热推荐
			TbHotBillboard hotbillboardEntity = new TbHotBillboard();
			
			TbTemplateCard cardEntity1 = new TbTemplateCard();
			cardEntity1.setId(pkids[0]);
			hotbillboardEntity.setTop1(cardEntity1);
			
			TbTemplateCard cardEntity2 = new TbTemplateCard();
			cardEntity2.setId(pkids[1]);
			hotbillboardEntity.setTop2(cardEntity2);
			
			TbTemplateCard cardEntity3 = new TbTemplateCard();
			cardEntity3.setId(pkids[2]);
			hotbillboardEntity.setTop3(cardEntity3);
			
			TbTemplateCard cardEntity4 = new TbTemplateCard();
			cardEntity4.setId(pkids[3]);
			hotbillboardEntity.setTop4(cardEntity4);
			
			TbTemplateCard cardEntity5 = new TbTemplateCard();
			cardEntity5.setId(pkids[4]);
			hotbillboardEntity.setTop5(cardEntity5);
			
			TbTemplateCard cardEntity6 = new TbTemplateCard();
			cardEntity6.setId(pkids[5]);
			hotbillboardEntity.setTop6(cardEntity6);
			
			TbTemplateCard cardEntity7 = new TbTemplateCard();
			cardEntity7.setId(pkids[6]);
			hotbillboardEntity.setTop7(cardEntity7);
			
			TbTemplateCard cardEntity8 = new TbTemplateCard();
			cardEntity8.setId(pkids[7]);
			hotbillboardEntity.setTop8(cardEntity8);
			
			TbTemplateCard cardEntity9 = new TbTemplateCard();
			cardEntity9.setId(pkids[8]);
			hotbillboardEntity.setTop9(cardEntity9);
			
			TbTemplateCard cardEntity10 = new TbTemplateCard();
			cardEntity10.setId(pkids[9]);
			hotbillboardEntity.setTop10(cardEntity10);
			
			hotbillboardDAO.save(hotbillboardEntity);
		}else{
			log.info("最热推荐必须设置10条。");
		}
		
	}
	
	private void deleteAll(){
		String hql = " delete from TbHotBillboard ";
		int result = hotbillboardDAO.executeByHQL(hql);
	}

}
