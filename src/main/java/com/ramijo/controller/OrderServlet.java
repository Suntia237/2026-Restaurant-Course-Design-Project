package com.ramijo.controller;

import com.ramijo.dao.AuthUtil;
import com.ramijo.dao.OrderDAO;
import com.ramijo.dao.OrderDAOImpl;
import com.ramijo.model.Order;
import com.ramijo.model.OrderLine;
import com.ramijo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/orders")
public class OrderServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        User user = AuthUtil.getLoggedUser(req);

        if(user == null){
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        OrderDAO orderDAO = new OrderDAOImpl();

        List<OrderLine> orders =
                orderDAO.getOrdersDetailsByUser(user.getId());

        List<Order> completedOrders =
                orderDAO.getOrdersByStatus(user.getId(),"finished");

        List<Order> pendingOrders =
                orderDAO.getOrdersByStatus(user.getId(),"pending");

        List<Order> cancelledOrders =
                orderDAO.getOrdersByStatus(user.getId(),"canceled");

        int _completedOrders = completedOrders.size();
        int _pendingOrders = pendingOrders.size() ;
        int _cancelledOrders = cancelledOrders.size();
        int totalOrders = _cancelledOrders + _completedOrders + _pendingOrders;


        int totalSpent = 0;
        for(OrderLine o : orders)
            totalSpent += o.getTotal();

//        String status = req.getParameter("status");
//
//        if(status != null && !status.isEmpty()){
//            orders = orderDAO.getOrdersByStatus(status);
//        }

        req.setAttribute("orders", orders);
        req.setAttribute("totalOrders", totalOrders);
        req.setAttribute("completedOrders", _completedOrders);
        req.setAttribute("pendingOrders", _pendingOrders);
        req.setAttribute("cancelledOrders", _cancelledOrders);
        req.setAttribute("totalSpent", totalSpent);

        loadPage(
                req,
                resp,
                "My Orders",
                "/view/user/orders.jsp",
                USER_LAYOUT
        );
    }
}