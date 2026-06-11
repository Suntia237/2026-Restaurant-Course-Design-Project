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

/* ERROR 1: Incorrect servlet URL mapping */
@WebServlet("/login")
public class LoginServlet extends BaseServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        /* ERROR 2: Wrong parameter name used for email */
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDao dao = new UserDaoImpl();
        User user = new User();
        user = dao.login(email, password);

        /* ERROR 3: Incorrect condition for successful login */
        if(user != null) {

            /*Create session*/
            HttpSession session = req.getSession();

            /* ERROR 4: Wrong session attribute name */
            session.setAttribute("user", user);

            /*Redirect based on role*/
            if(user.getRole().equals("admin")) {
                resp.sendRedirect("/admin-home");
            } else {
                resp.sendRedirect("/home");
            }

        } else {

            /* ERROR 5: Misspelled request attribute name */
            req.setAttribute("error", "Invalid email or password");
            req.getRequestDispatcher("/view/auth/login.jsp")
                    .forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        resp.sendRedirect("/view/auth/login.jsp");
    }
}