package com.ramijo.controller;

import com.ramijo.dao.AuthUtil;
import com.ramijo.dao.MenuDao;
import com.ramijo.dao.MenuDaoImpl;
import com.ramijo.model.CartItem;
import com.ramijo.model.Menu;
import com.ramijo.model.User;

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

            User user = AuthUtil.getLoggedUser(req);

            if(user == null) {
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }

            int menuId =
                    Integer.parseInt(req.getParameter("menuId"));

            MenuDao dao = new MenuDaoImpl();
            Menu menu = dao.getMenusById(menuId);

            if(menu == null) {
                resp.sendRedirect(req.getContextPath() + "/menu");
                return;
            }

            List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

            if(cartItems == null) {
                cartItems = new ArrayList<>();
            }

            boolean found = false;

            for(int i = 0; i < cartItems.size(); i++) {

                CartItem item = cartItems.get(i);

                if(item.getMenu().getMenu_id() == menuId) {
                    cartItems.remove(i);
                    found = true;
                    break;
                }
            }

            if(!found) {

                CartItem cartItem = new CartItem(menu, 1);

                cartItems.add(cartItem);
            }

            session.setAttribute("cartItems", cartItems);
            resp.sendRedirect(req.getContextPath() + "/menu");
        }
    }