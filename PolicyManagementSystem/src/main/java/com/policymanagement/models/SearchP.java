package com.policymanagement.models;

public class SearchP {
	/* private String category; */
	private String text;

	/*
	 * public String getCategory() { return category; } public void
	 * setCategory(String category) { this.category = category; }
	 */	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	/*
	 * @Override public String toString() { return "SearchP [category=" + category +
	 * ", text=" + text + "]"; }
	 */
	@Override
	public String toString() {
		return "SearchP [text=" + text + "]";
	}
	
	
}
