package com.proj.bookingapp.controller.user;

import com.proj.bookingapp.dto.UserDTO;
import com.proj.bookingapp.model.User;
import com.proj.bookingapp.service.UserService;
import com.proj.bookingapp.utils.EmailUtil;


import javax.inject.Inject;
import javax.mail.MessagingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {
    private String host;
    private String port;
    private String username;
    private String pass;

    @Inject
    private UserService userService;

    @Override
    public void init() throws ServletException {
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        username = context.getInitParameter("username");
        pass = context.getInitParameter("pass");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null || action.equals("")){
            response.sendRedirect(request.getContextPath()+"/user/view/login.jsp");
            return;
        }

        if (action.equals("verify")) verifyAcc(request,response);
        if (action.equals("save")) saveNewAcc(request,response);

    }

    private void verifyAcc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = EmailUtil.getRandom();
        HttpSession session = request.getSession();

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (firstName==null || lastName == null || email == null || password==null|| firstName.equals("") ||
                lastName.equals("")|| email.equals("")|| password.equals("")){
            response.sendRedirect(request.getContextPath()+"/user/view/login.jsp");
        }

        User user1 = userService.findByEmail(email);
        if (user1 !=null){
            request.setAttribute("message","Email already exists!");
            request.setAttribute("action","register");
            RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/login.jsp");
            rd.forward(request,response);
        }

        UserDTO userDTO = new UserDTO();
        userDTO.setCode(code);
        userDTO.setEmail(email);
        userDTO.setFName(firstName);
        userDTO.setLName(lastName);
        userDTO.setPassword(password);

        boolean test=true;
        try {
            test= EmailUtil.sendEmail(host,port,username,pass,email,"Email Verification",
                    "Registered successfully. Please verify you account using this code: "+code);
        } catch (MessagingException e) {
            e.printStackTrace();
            test=false;
        }

        if (test){
            session.setAttribute("userDTO", userDTO);
        }
        response.sendRedirect(request.getContextPath()+"/user/view/verify.jsp");
    }
    private void saveNewAcc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");

        String code = request.getParameter("code");
        if (code==null || code.equals("") || !code.equals(userDTO.getCode())){
            request.setAttribute("message","Bạn đã nhập sai mã xác nhận");
            RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/verify.jsp");
            rd.forward(request,response);
        }



        String firstName = userDTO.getFName();
        String lastName = userDTO.getLName();
        String email = userDTO.getEmail();
        String password = userDTO.getPassword();

        User user = new User(null,firstName,lastName,email,password,"ROLE_USER",null,null,null,null);

        userService.saveUser(user);
        session.removeAttribute("userDTO");

        RequestDispatcher rd= request.getServletContext().getRequestDispatcher("/user/view/login.jsp");
        rd.forward(request,response);
    }
}
