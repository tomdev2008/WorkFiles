package com.easyhadoop.join;

import org.apache.hadoop.io.WritableComparable;
import org.apache.hadoop.io.WritableComparator;

public  class FirstComparator extends WritableComparator{
	public FirstComparator(){ 
		//register comparator 
		super(TextPair.class, true); 
		} 
	@Override 
	@SuppressWarnings("all")
	public int compare(WritableComparable a, WritableComparable b) {
		TextPair o1 = (TextPair)a;
		TextPair o2 = (TextPair)b; 
		return o1.getText().compareTo(o2.getText());
		} 
	}