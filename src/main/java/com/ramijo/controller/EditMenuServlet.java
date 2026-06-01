//package com.ramijo.controller;
//
//import com.ramijo.dao.MenuDao;
//import com.ramijo.dao.MenuDaoImpl;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//@WebServlet("/editMenu")
//public class EditMenuServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
//            throws ServletException, IOException {
//
//        int id = Integer.parseInt(req.getParameter("id"));
//        String action = req.getParameter("action");
//
//        MenuDao dao = new MenuDaoImpl();
//
//        if(action.equals("delete")) {
//            boolean success = dao.deleteMenu(id);
//        }
//
//        System.out.println(id);
//        System.out.println(category);
//    }
//}
