package com.tresfocus.ekart;

import java.math.BigInteger;
import java.security.SecureRandom;

public final class OrderNumberGenerator {
	private SecureRandom random = new SecureRandom();

	public String nextSessionId() {
		return new BigInteger(30, random).toString(32);
	}

	public static void main(String args[]){
		System.out.println(new OrderNumberGenerator().nextSessionId());		
	}
}