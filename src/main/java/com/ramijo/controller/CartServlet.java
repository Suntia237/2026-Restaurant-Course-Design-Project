package com.ramijo.controller;

import com.ramijo.model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        if(cartItems == null){
            cartItems = new ArrayList<>();
        }

        int total = 0;

        for(CartItem item : cartItems){
            total += item.getSubtotal();
        }

        req.setAttribute("cartItems", cartItems);
        req.setAttribute("total", total);

        req.setAttribute("contentPage","/view/user/cart.jsp");

        req.setAttribute("pageTitle","My Cart");

        req.getRequestDispatcher("/view/user/layout.jsp").forward(req, resp);
    }
}