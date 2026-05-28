package com.ramijo.dao;

import com.ramijo.model.Menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class MenuDaoImpl implements MenuDao {

    private final DatabaseUtil databaseUtil = new DatabaseUtil();

    @Override
    List<Menu> menus displayAllMenus(){

        String sql = "SELECT * FROM MENU";

        try (
                Connection conn = databaseUtil.getConnection();
                Statement stmt = conn.createStatement()
        ) {

            stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error while adding user");
            e.printStackTrace();
        }

        return false;
    }
}
