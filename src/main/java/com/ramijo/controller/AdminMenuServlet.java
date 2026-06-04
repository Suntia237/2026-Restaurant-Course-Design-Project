package com.ramijo.controller;

import com.ramijo.dao.AuthUtil;
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

        User user = AuthUtil.getLoggedUser(req);

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        if (!"admin".equals(user.getRole())) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        MenuDao menuDao = new MenuDaoImpl();

        // Fetch all menus
        List<Menu> menus = menuDao.getAllMenus();
        List<Menu> dishes = menuDao.getMenusByCategory("Food");
        List<Menu> drinks = menuDao.getMenusByCategory("Drink");

        // Compute stats
        int totalMenus = menus.size();
        int totalDrinks = drinks.size();
        int totalDishes = dishes.size();

        // Set attributes for JSP
        req.setAttribute("menus", menus);
        req.setAttribute("dishes", dishes);
        req.setAttribute("drinks", drinks);

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