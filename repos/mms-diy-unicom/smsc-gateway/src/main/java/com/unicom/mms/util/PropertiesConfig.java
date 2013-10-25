package com.unicom.mms.util;

import org.apache.commons.configuration.CompositeConfiguration;
import org.apache.commons.configuration.PropertiesConfiguration;
import org.apache.commons.configuration.reloading.FileChangedReloadingStrategy;
import org.apache.log4j.Logger;

public class PropertiesConfig {
	private static final Logger log = Logger.getLogger(PropertiesConfig.class);
	private CompositeConfiguration config;
	private String path;
	
	public PropertiesConfig(String path){
		this.path = path;
		load();
	}
	
	private void load(){
		try {
			config = new CompositeConfiguration();
			String propsFileName = PropertiesConfig.class.getResource(path).getFile();
			PropertiesConfiguration propsConfig = new PropertiesConfiguration();
			propsConfig.load(propsFileName);
			FileChangedReloadingStrategy propsReload = new FileChangedReloadingStrategy();
			propsReload.setRefreshDelay(600000L);
			propsConfig.setReloadingStrategy(propsReload);
			config.addConfiguration(propsConfig);
		} catch (Exception ex) {
			log.error("", ex);
		}
	}

	public CompositeConfiguration getConfig() {
		return config;
	}
	
	public String getString(String key){
		return config.getString(key);
	}
	
	public boolean getBoolean(String key){
		return config.getBoolean(key);
	}
	
	public Integer getInt(String key){
		return config.getInt(key);
	}
	
	public static void main(String args[]){
		PropertiesConfig p = new PropertiesConfig("/smsc/sms.properties");
		String aa = p.getString("charge_number");
		System.out.println(aa);
	}

	
}
