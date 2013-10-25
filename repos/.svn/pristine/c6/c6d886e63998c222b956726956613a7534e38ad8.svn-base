package cn.com.mmsweb.service;

import java.rmi.RemoteException;
import java.text.ParseException;
import java.util.List;

import javax.xml.rpc.ServiceException;

import cn.com.common.Page;
import cn.com.mmsweb.vo.CardVo;
import cn.com.mmsweb.vo.TemplateCardtVo;

import com.unicom.mms.entity.TbTemplateCard;

public interface TemplateCardService extends CommonService<TbTemplateCard> {

	/**
	 * 
	* 方法用途和描述: 查找所有
	* @return
	* @author chenliang 新增日期：2013-4-18
	* @since mms-web
	 */
	public List<TemplateCardtVo> findAllTemplateCard(Page<TbTemplateCard> pageInfo);

	/**
	 * 
	* 方法用途和描述: 根据id查找模板明信片
	* @param id
	* @return
	* @author chenliang 新增日期：2013-4-19
	* @since mms-web
	 */
	public CardVo findById(Integer id);

	/**
	 * 
	* 方法用途和描述: 发送模板明星片
	* @param cardVo
	* @author chenliang 新增日期：2013-5-8
	* @since mms-web
	 */
	public void sendCardMessage(CardVo cardVo,String sender) throws ServiceException, ParseException, RemoteException;

	/**
	 * 
	* 方法用途和描述: 根据某种类型分页查询模板明信片
	* @param cardPage
	* @param templateCardType
	* @return
	* @author chenliang 新增日期：2013-5-11
	* @since mms-web
	 */
	public List<TemplateCardtVo> queryTemplateCard(Page<TbTemplateCard> cardPage, String templateCardType);

}
