package com.ramijo.controller;

import com.ramijo.dao.MenuDao;
import com.ramijo.dao.MenuDaoImpl;
import com.ramijo.model.CartItem;
import com.ramijo.model.Menu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/add-to-cart")
public class AddToCardServlet extends BaseServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        int menuId = Integer.parseInt(req.getParameter("menuId"));

        MenuDao dao = new MenuDaoImpl();

        Menu menu = dao.getMenusById(menuId);
        CartItem cartItem = null;

        if(menu == null){
            resp.sendRedirect(req.getContextPath() + "/menu");
            System.out.println("Menu not found in db");
            return;
        }

        List<CartItem> cartItems =(List<CartItem>) session.getAttribute("cartItems");

        if(cartItems == null){
            cartItems = new ArrayList<>();
        }

        boolean found = false;

        for(CartItem item : cartItems){

            if(item.getMenu().getMenu_id() == menuId){
                item.setQuantity(item.getQuantity() + 1);
                break;
            }
        }

        if(!found){
            cartItem = new CartItem(menu, 1);
            cartItems.add(cartItem);
        }

        session.setAttribute("cartItems",cartItems);

        resp.sendRedirect(req.getContextPath() + "/menu");
    }
}