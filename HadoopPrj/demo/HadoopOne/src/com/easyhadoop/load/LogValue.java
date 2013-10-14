package com.easyhadoop.load;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

import org.apache.hadoop.io.WritableComparable;

public class LogValue implements WritableComparable<LogValue> {

	private long flow;
	private long counter;

	public long getFlow() {
		return flow;
	}

	public void setFlow(long flow) {
		this.flow = flow;
	}

	public long getCounter() {
		return counter;
	}

	public void setCounter(long counter) {
		this.counter = counter;
	}

	public LogValue() {
	}

	public LogValue(long flow, long counter) {
		set(flow,counter);
	}

	public void set(long flow, long counter) {
		this.flow = flow;
		this.counter = counter;
	}

	public void readFields(DataInput in) throws IOException {
		flow = in.readLong();
		counter = in.readLong();
	}

	public void write(DataOutput out) throws IOException {
		out.writeLong(flow);
		out.writeLong(counter);
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (flow ^ (counter >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LogValue other = (LogValue) obj;
		if (flow != other.flow)
			return false;
		return true;
	}

	public int compareTo(LogValue another) {
		return flow < another.getFlow() ? -1 : (flow == another.getFlow() ? 0 : 1);
	}

	public String toString() {
		return flow+" "+counter;
	}
}
