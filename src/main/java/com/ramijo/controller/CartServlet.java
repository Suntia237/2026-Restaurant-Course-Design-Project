package com.ramijo.controller;

import com.ramijo.dao.AuthUtil;
import com.ramijo.model.CartItem;
import com.ramijo.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = AuthUtil.getLoggedUser(req);

        if(user == null){
            resp.sendRedirect(req.getContextPath()+"/login");

            return;
        }

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

        loadPage(
                req,
                resp,
                "My Cart",
                "/view/user/cart.jsp",
                BaseServlet.USER_LAYOUT
        );
    }
    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = AuthUtil.getLoggedUser(req);

        if(user == null){
            resp.sendRedirect(req.getContextPath()+"/login");

            return;
        }

        List<CartItem> cartItems =(List<CartItem>)session.getAttribute("cartItems");

        if(cartItems == null) {
            resp.sendRedirect(req.getContextPath() + "/cart");
            return;
        }

        int menuId = Integer.parseInt(req.getParameter("menuId"));

        String action =req.getParameter("action");

        Iterator<CartItem> iterator =cartItems.iterator();

        while(iterator.hasNext()) {

            CartItem item = iterator.next();
            if(item.getMenu().getMenu_id()== menuId) {

                if("add".equals(action)) {

                    item.setQuantity(
                            item.getQuantity() + 1);

                }
                else if("subtract".equals(action)) {

                    int quantity =
                            item.getQuantity() - 1;

                    if(quantity <= 0) {

                        iterator.remove();
                    }
                    else {

                        item.setQuantity(quantity);
                    }
                }
                else if("remove".equals(action)) {
                    iterator.remove();
                }

                break;
            }
        }

        session.setAttribute("cartItems",cartItems);

        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}