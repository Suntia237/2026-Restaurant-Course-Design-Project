package com.ramijo.controller;

import com.ramijo.dao.OrderDAO;
import com.ramijo.dao.OrderDAOImpl;
import com.ramijo.model.CartItem;
import com.ramijo.model.Order;
import com.ramijo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/order-success")
public class OrderSuccessServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");

        if(user == null){
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        int orderId = Integer.parseInt(
                req.getParameter("orderId")
        );

        OrderDAO orderDAO = new OrderDAOImpl();

        Order order =
                orderDAO.getOrderById(orderId);

        List<CartItem> items =
                orderDAO.getOrderItems(orderId);

        req.setAttribute("order", order);
        req.setAttribute("items", items);

        loadPage(
                req,
                resp,
                "Order Confirmation",
                "/view/user/order-success.jsp",
                USER_LAYOUT
        );
    }
}