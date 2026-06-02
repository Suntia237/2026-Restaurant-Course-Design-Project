package com.ramijo.controller;

import com.ramijo.dao.AuthUtil;
import com.ramijo.model.CartItem;
import com.ramijo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/payment")
public class PaymentServlet extends BaseServlet {

    private static final double DELIVERY_FEE = 10.0;

    @Override
    protected void doPost(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        /*
         * Authentication
         */
        User user = AuthUtil.getLoggedUser(req);
        if(user == null){
            resp.sendRedirect(req.getContextPath()+"/login");

            return;
        }

        String payMethod = req.getParameter("payMethod");
        if(payMethod==null)
            payMethod = "/images/alipay.png";
        /*
         * Cart
         */
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        if(cartItems == null){
            cartItems = new ArrayList<>();
        }

        /*
         * Calculations
         */
        int cartCount = 0;
        int subtotal = 0;

        for(CartItem item : cartItems){
            cartCount += item.getQuantity();
            subtotal += item.getSubtotal();
        }

        double deliveryFee = cartItems.isEmpty()
                        ? 0
                        : DELIVERY_FEE;

        double totalAmount = subtotal + deliveryFee;

        /*
         * Send data to JSP
         */
        req.setAttribute("payMethod", payMethod);

        req.setAttribute("cartCount", cartCount);

        req.setAttribute("subtotal",subtotal);

        req.setAttribute("deliveryFee",deliveryFee);

        req.setAttribute("totalAmount",totalAmount);

        /*
         * Layout
         */
        loadPage(
                req,
                resp,
                "Payment",
                "/view/user/payment.jsp",
                BaseServlet.USER_LAYOUT
        );
    }
}