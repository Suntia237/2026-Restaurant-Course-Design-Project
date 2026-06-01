package com.ramijo.dao;

import com.ramijo.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AuthUtil {

    public static User getLoggedUser(
            HttpServletRequest req){

        HttpSession session = req.getSession(false);

        if(session == null){
            return null;
        }

        return (User) session.getAttribute("user");
    }
}