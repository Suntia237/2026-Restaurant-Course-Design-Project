package com.ramijo.dao;

import com.ramijo.model.Menu;
import com.ramijo.model.User;

import java.util.List;

public interface MenuDao {
    List<Menu> displayAllMenus();
    List<Menu> getMenusByCategory(String category);
    Menu getMenusById(int menuID);
    boolean addMenu(Menu menu);
}
