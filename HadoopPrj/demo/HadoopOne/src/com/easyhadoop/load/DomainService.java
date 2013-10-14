package com.easyhadoop.load;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.hadoop.util.StringUtils;

public class DomainService {

    private final Map<String, String> devicesMap = new HashMap<String, String>();
    private final Map<String, String> domainsMap = new HashMap<String, String>();
    private final Map<String, String> webSiteMap = new HashMap<String, String>();
    @SuppressWarnings("all")
	public DomainService(File deviceFile) throws IOException {
//    	  List<String> lines = FileUtils.readLines(domainFile, "UTF-8");
//          for (String line : lines) {
//              String trimLine = line.trim();
//              if (StringUtils.isNotBlank(trimLine) && !trimLine.startsWith("#")) {
//                  String[] splits = trimLine.split(",");
//                  String website = splits[0];
//                  String domain = splits[1];
//                  if (domain.startsWith("*.")) {
//                      domain = domain.substring(2);
//                  }
//                  domainsMap.put(domain, website);
//              }
          //}
        List<String> lines1 = FileUtils.readLines(deviceFile, "UTF-8");
        for (String line : lines1) {
            String trimLine = line.trim();
            if (StringUtils.isNotBlank(trimLine) && !trimLine.startsWith("#")) {
                String[] splits = trimLine.split(",");
                devicesMap.put(splits[0], splits[1]);
            }
        }
        
//        List<String> lines2 = FileUtils.readLines(filterFile, "UTF-8");
//        for (String line : lines2) {
//            String trimLine = line.trim();
//            if (StringUtils.isNotBlank(trimLine) && !trimLine.startsWith("#")) {
//                String[] splits = trimLine.split(",");
//                webSiteMap.put(splits[0].trim(), splits[1].trim());
//            }
//        }
    }
    
    //
    @SuppressWarnings("all")
	public DomainService(File domainFile,File file) throws IOException {
    	  List<String> lines = FileUtils.readLines(domainFile, "UTF-8");
          for (String line : lines) {
              String trimLine = line.trim();
              if (StringUtils.isNotBlank(trimLine) && !trimLine.startsWith("#")) {
                  String[] splits = StringUtils.split(trimLine,",",2);
                  String website = splits[0];
                  String[] domain = splits[1].split(",");
                  if(domain.length <2) 
                	  return;
                  String value = website+","+domain[1];
                  domainsMap.put(domain[0],value);
              }
          }
      
    }
    
    
    public String getWebsiteFromDomain(String domain) {
        if (domainsMap.containsKey(domain)) {
            return domainsMap.get(domain);
        } else {
               String current_key = domain;
                String[] splits = StringUtils.split(current_key, "\\.", 2);
                if (splits.length < 2) {
                	return "other";
                }
                current_key = splits[1];
                Set<Map.Entry<String, String>> set = domainsMap.entrySet();
                for (Iterator<Map.Entry<String, String>> it = set.iterator(); it.hasNext();) {
                    Map.Entry<String, String> entry = (Map.Entry<String, String>) it.next();
                    String key = entry.getKey();
	                if (key.contains(current_key)) {
	                    return domainsMap.get(key);
	                   }
                }
            }
            return "other";
        }


    public String getCustomerId(String deviceName) {
        return devicesMap.get(deviceName);
    }
    
    
    public Map<String, String> getWebSiteMap() {
		return webSiteMap;
	}

	public String getRegxURL(String website){
    	
    	
    	 Set<Map.Entry<String, String>> set = webSiteMap.entrySet();
         for (Iterator<Map.Entry<String, String>> it = set.iterator(); it.hasNext();) {
             Map.Entry<String, String> entry = (Map.Entry<String, String>) it.next();
             System.out.println(entry.getKey() + "--->" + entry.getValue());
             if(website.equals(entry.getKey()))
            	 return webSiteMap.get(website);	 
         }
    	 System.out.println("size===="+webSiteMap.size());
    	  return "other";
    	
    }
    
}
