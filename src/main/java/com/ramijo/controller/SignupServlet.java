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

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        /*
         * Get form data
         */
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if(password.equals(confirmPassword)){
            /*
             * Create User object
             */
            User user = new User(firstName,lastName,phone,email, password);

            /*
             * DAO object
             */
            UserDao userDao = new UserDaoImpl();

            /*
             * Add user to database
             */
            boolean success = userDao.addUser(user);

            if(success) {
                /*
                 * Optional:
                 * automatically login after signup
                 */
                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                /*
                 * Redirect based on role
                 */
                if(user.getRole().equals("admin")) {
                    resp.sendRedirect("view/admin/layout.jsp");

                } else {
                    resp.sendRedirect("view/user/layout.jsp");
                }

            } else {

                /*
                 * Signup failed
                 */
                req.setAttribute("error", "Signup failed");
                req.getRequestDispatcher("view/auth/signup.jsp").forward(req, resp);
            }
        } else {

            /*
             * Signup failed
             */
            req.setAttribute("error", "Password confirmation failed");
            req.getRequestDispatcher("view/auth/signup.jsp").forward(req, resp);
        }


    }

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        resp.sendRedirect("view/auth/signup.jsp");
    }
}