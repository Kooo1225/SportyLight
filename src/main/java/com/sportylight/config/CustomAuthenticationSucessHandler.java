package com.sportylight.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

@Service
public class CustomAuthenticationSucessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	@Bean
	@Override
	 protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response) {
		String referer = (String) request.getSession().getAttribute("referer");
		if (referer != null && !referer.isEmpty()) {
			request.getSession().removeAttribute("referrer");
			return referer;
		}
		else {
			return "/map";
		}
	}
}
