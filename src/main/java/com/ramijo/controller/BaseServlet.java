package com.ramijo.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;
import java.io.IOException;

public abstract class BaseServlet extends HttpServlet {

    protected static final String USER_LAYOUT =
            "/view/user/layout.jsp";

    protected static final String ADMIN_LAYOUT =
            "/view/admin/admin-layout.jsp";
    protected void loadPage(
            HttpServletRequest req,
            HttpServletResponse resp,
            String title,
            String contentPage,
            String layout)
            throws ServletException, IOException {

        req.setAttribute("pageTitle", title);
        req.setAttribute("contentPage", contentPage);

        req.getRequestDispatcher(layout).forward(req, resp);
    }
}