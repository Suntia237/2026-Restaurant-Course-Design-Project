package com.ramijo.controller;

import com.ramijo.dao.MenuDao;
import com.ramijo.dao.MenuDaoImpl;
import com.ramijo.model.CartItem;
import com.ramijo.model.Menu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        MenuDao dao = new MenuDaoImpl();

        List<Menu> dishes = dao.getMenusByCategory("Food");
        List<Menu> drinks = dao.getMenusByCategory("Drink");

        req.setAttribute("dishes", dishes);
        req.setAttribute("drinks", drinks);

        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

        if(cartItems != null){

            for(Menu dish : dishes){

                for(CartItem item : cartItems){

                    if(dish.getMenu_id() == item.getMenu().getMenu_id()){
                        dish.setInCart(true);
                        break;
                    }
                }
            }

            for(Menu drink : drinks){

                for(CartItem item : cartItems){

                    if(drink.getMenu_id() == item.getMenu().getMenu_id()){

                        drink.setInCart(true);
                        break;
                    }
                }
            }
        }
        loadPage(
                req,
                resp,
                "Menu",
                "/view/user/menu.jsp",
                USER_LAYOUT
        );

    }
}