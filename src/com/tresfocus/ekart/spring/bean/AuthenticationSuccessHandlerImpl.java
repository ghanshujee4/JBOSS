package com.tresfocus.ekart.spring.bean;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.spring.service.UserManager;

public class AuthenticationSuccessHandlerImpl implements
		AuthenticationSuccessHandler {
	@Autowired
	private UserManager userManager;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		UserDetails userDetail = (UserDetails) authentication.getPrincipal();
		User currentUser = userManager.getUserByUserName(userDetail.getUsername());
		request.getSession().setAttribute(IConstants.SESSION_USER, currentUser);
		response.sendRedirect("welcome.shx");
	}
}