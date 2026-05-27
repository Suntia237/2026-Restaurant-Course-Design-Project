package com.ramijo.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import com.ramijo.model.User;
import com.ramijo.dao.UserDao;
import com.ramijo.dao.UserDaoImpl;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        User user = new User();

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        user.setEmail(email);
        user.setPassword(password);

        UserDao dao = new UserDaoImpl();

        if(dao.login(user)) {
            /*Create session*/
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            /*Redirect based on role*/
            if(user.getRole().equals("admin")) {
                resp.sendRedirect("view/layout.jsp");
            } else {
                resp.sendRedirect("view/layout.jsp");
            }

        } else {
            resp.sendRedirect("view/login.jsp");
        }
    }
}


