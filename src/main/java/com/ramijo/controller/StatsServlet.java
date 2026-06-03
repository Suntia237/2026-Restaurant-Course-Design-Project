package com.ramijo.controller;

import com.ramijo.dao.StatsDAO;
import com.ramijo.dao.StatsDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

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

        loadPage(
                request,
                response,
                "Statistics",
                "/view/admin/admin-statistics.jsp",
                BaseServlet.ADMIN_LAYOUT
        );
    }
}