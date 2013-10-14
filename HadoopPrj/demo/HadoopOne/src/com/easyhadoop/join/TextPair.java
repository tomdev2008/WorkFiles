package com.easyhadoop.join;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

import org.apache.hadoop.io.WritableComparable;

@SuppressWarnings("all")
public class TextPair implements WritableComparable {
	private String text;
	private int id;

	public TextPair() {
	}

	public TextPair(String text, int id) {
		this.id = id;
	}

	public void setText(String text) {
		this.text = text;
	}

	public void setID(int id) {
		this.id = id;
	}
  
	public String getText() {
		return text;
	}

	@Override
	public void readFields(DataInput in) throws IOException {
		this.text = in.readUTF();
		this.id = in.readInt();
	}

	@Override
	public void write(DataOutput out) throws IOException {
		out.writeUTF(text);
		out.writeInt(id);
	}

	@Override
	public int compareTo(Object o) { // 先比较text，在比较id
		TextPair that = (TextPair) o;
		if (!this.text.equals(that.text)) {
			return this.text.compareTo(that.text);
		} else {
			return this.id - that.id;
		}
	}
}
