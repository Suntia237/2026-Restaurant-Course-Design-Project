package com.ramijo.controller;

import com.ramijo.dao.StatisticsDAO;
import com.ramijo.model.MonthlyRevenue;
import com.ramijo.model.TopMenu;
import com.ramijo.model.WeeklyOrder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/statistics")
public class StatsServlet extends HttpServlet {

    private StatisticsDAO statisticsDAO;

    @Override
    public void init() {
        statisticsDAO = new StatisticsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute(
                "totalOrders",
                statisticsDAO.getTotalOrders()
        );

        request.setAttribute(
                "totalRevenue",
                statisticsDAO.getTotalRevenue()
        );

        request.setAttribute(
                "totalCustomers",
                statisticsDAO.getTotalCustomers()
        );

        request.setAttribute(
                "totalMenus",
                statisticsDAO.getTotalMenus()
        );

        request.setAttribute(
                "completedPercent",
                statisticsDAO.getCompletedPercent()
        );

        request.setAttribute(
                "pendingPercent",
                statisticsDAO.getPendingPercent()
        );

        request.setAttribute(
                "cancelledPercent",
                statisticsDAO.getCancelledPercent()
        );

        request.setAttribute(
                "Orders", Orders
        );

        request.setAttribute(
                "contentPage",
                "/view/admin/statistics.jsp"
        );

        request.getRequestDispatcher(
                "/view/admin/layout.jsp"
        ).forward(request, response);
    }
}