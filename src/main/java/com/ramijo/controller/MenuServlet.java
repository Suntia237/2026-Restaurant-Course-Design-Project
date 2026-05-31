package com.ramijo.controller;

public class MenuServlet {
    request.setAttribute("pageTitle", "Menu");
request.setAttribute("contentPage", "/view/pages/menu.jsp");

request.setAttribute("starters", starterList);
request.setAttribute("mainDishes", mainDishList);
request.setAttribute("drinks", drinkList);

request.getRequestDispatcher("/view/layout.jsp")
        .forward(request,response);
}
