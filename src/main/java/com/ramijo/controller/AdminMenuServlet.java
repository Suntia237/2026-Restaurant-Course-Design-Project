package com.ramijo.controller;

import com.ramijo.dao.MenuDao;
import com.ramijo.dao.MenuDaoImpl;
import com.ramijo.model.Menu;
import com.ramijo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin-menu")
public class AdminMenuServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // Ensure admin is logged in
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

         User user = (User) session.getAttribute("user");
         if (!"admin".equals(user.getRole())) {
             resp.sendError(HttpServletResponse.SC_FORBIDDEN);
             return;
         }

        MenuDao menuDao = new MenuDaoImpl();

        // Fetch all menus
        List<Menu> menus = menuDao.displayAllMenus();
        List<Menu> dishes = menuDao.getMenusByCategory("Food");
        List<Menu> drinks = menuDao.getMenusByCategory("Drink");

        // Compute stats
        int totalMenus = menus.size();
        int totalDrinks = drinks.size();
        int totalDishes = dishes.size();

        // Set attributes for JSP
        req.setAttribute("menus", menus);
        req.setAttribute("totalMenus", totalMenus);
        req.setAttribute("totalDishes", totalDishes);
        req.setAttribute("totalDrinks", totalDrinks);

        // Load page inside master layout
        loadPage(
                req,
                resp,
                "Menu Management",
                "/view/admin/admin-menu.jsp",
                BaseServlet.ADMIN_LAYOUT
        );
    }
}