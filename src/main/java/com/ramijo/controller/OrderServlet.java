package com.ramijo.controller;

import com.ramijo.dao.AuthUtil;
import com.ramijo.dao.OrderDAO;
import com.ramijo.dao.OrderDAOImpl;
import com.ramijo.model.Order;
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

        List<Order> orders =
                orderDAO.getOrdersByUser(user.getId());

        String status = req.getParameter("status");

        if(status != null && !status.isEmpty()){
            orders = orderDAO.getOrdersByStatus(status);
        }

        req.setAttribute("orders", orders);

        loadPage(
                req,
                resp,
                "My Orders",
                "/view/user/orders.jsp",
                USER_LAYOUT
        );
    }
}