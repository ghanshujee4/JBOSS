package com.tresfocus.ekart.web.ui.beans;

import java.io.Serializable;

public class PriceRange implements Comparable<PriceRange> , Serializable{
	private Double min;
	private Double max;
	public PriceRange(Double min,Double max){
		this.min = min;
		this.max = max;
	}
	public Double getMin() {
		return min;
	}
	public void setMin(Double min) {
		this.min = min;
	}
	public Double getMax() {
		return max;
	}
	public void setMax(Double max) {
		this.max = max;
	}
	public boolean isPriceRange(Double price){
		return (min <= price) && (price <= max);
	}
	@Override
	public boolean equals(Object obj) {
		PriceRange pr = (PriceRange)obj;
		return this.max ==pr.max && this.min == pr.min;
	}
	/*@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return this.hashCode();
	}*/
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return min.intValue() +" - "+max.intValue();
	}
	@Override
	public int compareTo(PriceRange o) {
		return this.toString().length() - o.toString().length();
	}
}
