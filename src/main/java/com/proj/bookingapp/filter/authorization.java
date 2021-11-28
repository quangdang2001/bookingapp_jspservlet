package com.proj.bookingapp.filter;

import com.proj.bookingapp.model.User;
import com.proj.bookingapp.service.UserService;
import com.proj.bookingapp.service.iplm.UserServiceIplm;
import com.proj.bookingapp.utils.CookieUtil;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class authorization implements Filter {
    ServletContext servletContext;
    private UserService userService = new UserServiceIplm();
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.servletContext= filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String email ="";
        if (user==null) {
            Cookie[] cookie = request.getCookies();
            email = CookieUtil.getCookieValue(cookie,"email");
            if (email!=null && !email.equals("")){
                user = userService.findByEmail(email);
                session.setAttribute("user",user);
            }
        }
        if (url.contains("/adminPage") || url.contains("/review") || url.contains("/home/booking") || url.contains("/home/booking/payment") ){
            if (user==null){
                if (email==null || email.equals("")) {
                    response.sendRedirect(request.getContextPath()+"/login?action=login&message=Login first");
                }
            }else {
                if (url.contains("/adminPage") && !user.getRole().equals("ROLE_ADMIN")) {
                    response.sendRedirect(request.getContextPath()+"/login?action=login&message=Not permission");
                }else
                chain.doFilter(request,response);
            }
        }
        else {
            chain.doFilter(request,response);
        }
    }

    @Override
    public void destroy() {

    }
}
