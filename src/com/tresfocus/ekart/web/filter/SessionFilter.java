package com.tresfocus.ekart.web.filter;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.model.UserDAOImpl;
import com.tresfocus.ekart.spring.service.UserManager;

/*
@WebFilter(filterName = "SessionFilter",
           urlPatterns = {"/retailer/*"})
*/
public class SessionFilter implements Filter {
    private final static Logger LOGGER = LoggerFactory.getLogger(SessionFilter.class);

    @Override
    public void init(final FilterConfig filterConfig) throws ServletException {
        LOGGER.info("SessionFilter initialized");
    }

    @Override
    public void doFilter(final ServletRequest request, final ServletResponse response,
                         final FilterChain chain) throws IOException, ServletException {
    	HttpServletRequest httpRequest = ((HttpServletRequest)request);
    	Object obj = httpRequest.getSession().getAttribute(IConstants.SESSION_USER);
    	
    	if(obj == null){
	        Principal userPrincipal = httpRequest.getUserPrincipal();
	        if(userPrincipal != null && userPrincipal.getName() != null){
	        	try {
					httpRequest.getSession().setAttribute(IConstants.SESSION_USER, Utility.getUserByName(userPrincipal.getName()));
				} catch (Exception e) {
					throw new ServletException(e);
				}
	        }
    	}
        
        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {
        LOGGER.info("SessionFilter destroyed");
    }
}