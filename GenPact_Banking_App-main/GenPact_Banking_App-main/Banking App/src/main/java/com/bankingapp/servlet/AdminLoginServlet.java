package com.bankingapp.servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.banking.model.AdminLogin;
import com.bankingapp.dao.AdminLoginDAO;

@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1;
    private AdminLoginDAO loginDao;

    public void init() {
        loginDao = new AdminLoginDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//    	boolean is_authenticated=false;

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AdminLogin loginBean = new AdminLogin();
        loginBean.setUsername(username);
        loginBean.setPassword(password);

        try {
            if (loginDao.validate(loginBean)) {
//            	is_authenticated=true;
                HttpSession session = request.getSession();
                session.setAttribute("admin",username);
                response.sendRedirect("AdminDashboard.jsp");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("user", username);
                request.setAttribute("loginError","Incorrect password");
                response.sendRedirect("AdminLogin.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}