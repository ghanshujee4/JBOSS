package com.tresfocus.ekart.spring.controller;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class LoginController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String executeSecurity(ModelMap model, HttpServletRequest request) {

		UserDetails userDetail = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("author", userDetail.getUsername());
		model.addAttribute("message",
				"Welcome To Login Form Based Spring Security Example!!!");
		
		return "retailer/home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
	}
	
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public View welcome() {

        Set<String> roles = AuthorityUtils
                .authorityListToSet(SecurityContextHolder.getContext()
                        .getAuthentication().getAuthorities());
        
        if (roles.contains("ROLE_RETAILER")) {
            return new RedirectView("retailer/index.shx");
        }else if (roles.contains("ROLE_CUSTOMER")) {
            return new RedirectView("/customer/home.shx");
        	//return new RedirectView("/zone.shx");
        }
        
        return new RedirectView("/noPermission");
    }
	
	/*@RequestMapping(value = "/customerWelcome", method = RequestMethod.GET)
	public String customerWelcome() {

        Set<String> roles = AuthorityUtils
                .authorityListToSet(SecurityContextHolder.getContext()
                        .getAuthentication().getAuthorities());
        
        if (roles.contains("ROLE_CUSTOMER")) {
            return "success";
        	//return new RedirectView("/zone.shx");
        }else{
        	return "failed";
        }
        
    }*/

	@RequestMapping(value = "/noPermission", method = RequestMethod.GET)
	public String noPermission(ModelMap model) {
		model.addAttribute("error", "true");
		return "noPermission";
	}
	
	@RequestMapping(value = "/fail2login", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "logout";
	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {
		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			model.addObject("username", userDetail.getUsername());
		}

		model.setViewName("403");
		return model;
	}
}
