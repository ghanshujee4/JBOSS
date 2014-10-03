package com.tresfocus.ekart.test;

import javax.security.auth.Subject;
import javax.security.auth.login.LoginContext;
import javax.security.auth.login.LoginException;

import com.tresfocus.ekart.jaas.JAASCallbackHandler;

public class JAASTester {
	public static void main(String[] args) {
		LoginContext lc = null;
		try {
		    lc = new LoginContext("closerby", new JAASCallbackHandler("harsha", "harsha123"));
		    lc.login();
		    //get the subject.
		    Subject subject = lc.getSubject();
		    //get principals
		    subject.getPrincipals();
		    System.out.println("established new logincontext");
		} catch (LoginException e) {
			System.out.println("Authentication failed " + e);
		} 
	}
}
