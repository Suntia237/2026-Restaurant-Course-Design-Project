package com.ramijo.controller;

import com.ramijo.dao.UserDao;
import com.ramijo.dao.UserDaoImpl;
import com.ramijo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/account")
public class AccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        /*
         * Get current session
         */
        HttpSession session = req.getSession(false);

        /*
         * Check authentication
         */
        if(session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("${pageContext.request.contextPath}/login");
            return;
        }

        /*
         * Get logged-in user
         */
        User user = (User) session.getAttribute("user");

        /*
         * Send user to JSP
         */
        req.setAttribute("user", user);

        /*
         * Load inside master layout
         */
        req.setAttribute("contentPage", "account.jsp");
        req.setAttribute("pageTilet", "Account");

        req.getRequestDispatcher("/view/user/layout.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        /*
         * Get current session
         */
        HttpSession session = req.getSession(false);

        /*
         * Check authentication
         */
        if(session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("${pageContext.request.contextPath}/login");
            return;
        }

        User user = (User) session.getAttribute("user");

        /*
         * Get updated form data
         */
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        /*
         * Update object
         */
        User updateUser = new User(firstName, lastName, phone, email, password);

        /*
         * Update database
         */
        UserDao dao = new UserDaoImpl();

        boolean success = dao.updateUser(updateUser);

        if(success) {

            /*
             * Update session user
             */
            session.setAttribute("user",updateUser);
            req.setAttribute("success", "Profile updated successfully");

        } else {
            req.setAttribute("error", "Failed to update profile");
        }

        /*
         * Reload account page
         */
        req.setAttribute("contentPage", "account.jsp");

        req.getRequestDispatcher("/view/user/layout.jsp")
                .forward(req, resp);
    }
}
