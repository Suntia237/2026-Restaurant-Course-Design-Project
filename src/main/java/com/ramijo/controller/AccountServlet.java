package com.ramijo.controller;

import com.ramijo.dao.AuthUtil;
import com.ramijo.dao.UserDao;
import com.ramijo.dao.UserDaoImpl;
import com.ramijo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/account")
public class AccountServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        /*
         * Get current session
         */
        User user = AuthUtil.getLoggedUser(req);

        if(user == null){

            resp.sendRedirect(
                    req.getContextPath()+"/login");

            return;
        }

        /*
         * Send user to JSP
         */
        req.setAttribute("user", user);

        /*
         * Load inside master layout
         */
        loadPage(
                req,
                resp,
                "Account",
                "/view/user/account.jsp",
                USER_LAYOUT
        );
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        /*
         * Get current session
         */
        User user = AuthUtil.getLoggedUser(req);

        if(user == null){
            resp.sendRedirect(req.getContextPath()+"/login");
            return;
        }

        User sessionUser = (User) session.getAttribute("user");

        UserDao dao = new UserDaoImpl();
        String action = req.getParameter("action");

        boolean success = false;

        /*
         * Get updated form personal data
         */
        switch (action) {
            case "profile":
                String firstName = req.getParameter("firstName");
                String lastName = req.getParameter("lastName");
                String email = req.getParameter("email");
                String phone = req.getParameter("phone");

                sessionUser.setFirst_name(firstName);
                sessionUser.setLast_name(lastName);
                sessionUser.setEmail(email);
                sessionUser.setPhone_number(phone);

                /*
                 * Update database
                 */
                success = dao.updateUser(sessionUser, action);

                if (success) {
                    /*
                     * Update session user
                     */
                    session.setAttribute("user", sessionUser);
                    req.setAttribute("success", "Profile updated successfully");

                } else {
                    req.setAttribute("error", "Failed to update profile");
                }
                break;
            case "password":

                String currentPassword = req.getParameter("currentPassword");
                String newPassword = req.getParameter("newPassword");
                String confirmPassword = req.getParameter("confirmPassword");

                /*
                 * Validate password
                 */
                if (!sessionUser.getPassword().equals(currentPassword)) {
                    req.setAttribute("error", "Current password is incorrect");
                } else if (!newPassword.equals(confirmPassword)) {
                    req.setAttribute("error", "Passwords do not match");
                } else {
                    sessionUser.setPassword(newPassword);

                    success = dao.updateUser(sessionUser, action);

                    if (success) {
                        session.setAttribute("user", sessionUser);
                        req.setAttribute("success", "Password updated successfully");

                    } else {
                        req.setAttribute("error", "Failed to update password");
                    }
                }
                break;
            case "delete":

                success = dao.deleteUser(sessionUser.getId());

                if (success) {
                    req.setAttribute("success", "User deleted successfully");
                    session.invalidate();
                    resp.sendRedirect("/login");

                } else {
                    req.setAttribute("error", "Failed to delete user");
                }
                break;
        }


        /*
         * Reload account page
         */
        loadPage(
                req,
                resp,
                "About Us",
                "/view/user/account.jsp",
                USER_LAYOUT
        );
    }
}
