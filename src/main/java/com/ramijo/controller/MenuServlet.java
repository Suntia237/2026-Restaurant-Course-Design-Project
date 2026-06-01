package com.ramijo.controller;

import com.ramijo.dao.MenuDao;
import com.ramijo.dao.MenuDaoImpl;
import com.ramijo.model.Menu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        MenuDao dao = new MenuDaoImpl();

        List<Menu> dishes = dao.getMenusByCategory("Food");

        List<Menu> drinks = dao.getMenusByCategory("Drink");

        req.setAttribute("dishes", dishes);
        req.setAttribute("drinks", drinks);

        req.setAttribute("contentPage","/view/user/menu.jsp");

        req.setAttribute("pageTitle","Menu");

        req.getRequestDispatcher("/view/user/layout.jsp").forward(req, resp);

    }
}