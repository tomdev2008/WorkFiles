package com.unicom.mms.cms.service.ipml;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.cms.dao.CommonDAO;
import com.unicom.mms.cms.dao.NewbillboardDAO;
import com.unicom.mms.cms.service.NewbillboardService;
import com.unicom.mms.common.BlankUtil;
import com.unicom.mms.entity.TbNewBillboard;
import com.unicom.mms.entity.TbTemplateCard;

/**
 * 
* 功能描述:最新推荐管理业务逻辑处理类
* @author chenliang 新增日期：2013-1-14
* @since mms-cms-unicom
 */
@Service("newbillboardService")
public class NewbillboardServiceImpl extends CommonServiceImpl<TbNewBillboard> implements NewbillboardService {
	public static Logger log = Logger.getLogger(NewbillboardServiceImpl.class);
	
	@Autowired(required = true)
	public NewbillboardDAO newbillboardDAO;

	@Override
	public CommonDAO<TbNewBillboard> getBindDao() {
		return newbillboardDAO;
	}

	@Override
	public void addNewBillBoard(String[] ids) {
		if(!BlankUtil.isBlank(ids) && ids.length==10){
			
			int[] pkids = new int[ids.length];
			for (int i = 0; i < ids.length; i++) {
				pkids[i] = Integer.parseInt(ids[i]);
			}
			
			//先删除之前的最新推荐
			deleteAll();
			//设这最新推荐
			TbNewBillboard newBillboardEntity = new TbNewBillboard();
			TbTemplateCard cardEntity1 = new TbTemplateCard();
			cardEntity1.setId(pkids[0]);
			newBillboardEntity.setTop1(cardEntity1);
			
			TbTemplateCard cardEntity2 = new TbTemplateCard();
			cardEntity2.setId(pkids[1]);
			newBillboardEntity.setTop2(cardEntity2);
			
			TbTemplateCard cardEntity3 = new TbTemplateCard();
			cardEntity3.setId(pkids[2]);
			newBillboardEntity.setTop3(cardEntity3);
			
			TbTemplateCard cardEntity4 = new TbTemplateCard();
			cardEntity4.setId(pkids[3]);
			newBillboardEntity.setTop4(cardEntity4);
			
			TbTemplateCard cardEntity5 = new TbTemplateCard();
			cardEntity5.setId(pkids[4]);
			newBillboardEntity.setTop5(cardEntity5);
			
			TbTemplateCard cardEntity6 = new TbTemplateCard();
			cardEntity6.setId(pkids[5]);
			newBillboardEntity.setTop6(cardEntity6);
			
			TbTemplateCard cardEntity7 = new TbTemplateCard();
			cardEntity7.setId(pkids[6]);
			newBillboardEntity.setTop7(cardEntity7);
			
			TbTemplateCard cardEntity8 = new TbTemplateCard();
			cardEntity8.setId(pkids[7]);
			newBillboardEntity.setTop8(cardEntity8);
			
			TbTemplateCard cardEntity9 = new TbTemplateCard();
			cardEntity9.setId(pkids[8]);
			newBillboardEntity.setTop9(cardEntity9);
			
			TbTemplateCard cardEntity10 = new TbTemplateCard();
			cardEntity10.setId(pkids[9]);
			newBillboardEntity.setTop10(cardEntity10);
			
			newbillboardDAO.save(newBillboardEntity);
		}else{
			log.info("参数不对.");
		}
	}
	
	/**
	 * 
	* 方法用途和描述: 删除所有的最新推荐
	* @author chenliang 新增日期：2013-6-18
	* @since mms-cms
	 */
	private void deleteAll(){
		String hql = " delete from TbNewBillboard ";
		int result = newbillboardDAO.executeByHQL(hql);
	}
	
	/**
	 * 分页查询
	 */
//	@Override
//	public Page<TbNewBillboard> findByPage(TbNewBillboard entity,
//			Page<TbNewBillboard> pageInfo) {
//		log.info("entity.toString:"+entity.toString());
//		StringBuffer hql =  new StringBuffer(" from TbNewBillboard tu ");
//		Page<TbNewBillboard> newbillList = newbillboardDAO.findByPage(pageInfo, hql.toString());
//		log.info("newbillList"+newbillList);
//		return newbillList;
//	}
}
