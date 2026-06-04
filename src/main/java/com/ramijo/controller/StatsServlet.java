package com.ramijo.controller;

import com.ramijo.dao.AuthUtil;
import com.ramijo.dao.StatsDAO;
import com.ramijo.dao.StatsDAOImpl;
import com.ramijo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet("/statistics")
public class StatsServlet extends BaseServlet {

    private StatsDAO statsDAO;

    @Override
    public void init() {
        statsDAO = new StatsDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        User user = AuthUtil.getLoggedUser(request);

        if(user == null || !Objects.equals(user.getRole(), "admin")){
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.setAttribute(
                "totalOrders",
                statsDAO.getTotalOrders()
        );

        request.setAttribute(
                "totalRevenue",
                statsDAO.getTotalRevenue()
        );

        request.setAttribute(
                "totalCustomers",
                statsDAO.getTotalUserByRole("client")
        );

        request.setAttribute(
                "totalAdmins",
                statsDAO.getTotalUserByRole("admin")
        );

        request.setAttribute(
                "totalMenus",
                statsDAO.getTotalMenus()
        );

        request.setAttribute(
                "completedPercent",
                statsDAO.getCompletedPercent()
        );

        request.setAttribute(
                "pendingPercent",
                statsDAO.getPendingPercent()
        );

        request.setAttribute(
                "cancelledPercent",
                statsDAO.getCancelledPercent()
        );

        request.setAttribute(
                "orders", statsDAO.getAllOrders());

        request.setAttribute(
                "users", statsDAO.getAllUsers());

        loadPage(
                request,
                response,
                "Statistics",
                "/view/admin/admin-statistics.jsp",
                BaseServlet.ADMIN_LAYOUT
        );
    }
}