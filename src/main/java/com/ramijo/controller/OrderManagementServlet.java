package com.ramijo.controller;

import com.ramijo.dao.*;
import com.ramijo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet("/admin-orders")
public class OrderManagementServlet extends BaseServlet {

    private OrderDAO orderDAO;
    private StatsDAO statsDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAOImpl();
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
                "pendingOrdersCount",
                statsDAO.countOrdersByStatus("pending")
        );

        request.setAttribute(
                "completedOrdersCount",
                statsDAO.countOrdersByStatus("finished")
        );

        request.setAttribute(
                "cancelledOrdersCount",
                statsDAO.countOrdersByStatus("canceled")
        );

        request.setAttribute(
                "orders",
                orderDAO.getAllOrders()
        );
        request.setAttribute(
                "pendingOrders",
                orderDAO.getAllPendingOrdersDetails()
        );

        loadPage(
                request,
                response,
                "Order Management",
                "/view/admin/admin-order.jsp",
                BaseServlet.ADMIN_LAYOUT
        );
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        int orderId =
                Integer.parseInt(
                        request.getParameter("orderId")
                );

        String action =
                request.getParameter("action");

        switch (action){

            case "confirm":
                orderDAO.updateOrderStatus(
                        orderId,
                        "finished"
                );
                break;

            case "cancel":
                orderDAO.updateOrderStatus(
                        orderId,
                        "canceled"
                );
                break;
        }

        response.sendRedirect("/admin-orders");
    }
}