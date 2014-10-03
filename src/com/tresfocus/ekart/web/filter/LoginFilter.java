package com.tresfocus.ekart.web.filter;

import java.io.IOException;

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

//@WebFilter(filterName = "LoginFilter",
//           urlPatterns = {"/*"})
public class LoginFilter implements Filter {

    private final static Logger LOGGER = LoggerFactory.getLogger(LoginFilter.class);

    private static final String RESOURCE_PATH = "/closerby/rest/";
    @Override
    public void init(final FilterConfig filterConfig) throws ServletException {
        LOGGER.info("LoginFilter initialized");
    }

    @Override
    public void doFilter(final ServletRequest request, final ServletResponse response,
                         final FilterChain chain) throws IOException, ServletException {

        String path = ((HttpServletRequest) request).getRequestURI();
        if (path.toLowerCase().startsWith(RESOURCE_PATH)) {
            request.getRequestDispatcher(path).forward(request, response);
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        LOGGER.info("LoginFilter destroyed");
    }
}