package com.adopta.webservice.data;

import java.util.List;

public class LongToListOfLongMapping {
	private Long key;
	private List<Long> value;
	
	public void setValue(List<Long> value) {
		this.value = value;
	}
	public List<Long> getValue() {
		return value;
	}
	public void setKey(Long key) {
		this.key = key;
	}
	public Long getKey() {
		return key;
	}
}
