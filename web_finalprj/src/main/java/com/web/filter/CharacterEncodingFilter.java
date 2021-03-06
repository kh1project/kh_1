package com.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
@WebFilter(
	urlPatterns = "/*",
	filterName = "encodingFilter"
)
@Order(2)
public class CharacterEncodingFilter implements Filter {

    public CharacterEncodingFilter() {}

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		
		chain.doFilter(request, response);
		
		response.setCharacterEncoding("utf-8");
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
