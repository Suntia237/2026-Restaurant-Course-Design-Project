package com.ramijo.controller;

import com.ramijo.dao.AuthUtil;
import com.ramijo.dao.OrderDAO;
import com.ramijo.dao.OrderDAOImpl;
import com.ramijo.model.CartItem;
import com.ramijo.model.Order;
import com.ramijo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/payment")
public class PaymentServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        User user = AuthUtil.getLoggedUser(req);

        if(user == null){resp.sendRedirect(req.getContextPath()+"/login");
            return;
        }

        HttpSession session = req.getSession();

        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        if(cartItems == null){
            cartItems = new ArrayList<>();
        }

        String payMethod =
                req.getParameter("payMethod");

        if(payMethod == null){
            payMethod = "/images/alipaycode.jpg";
        }

        int cartCount = 0;
        int totalAmount = 0;

        for(CartItem item : cartItems){

            cartCount += item.getQuantity();
            totalAmount += item.getSubtotal();
        }

        req.setAttribute("payMethod", payMethod);
        req.setAttribute("cartCount", cartCount);
        req.setAttribute("totalAmount", totalAmount);

        loadPage(
                req,
                resp,
                "Payment",
                "/view/user/payment.jsp",
                USER_LAYOUT
        );
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        User user = AuthUtil.getLoggedUser(req);

        if(user == null){
            resp.sendRedirect(req.getContextPath()+"/login");
            return;
        }

        HttpSession session = req.getSession();

        String action = req.getParameter("action");

        /*
         * Cancel Payment
         */
        if (action.equals("cancel")) {
            resp.sendRedirect(req.getContextPath() + "/cart");
            return;
        } else if (action.equals("confirm")) {
            List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

            if(cartItems == null || cartItems.isEmpty()){

                resp.sendRedirect(req.getContextPath()+"/cart");
                return;
            }

            String tableNumber = req.getParameter("tableNumber");

            Order order = new Order();

            order.setClient_id(user.getId());
            order.setTable_number(tableNumber);
            order.setStatus("Pending");

            OrderDAO orderDAO = new OrderDAOImpl();

            int orderId = orderDAO.addOrder(order,cartItems);

            if(orderId > 0){

                session.removeAttribute("cartItems");

                resp.sendRedirect(req.getContextPath()+
                        "/confirmation?orderId="+ orderId);

            }else{
                resp.sendRedirect(req.getContextPath()+ "/payment" );
            }
        }
    }
}