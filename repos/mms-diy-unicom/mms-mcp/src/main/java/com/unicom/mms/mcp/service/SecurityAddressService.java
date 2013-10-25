package com.unicom.mms.mcp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unicom.mms.entity.TbSecurityAddress;
import com.unicom.mms.mcp.dao.SecurityAddressDAO;

@Service("securityAddressService")
public class SecurityAddressService {
	@Autowired(required = true)
	private SecurityAddressDAO securityAddressDAO;
	
	public boolean checkAccess(String ip){
		List<TbSecurityAddress> list = securityAddressDAO.findAll();
		System.out.println("************"+list.size());
		for(TbSecurityAddress tmp:list){
			if(!"mcp".equals(tmp.getPlatform())){
				continue;
			}
			if(ip.equals(tmp.getIpAdress())){
				if("Y".equals(tmp.getAllow())){
					return true;
				}
				if("N".equals(tmp.getAllow())){
					return false;
				}
			}
		}
		return false;
	}
}
