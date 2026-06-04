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

@WebServlet("/home")
public class HomeServlet extends BaseServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String page = req.getParameter("page");

        if(page == null){
            page = "home";
        }
        MenuDao menuDao = new MenuDaoImpl();
        List<Menu> menus = menuDao.getAllMenus();

        req.setAttribute("menus",menus);

        switch (page){
            case "home":
                loadPage(
                        req,
                        resp,
                        "Home Page",
                        "/view/user/home.jsp",
                        BaseServlet.USER_LAYOUT
                );
                break;

            case "aboutUs":
                loadPage(
                        req,
                        resp,
                        "About Us",
                        "/view/user/aboutus.jsp",
                        USER_LAYOUT
                );
                break;
            default:
                loadPage(
                        req,
                        resp,
                        "Home Page",
                        "/view/user/home.jsp",
                        BaseServlet.USER_LAYOUT
                );
        }

    }
}
