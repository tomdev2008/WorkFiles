package cn.com.kxcomm.systemcenter.vm.api;

import org.apache.log4j.Logger;

import cn.com.kxcomm.systemcenter.Command;
import cn.com.kxcomm.systemcenter.ScriptCore;
import cn.com.kxcomm.systemcenter.vm.model.VmModel;

public class VmCore extends ScriptCore {

	private static final Logger LOGGER = Logger.getLogger(VmCore.class);
	
	public static class CreateVm implements Command<VmModel>{

		@Override
		public VmModel execute(String clientType) throws Exception {
			String createVm = "New-VM";
			executeScript(createVm);
			return null;
		}
		
	}
	
}
