package com.ramijo.dao;

import com.ramijo.model.Menu;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuDaoImpl implements MenuDao {

    private final DatabaseUtil databaseUtil = new DatabaseUtil();

    @Override
    public List<Menu> displayAllMenus(){

        List<Menu> menuList = new ArrayList<Menu>();
        String sql = "SELECT * FROM MENU";

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try{
            conn = databaseUtil.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            if(rs!=null) {
                while (rs.next()) {
                    Menu menu = new Menu();
                    menu.setMenu_id(rs.getInt(1));
                    menu.setMenu_name(rs.getString(2));
                    menu.setPrice(rs.getInt(3));
                    menu.setCategory(rs.getString(4));
                    menu.setImg_url(rs.getString(5));

                    menuList.add(menu);
                }
            }

        } catch (SQLException e) {
            System.err.println("Error while fetching all menus !!!");
            e.printStackTrace();
        }
        finally {
            // the last step: release resourses
            databaseUtil.close(conn,stmt,rs);
        }

        return menuList;
    }
}
