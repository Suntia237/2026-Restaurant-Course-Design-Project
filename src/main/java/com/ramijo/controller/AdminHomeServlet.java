package com.ramijo.controller;

import com.ramijo.dao.MenuDao;
import com.ramijo.dao.MenuDaoImpl;
import com.ramijo.dao.StatsDAO;
import com.ramijo.dao.StatsDAOImpl;
import com.ramijo.model.Menu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin-home")
public class AdminHomeServlet extends BaseServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MenuDao menuDao = new MenuDaoImpl();
        StatsDAO statsDAO = new StatsDAOImpl();

        List<Menu> menus = menuDao.getAllMenus();

        req.setAttribute(
                "totalOrders",
                statsDAO.getTotalOrders()
        );

        req.setAttribute(
                "totalRevenue",
                statsDAO.getTotalRevenue()
        );

        req.setAttribute(
                "totalCustomers",
                statsDAO.getTotalUserByRole("client")
        );

        req.setAttribute(
                "totalMenus",
                statsDAO.getTotalMenus()
        );

        req.setAttribute("menus",menus);

        loadPage(
                req,
                resp,
                "Admin Home page",
                "/view/admin/admin-home.jsp",
                BaseServlet.ADMIN_LAYOUT
        );
    }
}
