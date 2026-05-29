package com.ramijo;

import com.ramijo.dao.MenuDao;
import com.ramijo.dao.MenuDaoImpl;
import com.ramijo.dao.UserDao;
import com.ramijo.dao.UserDaoImpl;
import com.ramijo.model.Menu;
import com.ramijo.model.User;

import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        MenuDao menuDao = new MenuDaoImpl();
        List<Menu> menus = new ArrayList<Menu>();
        menus = menuDao.displayAllMenus();
        for(Menu m : menus)
            System.out.println(m);
    }
}
