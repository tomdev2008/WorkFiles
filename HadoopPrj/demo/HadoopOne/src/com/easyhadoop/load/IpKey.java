package com.easyhadoop.load;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.WritableComparable;

public class IpKey  implements WritableComparable<IpKey>{

	private String customerId;
	private String dateTime;
	private String ip;
	
	public IpKey() {
		
	}

	public IpKey(String customerId, String dateTime,String ip) {
		set(customerId, dateTime,ip);
	}

	public void set(String customerId, String dateTime,String ip) {
		this.customerId = customerId;
		this.dateTime = dateTime;
		this.ip = ip;
	}
	

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
    	

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public void readFields(DataInput in) throws IOException {
		customerId = in.readUTF();
		dateTime = in.readUTF();
		ip = in.readUTF();
		
	}

	public void write(DataOutput out) throws IOException {
		out.writeUTF(customerId);
		out.writeUTF(dateTime);
		out.writeUTF(ip);
		
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		IpKey other = (IpKey) obj;
		if (customerId == null) {
			if (other.customerId != null)
				return false;
		} else if (!customerId.equals(other.customerId))
			return false;
		if (dateTime == null) {
			if (other.dateTime != null)
				return false;
		} else if (!dateTime.equals(other.dateTime))
			return false;
		if (ip == null) {
			if (other.ip != null)
				return false;
		} else if (!ip.equals(other.ip))
			return false;
		return true;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((customerId == null) ? 0 : customerId.hashCode());
		result = prime * result + ((dateTime == null) ? 0 : dateTime.hashCode());
		result = prime * result + ((ip == null) ? 0 : ip.hashCode());
		return result;
	}

	public String toString() {
		return customerId+" "+dateTime+" "+ip;
	}

	public int compareTo(IpKey another) {
		
		int cmp1 = customerId.compareTo(another.getCustomerId());
		if (cmp1 != 0) {
			return cmp1;
		}
		int cmp2 = dateTime.compareTo(another.getDateTime());
		if (cmp2 != 0) {
			return cmp2;
		}
	
		return ip.compareTo(another.getIp());
	}
}
