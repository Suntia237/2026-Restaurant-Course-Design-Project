package com.ramijo.controller;

import com.ramijo.dao.*;
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

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        HttpSession session = req.getSession();

        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }

        String payMethod = req.getParameter("payMethod");
        String tableNumber = req.getParameter("tableNumber");
        String payMethodImg = null;

        if (payMethod == null) {
            payMethod = "Cash";
        } else if (payMethod.equals("Alipay")) {
            payMethodImg = "/images/alipaycode.jpg";
        } else if (payMethod.equals("WechatPay")) {
            payMethodImg = "/images/wechatcode.jpg";
        }

        // FIX: Store payMethod in session for use in doPost
        session.setAttribute("payMethod", payMethod);

        int cartCount = 0;
        int totalAmount = 0;

        for (CartItem item : cartItems) {
            cartCount += item.getQuantity();
            totalAmount += item.getSubtotal();
        }

        req.setAttribute("payMethod", payMethod);
        req.setAttribute("payMethodImg", payMethodImg);
        req.setAttribute("tableNumber", tableNumber);
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

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        HttpSession session = req.getSession();

        String action = req.getParameter("action");
        if (action == null)
            action = "";

        /*
         * Cancel Payment
         */
        if (action.equals("cancel")) {
            session.removeAttribute("cartItems");
            session.removeAttribute("payMethod"); // Also clean up payMethod
            resp.sendRedirect(req.getContextPath() + "/menu");
        }
        /*
         * Confirm Payment
         */
        else if (action.equals("confirm")) {
            List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

            if (cartItems == null || cartItems.isEmpty()) {
                resp.sendRedirect(req.getContextPath() + "/menu");
                return;
            }

            String tableNumber = (String) session.getAttribute("tableNumber");

            Order order = new Order();

            order.setClient_id(user.getId());
            order.setTable_number(tableNumber);
            order.setStatus("Pending");

            OrderDAO orderDAO = new OrderDAOImpl();

            int orderId = orderDAO.addOrder(order, cartItems);

            if (orderId > 0) {
                PayDAO payDAO = new PayDAOImpl();
                // FIX: Now payMethod exists in session
                String payMethod = (String) session.getAttribute("payMethod");

                if (payMethod == null) {
                    payMethod = "Cash";
                }
                boolean paySuccess = payDAO.addPayCheck(orderId, payMethod);

                if (paySuccess) {
                    session.removeAttribute("cartItems");
                    session.removeAttribute("payMethod"); // Clean up
                    resp.sendRedirect(req.getContextPath() +
                            "/view/user/paymentresult.jsp?paymentSuccess=true");

                } else {
                    resp.sendRedirect(req.getContextPath() + "/view/user/paymentresult.jsp?paymentSuccess=false");
                }
            }
        }
    }
}