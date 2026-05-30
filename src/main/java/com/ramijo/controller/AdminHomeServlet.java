package com.ramijo.controller;

import com.ramijo.dao.MenuDao;
import com.ramijo.dao.MenuDaoImpl;
import com.ramijo.model.Menu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin-home")
public class AdminHomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MenuDao menuDao = new MenuDaoImpl();
        List<Menu> menus = menuDao.displayAllMenus();

        req.setAttribute("menus",menus);
        req.setAttribute("pageTitle","Admin Home page");
        req.setAttribute("contentPage","/view/admin/admin-home.jsp");

        req.getRequestDispatcher("view/admin/admin-layout.jsp").forward(req, resp);
    }
}
