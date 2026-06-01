package com.ramijo.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/about")
public class AboutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("pageTitle","About Us");

        request.setAttribute("contentPage","/view/user/aboutus.jsp");

        request.getRequestDispatcher("/view/user/layout.jsp").forward(request, response);
    }
}